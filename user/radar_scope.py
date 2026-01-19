import sys
import time
import serial
import serial.tools.list_ports
import numpy as np
import pyqtgraph as pg
from PyQt5.QtWidgets import QApplication, QMainWindow, QVBoxLayout, QWidget, QComboBox, QPushButton, QLabel, QHBoxLayout
from PyQt5.QtCore import QTimer, QThread, pyqtSignal
from collections import deque

# ================= 配置区域 =================
# 如果你有板子，改为 False；如果想先看效果，改为 True
SIMULATION_MODE = False  

# 串口设置
BAUD_RATE = 115200   # 请确保这里和 FPGA 的波特率一致！
DATA_POINTS = 2000   # 屏幕上显示的点的数量
# ===========================================

class SerialReader(QThread):
    """独立的串口读取线程，专门处理 16进制 A5 5A 协议"""
    data_received = pyqtSignal(float)

    def __init__(self, port, baud):
        super().__init__()
        self.port = port
        self.baud = baud
        self.running = False
        self.buffer = bytearray() # 用于缓存接收到的原始字节

    def run(self):
        self.running = True
        
        if SIMULATION_MODE:
            # === 模拟模式 (保持不变) ===
            t = 0
            while self.running:
                noise = np.random.normal(0, 5000)
                pulse = 0
                if (t % 500) == 0: pulse = 500000 
                elif (t % 500) in [1, -1]: pulse = 200000
                val = max(0, pulse * np.exp(-0.01 * ((t % 500) - 20)**2) + noise)
                self.data_received.emit(val)
                t += 1
                time.sleep(0.001)
        else:
            # === 真实串口读取 (针对你的 A5 5A 协议修改) ===
            try:
                self.ser = serial.Serial(self.port, self.baud, timeout=0.1)
                print(f"Connected to {self.port}")
                
                while self.running and self.ser.is_open:
                    # 1. 读取串口缓冲区的所有数据
                    if self.ser.in_waiting:
                        raw_data = self.ser.read(self.ser.in_waiting)
                        self.buffer.extend(raw_data)

                    # 2. 解析数据帧 (帧头 A5 5A, 总长 6字节)
                    while len(self.buffer) >= 6:
                        # 检查前两个字节是否是 A5 5A
                        if self.buffer[0] == 0xA5 and self.buffer[1] == 0x5A:
                            # 找到帧头！提取后4个字节作为数据
                            # 假设是 Big Endian (高位在前)，根据你发的 00 00 5C C0 推断
                            data_bytes = self.buffer[2:6]
                            val = int.from_bytes(data_bytes, byteorder='big', signed=False)
                            
                            self.data_received.emit(val)
                            
                            # 移除已处理的这 6 个字节
                            self.buffer = self.buffer[6:]
                        else:
                            # 如果开头不是 A5 5A，说明错位了，丢弃第1个字节，继续往后找
                            self.buffer.pop(0)
                    
                    # 稍微休息一下，避免死循环占用 CPU
                    time.sleep(0.001)

            except Exception as e:
                print(f"Serial Error: {e}")

    def stop(self):
        self.running = False
        if not SIMULATION_MODE and hasattr(self, 'ser'):
            self.ser.close()

