%% 雷达脉冲压缩MATLAB仿真全流程详解 (含噪声分析)
% 
% 本脚本用于验证雷达%% 第二阶段：生成模拟ADC回波数据
% 生成用于测试的中频回波信号，包含线性调频、目标延迟等特性
% 
% 理论基础：
% LFM信号数学表达式: s(t) = cos(2π*f_start*t + π*k*t^2)
% 其中 k = B/τ 为调频斜率，f_start = IF_FREQ - B/2 为起始频率
% 信号经过量化处理，模拟ADC的数字化过程的正确性，为FPGA硬件实现提供参考。
% 
% 脚本功能：
% 1. 生成LFM（线性调频）雷达信号
% 2. 设计匹配滤波器
% 3. 仿真完整的脉冲压缩流程
% 4. 生成FPGA开发所需的.coe文件
% 5. 提供详细的可视化分析
% 
% 输出文件：
% - echo_rom_data.coe: 用于ROM初始化的回波数据
% - fir_coeffs_i.coe: FIR滤波器I路系数
% - fir_coeffs_q.coe: FIR滤波器Q路系数
% 输出文件：
% - echo_rom_data.coe: 用于ROM初始化的回波数据
% - fir_coeffs_i.coe: FIR滤波器I路系数
% - fir_coeffs_q.coe: FIR滤波器Q路系数
% - matched_filter_output.fig: 匹配滤波器输出的可视化结果

%% 第一阶段：系统参数设定
% 定义雷达系统的核心参数，包括FPGA时钟频率、ADC参数、雷达信号参数等

% --- FPGA与ADC相关的参数 ---
FPGA_CLK_FREQ = 100e6;       % FPGA系统时钟频率 (Hz), 100MHz
ADC_SAMPLE_RATE = FPGA_CLK_FREQ; % ADC采样率 (Hz), 假设与FPGA时钟相同
ADC_BITS = 12;               % ADC量化位数

% --- 雷达信号参数 ---
IF_FREQ = 20e6;              % 雷达接收机的模拟中频 (Hz), 20MHz
PULSE_WIDTH = 10e-6;         % 脉冲宽度 τ (s), 10μs
BANDWIDTH = 5e6;             % 信号带宽 B (Hz), 5MHz

% --- 仿真与滤波器参数 ---
TARGET_DELAY = 5e-6;         % 模拟目标的回波延迟 (s), 5μs
FIR_COEFF_BITS = 16;         % FIR滤波器系数的量化位数
DECIMATION_RATE = 10;        % DDC的抽取率

%% 第二阶段：生成“虚拟中频回波” —— 创造测试对象
% 我们的目标是创造一个数据文件，用它来假装是ADC的输出。这个信号必须包含*中频*、*线性调频*、*延迟*和*噪声*这四个真实回波的关键要素。
% 
% *理论核心*
% 
% 我们将根据LFM信号的数学公式 $s(t) = \cos(2\pi f_{start}t + \pi k t^2)$ 来生成波形。其中 $k$ 是调频斜率 $B/\tau$ ，起始频率 $f_{start}$ 是 $IF\_FREQ - B/2$ 。然后，我们手动给这个波形加上延迟和噪声，并进行*量化*，将其从电脑的浮点数转换为FPGA能识别的定点整数。

fprintf('正在生成ADC回波数据 (采样率: 100MHz)...\n');

% 1. 创建时间轴和计算调频斜率
ts_high = 1 / ADC_SAMPLE_RATE;
time_vector_pulse_high = 0:ts_high:PULSE_WIDTH-ts_high;
k = BANDWIDTH / PULSE_WIDTH;

% 2. 生成LFM中频信号
if_sig = cos(2 * pi * (IF_FREQ - BANDWIDTH/2) * time_vector_pulse_high + pi * k * time_vector_pulse_high.^2);

% 3. 添加目标延迟，模拟雷达回波的飞行时间
delay_samples = round(TARGET_DELAY / ts_high);
total_samples = length(time_vector_pulse_high) + delay_samples;
echo_signal = zeros(1, total_samples);
echo_signal(delay_samples+1 : end) = if_sig;

% 4. 添加高斯白噪声，模拟真实环境干扰
noise_power = 0.1;  % 噪声功率
noise = sqrt(noise_power) * randn(1, total_samples);  % 生成高斯白噪声
echo_signal_noisy = echo_signal + noise;  % 将噪声加到干净信号上

