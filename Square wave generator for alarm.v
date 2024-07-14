module alarm(
    input wire clk,         // System clock
    input wire binary_in,   // 1-bit binary input
    output reg pwm_out      // PWM output for sound signal
);

    reg [15:0] counter;     // 16-bit counter for PWM generation
    reg [15:0] threshold;   // Threshold for PWM comparison

    always @(posedge clk) begin
        counter <= counter + 1;
        if (binary_in == 1'b1) begin
            threshold <= 16'd32768;  // Set threshold to 1/2 of the counter's max value
        end else begin
            threshold <= 16'd0;  // Set threshold to 1/2 of the counter's max value
        end
    end

    always @(posedge clk) begin
        if (counter < threshold) begin
            pwm_out <= 1;
        end else begin
            pwm_out <= 0;
        end
    end

endmodule
