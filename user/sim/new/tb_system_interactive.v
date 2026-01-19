`timescale 1ns / 1ps

// =============================================================================
// Final Testbench for Interactive System Top (Single Button, Fast Sim)
// Module: tb_system_interactive
// Description:
//   - Fast simulation to display all 7 waveforms sequentially
//   - Single button (F20) cycles through waveforms 0→1→2→3→4→5→6→0...
//   - Each waveform displayed for 30us observation period
//   - Uses reduced debounce time for speed (NOTE: Change back for hardware!)
// =============================================================================
module tb_system_interactive;

    // --- Inputs to system_top ---
    reg clk_pin_in;
    reg btn_next_pin;

    // --- Outputs from system_top ---
    wire uart_tx_pin_out;
    wire dac_clk_pin;
    wire dac_pd_pin;
    wire [7:0] dac_data_pins;

    // 1. Instantiate the DUT (Design Under Test - Single Button Version)
    system_top u_system_top (
        .clk_pin_in(clk_pin_in),
        .uart_tx_pin_out(uart_tx_pin_out),
        .dac_clk_pin(dac_clk_pin),
        .dac_pd_pin(dac_pd_pin),
        .dac_data_pins(dac_data_pins),
        .btn_next_pin(btn_next_pin)
    );

    // 2. Generate 50MHz clock
    initial begin
        clk_pin_in = 0;
        forever #10 clk_pin_in = ~clk_pin_in;
    end
      
    // 3. Fast simulation stimulus to display all 7 waveforms (Single Button Version)
    initial begin
        // Initialize
        btn_next_pin = 0;
        #200; // Wait for reset
        
        $display("--- Starting Fast Waveform Display Sequence ---");
        
        // --- Waveform 0: Clean IF ---
        $display("Displaying Waveform 0 (Clean IF)...");
        #30000; // Display for 30us

        // --- Switch to Waveform 1: Noisy IF ---
        $display("Switching to Waveform 1 (Noisy IF)...");
        btn_next_pin = 1; #20; btn_next_pin = 0; 
        #30000; // Display for 30us

        // --- Switch to Waveform 2: DDC I-Channel ---
        $display("Switching to Waveform 2 (DDC I)...");
        btn_next_pin = 1; #20; btn_next_pin = 0;
        #30000; // Display for 30us

        // --- Switch to Waveform 3: DDC Q-Channel ---
        $display("Switching to Waveform 3 (DDC Q)...");
        btn_next_pin = 1; #20; btn_next_pin = 0;
        #30000; // Display for 30us

        // --- Switch to Waveform 4: Compressed I-Channel ---
        $display("Switching to Waveform 4 (Compressed I)...");
        btn_next_pin = 1; #20; btn_next_pin = 0;
        #30000; // Display for 30us
        
        // --- Switch to Waveform 5: Compressed Q-Channel ---
        $display("Switching to Waveform 5 (Compressed Q)...");
        btn_next_pin = 1; #20; btn_next_pin = 0;
        #30000; // Display for 30us

        // --- Switch to Waveform 6: Final Interpolated Magnitude ---
        $display("Switching to Waveform 6 (Final Magnitude)...");
        btn_next_pin = 1; #20; btn_next_pin = 0;
        #30000; // Display for 30us

        $display("--- Fast Sequence Finished (Total: ~210us) ---");
        $finish;
    end
      
endmodule