% 5. ADC量化处理并生成ROM初始化文件
% 将含噪声的浮点信号量化为12位定点数，用于FPGA中ROM的初始化
max_val = max(abs(echo_signal_noisy)); 
echo_quantized = round((echo_signal_noisy / max_val) * (2^(ADC_BITS-1) - 1)); 
write_rom_coe('echo_rom_data.coe', echo_quantized);
fprintf('成功生成ROM初始化文件: echo_rom_data.coe\n');

% 6. 可视化噪声前后的对比
figure('Name', '噪声对比分析');
subplot(3,1,1);
plot(echo_signal);
title('干净回波信号 (无噪声)');
xlabel('采样点序号'); ylabel('幅度'); grid on;

subplot(3,1,2);
plot(noise);
title(['高斯白噪声 (功率: ', num2str(noise_power), ')']);
xlabel('采样点序号'); ylabel('幅度'); grid on;

subplot(3,1,3);
plot(echo_signal_noisy);
title('含噪回波信号 (信号+噪声)');
xlabel('采样点序号'); ylabel('幅度'); grid on;

fprintf('噪声分析: SNR = %.2f dB\n', 10*log10(var(echo_signal)/var(noise)));
fprintf('完成噪声添加和可视化\n\n');


%% 第三阶段：设计匹配滤波器
% 基于DDC抽取后的采样率设计FIR匹配滤波器
% 
% 设计原理：
% 1. 匹配滤波器系数为发射信号的时间反褶复共轭
% 2. 使用汉明窗抑制旁瓣
% 3. 滤波器工作在10MHz采样率下，系数数量为100个
fprintf('正在生成匹配滤波器系数 (采样率: 10MHz)...\n');

% 1. 计算FIR滤波器的工作采样率
FIR_SAMPLE_RATE = ADC_SAMPLE_RATE / DECIMATION_RATE;
ts_low = 1 / FIR_SAMPLE_RATE;
% 脉冲宽度不变，采样点数减少到100个 (10μs × 10MHz = 100)
time_vector_pulse_low = 0:ts_low:PULSE_WIDTH-ts_low;

% 2. 生成基带LFM参考信号
ref_baseband_low = exp(1j * pi * k * time_vector_pulse_low.^2);

% 3. 生成两种窗函数的滤波器系数进行对比
% 3.1 汉明窗滤波器系数（用于FPGA实现）
win_hamming = hamming(length(ref_baseband_low))';
ref_windowed_hamming = ref_baseband_low .* win_hamming;
matched_filter_coeffs_hamming = conj(fliplr(ref_windowed_hamming));

% 3.2 矩形窗滤波器系数（即不加窗，用于对比）
matched_filter_coeffs_rect = conj(fliplr(ref_baseband_low));

% 保持原变量名用于后续兼容
matched_filter_coeffs = matched_filter_coeffs_hamming;

fprintf('汉明窗滤波器系数数量: %d\n', length(matched_filter_coeffs_hamming));
fprintf('矩形窗滤波器系数数量: %d\n', length(matched_filter_coeffs_rect));

% 4. 量化汉明窗系数并生成FIR IP核的初始化文件
coeffs_i_quantized = round(real(matched_filter_coeffs_hamming) * (2^(FIR_COEFF_BITS-1) - 1));
coeffs_q_quantized = round(imag(matched_filter_coeffs_hamming) * (2^(FIR_COEFF_BITS-1) - 1));
write_fir_coe('fir_coeffs_i.coe', coeffs_i_quantized);
fprintf('成功生成FIR系数文件: fir_coeffs_i.coe\n');
write_fir_coe('fir_coeffs_q.coe', coeffs_q_quantized);
fprintf('成功生成FIR系数文件: fir_coeffs_q.coe\n\n');


%% 第四阶段：完整且正确的流程仿真 (包含所有中间步骤的可视化)
% ============================ 关键修正点 ================================
% 仿真流程现在必须包含与FPGA完全一致的“抽取”步骤。
% ========================================================================
fprintf('开始脉冲压缩仿真...\n');

% 1. DDC下变频处理
nco = exp(-1j * 2 * pi * IF_FREQ * (0:total_samples-1) * ts_high);
received_baseband_100MHz = echo_quantized .* nco;