class RadarScope(QMainWindow):
    def __init__(self):
        super().__init__()
        self.init_ui()
        self.data_buffer = deque([0]*DATA_POINTS, maxlen=DATA_POINTS)
        self.reader = None

    def init_ui(self):
        self.setWindowTitle("FPGA Radar Pulse Compression Monitor (Hex Mode)")
        self.resize(1000, 600)
        
        # === 1. 设置绘图风格 (雷达绿) ===
        pg.setConfigOption('background', 'k') 
        pg.setConfigOption('foreground', '#00FF00')
        
        # === 2. 创建绘图控件 ===
        self.plot_widget = pg.PlotWidget(title="Real-time Amplitude Output")
        self.plot_widget.showGrid(x=True, y=True, alpha=0.3)
        self.plot_widget.setLabel('left', 'Amplitude', units='Raw')
        self.plot_widget.setLabel('bottom', 'Sample Index', units='n')
        
        # 创建曲线
        self.curve = self.plot_widget.plot(pen=pg.mkPen(color='#00FF00', width=2))
        self.fill = pg.FillBetweenItem(self.curve, self.plot_widget.plot(), brush=(0, 255, 0, 50))
        self.plot_widget.addItem(self.fill)

        # 峰值标记线
        self.peak_line = pg.InfiniteLine(angle=0, movable=False, pen=pg.mkPen('r', style=pg.QtCore.Qt.DashLine))
        self.plot_widget.addItem(self.peak_line)
        self.peak_label = pg.TextItem(text="Peak: 0", color=(255, 0, 0), anchor=(0, 1))
        self.plot_widget.addItem(self.peak_label)

        # === 3. 顶部控制栏 ===
        ctrl_layout = QHBoxLayout()
        self.port_box = QComboBox()
        self.refresh_ports()
        
        self.btn_start = QPushButton("Connect & Start")
        self.btn_start.setStyleSheet("background-color: #005500; color: white; font-weight: bold;")
        self.btn_start.clicked.connect(self.toggle_capture)

        self.lbl_status = QLabel("Status: Idle")
        self.lbl_status.setStyleSheet("color: gray;")

        ctrl_layout.addWidget(QLabel("Port:"))
        ctrl_layout.addWidget(self.port_box)
        ctrl_layout.addWidget(self.btn_start)
        ctrl_layout.addWidget(self.lbl_status)
        ctrl_layout.addStretch()

        # === 4. 布局组合 ===
        main_layout = QVBoxLayout()
        main_layout.addLayout(ctrl_layout)
        main_layout.addWidget(self.plot_widget)

        container = QWidget()
        container.setLayout(main_layout)
        self.setCentralWidget(container)

        # === 5. 定时刷新显示 ===
        self.timer = QTimer()
        self.timer.timeout.connect(self.update_plot)
        self.timer.start(30) 

    def refresh_ports(self):
        self.port_box.clear()
        self.port_box.addItem("Simulation Mode")
        ports = serial.tools.list_ports.comports()
        for p in ports:
            self.port_box.addItem(p.device)

    def toggle_capture(self):
        if self.reader and self.reader.isRunning():
            self.reader.stop()
            self.reader.wait()
            self.btn_start.setText("Connect & Start")
            self.btn_start.setStyleSheet("background-color: #005500; color: white;")
            self.lbl_status.setText("Status: Stopped")
            self.lbl_status.setStyleSheet("color: gray;")
        else:
            txt = self.port_box.currentText()
            if txt == "Simulation Mode":
                global SIMULATION_MODE
                SIMULATION_MODE = True
                port = "SIM"
            else:
                SIMULATION_MODE = False
                port = txt
            
            self.reader = SerialReader(port, BAUD_RATE)
            self.reader.data_received.connect(self.on_data_received)
            self.reader.start()
            self.btn_start.setText("Stop")
            self.btn_start.setStyleSheet("background-color: #550000; color: white;")
            self.lbl_status.setText(f"Status: Running on {port}")
            self.lbl_status.setStyleSheet("color: #00FF00;")

    def on_data_received(self, value):
        self.data_buffer.append(value)

    def update_plot(self):
        data = np.array(self.data_buffer)
        self.curve.setData(data)
        
        # 强制 Y 轴自动缩放 (防止波形太小看不见)
        self.plot_widget.enableAutoRange('y', True)
        
        if len(data) > 0:
            peak_val = np.max(data)
            self.peak_line.setValue(peak_val)
            self.peak_label.setText(f"Peak: {peak_val:.0f}")
            self.peak_label.setPos(0, peak_val)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = RadarScope()
    window.show()
    sys.exit(app.exec_())