% 2. 10倍抽取处理
% 使用decimate函数进行抗混叠滤波和降采样，模拟CIC滤波器功能
received_baseband_10MHz = decimate(received_baseband_100MHz, DECIMATION_RATE);

% 3. 匹配滤波器处理（脉冲压缩）- 分别用两种窗函数
compressed_signal_hamming = conv(received_baseband_10MHz, matched_filter_coeffs_hamming);
compressed_signal_rect = conv(received_baseband_10MHz, matched_filter_coeffs_rect);

% 保持原变量名用于后续兼容
compressed_signal = compressed_signal_hamming;

% 4. 幅度检测
compressed_magnitude_hamming = abs(compressed_signal_hamming);
compressed_magnitude_rect = abs(compressed_signal_rect);
compressed_magnitude = compressed_magnitude_hamming; % 用于后续插值

% 调试信息
fprintf('仿真计算完成\n');
fprintf('调试信息:\n');
fprintf('  输入信号长度: %d\n', length(received_baseband_10MHz));
fprintf('  汉明窗系数长度: %d\n', length(matched_filter_coeffs_hamming));
fprintf('  矩形窗系数长度: %d\n', length(matched_filter_coeffs_rect));
fprintf('  汉明窗压缩结果长度: %d, 最大值: %.2e\n', length(compressed_magnitude_hamming), max(compressed_magnitude_hamming));
fprintf('  矩形窗压缩结果长度: %d, 最大值: %.2e\n', length(compressed_magnitude_rect), max(compressed_magnitude_rect));

% 额外的数据完整性检查
fprintf('\n=== 数据完整性验证 ===\n');
fprintf('汉明窗压缩信号stats: 长度=%d, 实部范围=[%.2e, %.2e], 虚部范围=[%.2e, %.2e]\n', ...
    length(compressed_signal_hamming), min(real(compressed_signal_hamming)), max(real(compressed_signal_hamming)), ...
    min(imag(compressed_signal_hamming)), max(imag(compressed_signal_hamming)));
fprintf('矩形窗压缩信号stats: 长度=%d, 实部范围=[%.2e, %.2e], 虚部范围=[%.2e, %.2e]\n', ...
    length(compressed_signal_rect), min(real(compressed_signal_rect)), max(real(compressed_signal_rect)), ...
    min(imag(compressed_signal_rect)), max(imag(compressed_signal_rect)));

% 检查是否有NaN或Inf值
has_nan_hamming = any(isnan(compressed_magnitude_hamming)) || any(isinf(compressed_magnitude_hamming));
has_nan_rect = any(isnan(compressed_magnitude_rect)) || any(isinf(compressed_magnitude_rect));
fprintf('数据有效性: 汉明窗有异常值=%s, 矩形窗有异常值=%s\n', ...
    mat2str(has_nan_hamming), mat2str(has_nan_rect));

%% 结果可视化与分析
% 图1: LFM信号本身
figure('Name', 'LFM信号自身特性可视化');
subplot(2,1,1);
plot(time_vector_pulse_high*1e6, if_sig);
title('LFM中频信号时域波形 (前2μs)');
xlabel('时间 (μs)'); ylabel('幅度'); grid on; xlim([0 2]);
subplot(2,1,2);
spectrogram(if_sig, hamming(256), 250, 256, ADC_SAMPLE_RATE, 'yaxis');
title('LFM信号的时频谱 (Chirp特性)');

% 图2: ADC量化后的回波数据
figure('Name', 'ADC量化回波数据');
plot(echo_quantized);
title(['ADC量化后的含噪回波数据 (', num2str(ADC_BITS), '位量化)']);
xlabel('采样点序号 (100MHz采样率)'); ylabel('量化值'); grid on;

% 图3: DDC下变频和抽取后的基带I/Q信号
figure('Name', 'DDC输出基带信号');
subplot(2,1,1);
plot(real(received_baseband_10MHz));
title('I路基带信号 (DDC输出)');
xlabel('采样点序号 (10MHz采样率)'); ylabel('幅度'); grid on;
subplot(2,1,2);
plot(imag(received_baseband_10MHz));
title('Q路基带信号 (DDC输出)');
xlabel('采样点序号 (10MHz采样率)'); ylabel('幅度'); grid on;

% 图4: 匹配滤波器输出的I/Q信号
figure('Name', '匹配滤波器输出');
subplot(2,1,1);
plot(real(compressed_signal));
title('I路匹配滤波输出');
xlabel('采样点序号 (10MHz采样率)'); ylabel('幅度'); grid on;
subplot(2,1,2);
plot(imag(compressed_signal));
title('Q路匹配滤波输出');
xlabel('采样点序号 (10MHz采样率)'); ylabel('幅度'); grid on;

% 图5: 脉冲压缩最终结果
figure('Name', '脉冲压缩结果');
plot(compressed_magnitude);
title('脉冲压缩幅度输出');
xlabel('采样点序号 (10MHz采样率)');
ylabel('幅度');
grid on;
[max_val, max_idx] = max(compressed_magnitude);
hold on;
plot(max_idx, max_val, 'r*', 'MarkerSize', 10);
text(max_idx, max_val, ['峰值位置: ', num2str(max_idx)], 'VerticalAlignment','bottom');

% 图6: 矩形窗 vs 汉明窗 脉冲压缩对比图
fprintf('\n=== 窗函数对比分析开始 ===\n');

% 确保使用完整数据进行分析
figure('Name', '脉冲压缩结果对比：矩形窗 vs 汉明窗');

% 调试信息
fprintf('矩形窗压缩结果: 长度=%d, 最大值=%.4e, 最小值=%.4e\n', ...
    length(compressed_magnitude_rect), max(compressed_magnitude_rect), min(compressed_magnitude_rect));
fprintf('汉明窗压缩结果: 长度=%d, 最大值=%.4e, 最小值=%.4e\n', ...
    length(compressed_magnitude_hamming), max(compressed_magnitude_hamming), min(compressed_magnitude_hamming));

% 创建x轴向量
x_axis_rect = 1:length(compressed_magnitude_rect);
x_axis_hamming = 1:length(compressed_magnitude_hamming);

% 绘制完整波形对比
subplot(2,1,1); % 上半部分：线性刻度
plot(x_axis_rect, compressed_magnitude_rect, 'b-', 'LineWidth', 1.2, 'DisplayName', '矩形窗 (无加窗)');
hold on;
plot(x_axis_hamming, compressed_magnitude_hamming, 'r-', 'LineWidth', 1.2, 'DisplayName', '汉明窗');

% 标记峰值位置
[max_rect, idx_rect] = max(compressed_magnitude_rect);
[max_hamming, idx_hamming] = max(compressed_magnitude_hamming);

plot(idx_rect, max_rect, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'blue');
plot(idx_hamming, max_hamming, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'red');

title('脉冲压缩结果对比：矩形窗 vs 汉明窗 (线性刻度)');
xlabel('采样点序号 (10MHz采样率)');
ylabel('幅度');
grid on;
legend('show', 'Location', 'best');
hold off;

% 下半部分：dB刻度显示旁瓣细节
subplot(2,1,2);

% 归一化处理
rect_norm = compressed_magnitude_rect / max(compressed_magnitude_rect);
hamming_norm = compressed_magnitude_hamming / max(compressed_magnitude_hamming);

% 防止log(0)错误，设置最小值
rect_norm_safe = max(rect_norm, 1e-6);
hamming_norm_safe = max(hamming_norm, 1e-6);

% 转换为dB
rect_db = 20 * log10(rect_norm_safe);
hamming_db = 20 * log10(hamming_norm_safe);

% 确保x轴向量长度正确
fprintf('dB子图调试: rect_db长度=%d, hamming_db长度=%d\n', length(rect_db), length(hamming_db));
fprintf('dB值范围: rect=[%.1f, %.1f], hamming=[%.1f, %.1f]\n', ...
    min(rect_db), max(rect_db), min(hamming_db), max(hamming_db));

% 重新定义x轴以确保正确对应
x_rect_db = 1:length(rect_db);
x_hamming_db = 1:length(hamming_db);

plot(x_rect_db, rect_db, 'b-', 'LineWidth', 1.2, 'DisplayName', '矩形窗 (无加窗)');
hold on;
plot(x_hamming_db, hamming_db, 'r-', 'LineWidth', 1.2, 'DisplayName', '汉明窗');

title('脉冲压缩结果对比：矩形窗 vs 汉明窗 (dB刻度)');
xlabel('采样点序号 (10MHz采样率)');
ylabel('归一化幅度 (dB)');
ylim([-60, 5]);
xlim([1, max(length(rect_db), length(hamming_db))]); % 明确设置x轴范围
grid on;
legend('show', 'Location', 'best');

% 添加-13.2dB理论参考线
yline(-13.2, '--k', '矩形窗理论第一旁瓣 (-13.2dB)', 'LabelHorizontalAlignment', 'left');

fprintf('矩形窗峰值：位置=%d, 幅度=%.4e\n', idx_rect, max_rect);
fprintf('汉明窗峰值：位置=%d, 幅度=%.4e\n', idx_hamming, max_hamming);
fprintf('理论分析：汉明窗应显示更低的旁瓣（约-43dB vs 矩形窗-13dB）\n');

hold off;

% 创建独立的dB刻度对比图（避免subplot问题）
figure('Name', 'dB刻度详细对比');

% 重新计算dB数据
rect_norm_new = compressed_magnitude_rect / max(compressed_magnitude_rect);
hamming_norm_new = compressed_magnitude_hamming / max(compressed_magnitude_hamming);

% 处理零值和负值
rect_norm_new(rect_norm_new <= 0) = 1e-8;
hamming_norm_new(hamming_norm_new <= 0) = 1e-8;

rect_db_new = 20 * log10(rect_norm_new);
hamming_db_new = 20 * log10(hamming_norm_new);

% 绘制dB对比
plot(1:length(rect_db_new), rect_db_new, 'b-', 'LineWidth', 1.5, 'DisplayName', '矩形窗 (无加窗)');
hold on;
plot(1:length(hamming_db_new), hamming_db_new, 'r-', 'LineWidth', 1.5, 'DisplayName', '汉明窗');

title('脉冲压缩结果对比 - dB刻度（旁瓣分析）');
xlabel('采样点序号 (10MHz采样率)');
ylabel('归一化幅度 (dB)');
ylim([-60, 5]);
grid on;
legend('show', 'Location', 'best');

% 标记峰值
plot(idx_rect, 0, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'blue');
plot(idx_hamming, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'red');

% 添加理论参考线
yline(-13.2, '--k', '矩形窗理论第一旁瓣 (-13.2dB)');
yline(-43, '--g', '汉明窗理论第一旁瓣 (~-43dB)');

fprintf('dB图调试完成: rect_db范围=[%.1f, %.1f], hamming_db范围=[%.1f, %.1f]\n', ...
    min(rect_db_new), max(rect_db_new), min(hamming_db_new), max(hamming_db_new));

hold off;

% 添加峰值标记
[~, peak_idx_rect] = max(compressed_magnitude_rect);
[~, peak_idx_hamming] = max(compressed_magnitude_hamming);
plot(peak_idx_rect, 0, 'b^', 'MarkerSize', 8, 'MarkerFaceColor', 'blue');
plot(peak_idx_hamming, 0, 'r^', 'MarkerSize', 8, 'MarkerFaceColor', 'red');

% 输出分析结果
fprintf('\n=== 窗函数对比分析结果 ===\n');
fprintf('矩形窗峰值位置: %d\n', peak_idx_rect);
fprintf('汉明窗峰值位置: %d\n', peak_idx_hamming);
fprintf('理论第一旁瓣电平: -13.2 dB (矩形窗)\n');
fprintf('汉明窗可将旁瓣抑制到约 -43 dB\n');
fprintf('主瓣宽度: 汉明窗比矩形窗略宽，但旁瓣抑制效果显著\n');

%% 辅助函数定义
% =========================================================================
% 函数1: 生成ROM初始化文件 (Block Memory Generator格式)
% =========================================================================
function write_rom_coe(filename, data)
    fid = fopen(filename, 'w');
    fprintf(fid, 'memory_initialization_radix=10;\n');
    fprintf(fid, 'memory_initialization_vector=\n');
    for i = 1:length(data)-1
        fprintf(fid, '%d,\n', data(i));
    end
    fprintf(fid, '%d;', data(end));
    fclose(fid);
end

% =========================================================================
% 函数2: 生成FIR滤波器系数文件 (FIR Compiler格式)
% =========================================================================
function write_fir_coe(filename, data)
    fid = fopen(filename, 'w');
    fprintf(fid, 'radix = 10;\n');     % 十进制格式
    fprintf(fid, 'coefdata = \n');   % FIR系数数据标识
    for i = 1:length(data)-1
        fprintf(fid, '%d,\n', data(i));
    end
    fprintf(fid, '%d;', data(end));
    fclose(fid);
end

%% 第五阶段：设计用于DAC输出的10倍插值FIR滤波器
fprintf('正在设计10倍插值FIR滤波器...\n');

L = 10; % 插值倍数
Fs_low = 10e6; % 输入采样率 (Hz)
Fs_high = 100e6; % 输出采样率 (Hz)

% 滤波器设计参数
N = 79; % 滤波器阶数 (修改为奇数，产生80个系数，满足IP核偶数要求)
Fpass = 4e6; % 通带频率 (Hz), 需低于 Fs_low/2
Fstop = 6e6; % 阻带频率 (Hz)

% 使用 firpm (Parks-McClellan) 算法设计一个最优的低通滤波器
% 注意：设计时的采样率要用最终的高采样率 Fs_high
b = firpm(N, [0 Fpass Fstop Fs_high/2]/(Fs_high/2), [1 1 0 0]);

% FIR插值滤波器的系数需要乘以插值倍数 L
coeffs_interp = b * L;

% 将系数转换为16位定点数，并生成.coe文件
FIR_INTERP_COEFF_BITS = 16;
coeffs_interp_quantized = round(coeffs_interp * (2^(FIR_INTERP_COEFF_BITS-1) - 1));

% 写入FIR IP核所需的.coe文件
write_fir_coe('fir_coeffs_interp.coe', coeffs_interp_quantized);
fprintf('成功生成插值FIR系数文件: fir_coeffs_interp.coe\n');

% 可视化滤波器响应
figure('Name', '插值FIR滤波器特性');
freqz(coeffs_interp, 1, 1024, Fs_high);
title('10倍插值FIR滤波器频域响应');

fprintf('插值FIR滤波器设计完成\n');
fprintf('滤波器阶数: %d\n', N);
fprintf('系数数量: %d\n', length(coeffs_interp));
fprintf('通带频率: %.1f MHz\n', Fpass/1e6);
fprintf('阻带频率: %.1f MHz\n\n', Fstop/1e6);


%% 第六阶段：仿真FIR插值效果
% ======================== 新增仿真代码：开始 ===========================
fprintf('开始仿真FIR插值对脉冲压缩结果的影响...\n');

% 1. 对脉冲压缩后的幅度信号进行插值
%    使用 upfirdn 函数可以一步完成上采样、滤波和下采样。
%    我们将 'compressed_magnitude' (第四阶段的结果) 上采样L倍，并用插值滤波器滤波。
interpolated_magnitude = upfirdn(compressed_magnitude, coeffs_interp, L, 1);

% 2. 创建新的坐标轴用于绘图，以便清晰对比
%    原始信号有 M 个点，插值后有 M*L 个点。新坐标轴可以更好地展示插值效果。
time_axis_original = 1:length(compressed_magnitude);
time_axis_interpolated = (0:length(interpolated_magnitude)-1) / L; 

% 3. 可视化插值前后的对比
figure('Name', '脉冲压缩幅度插值前后对比');
hold on;
% 绘制插值前的数据点 (用'o'标记原始采样点)
stem(time_axis_original, compressed_magnitude, 'LineStyle', 'none', 'Marker', 'o', 'DisplayName', '原始采样点 (10MHz速率)');
% 绘制插值后的平滑曲线
plot(time_axis_interpolated, interpolated_magnitude, 'DisplayName', '插值后波形 (100MHz速率)');
hold off;
title('FIR插值对脉冲压缩幅度信号的影响');
xlabel('采样点序号 (以10MHz速率为基准)');
ylabel('幅度');
legend;
grid on;

fprintf('插值仿真完成，已生成对比图。\n');
% ======================== 新增仿真代码：结束 ===========================

% ======================== 在脚本末尾新增：开始 ===========================
fprintf('正在将MATLAB仿真结果写入文件...\n');

% 打开一个文件用于写入
fileID = fopen('matlab_fir_output.txt','w');

% 将插值后的数据四舍五入为整数（与硬件中的定点数对应）并写入文件
% 硬件输出是48位整数，这里直接写入浮点数取整后的结果
fprintf(fileID, '%d\n', round(interpolated_magnitude));

% 关闭文件
fclose(fileID);
fprintf('成功将结果写入 matlab_fir_output.txt\n');
% ======================== 在脚本末尾新增：结束 ===========================
