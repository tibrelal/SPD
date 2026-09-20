module moving_average_filter (
    input wire CLK,
    input wire RESET,
    input wire DATA_IN,
    output reg [2:0] SUM_OUT,
    output reg [3:0] MOVING_AVG
);

    reg [3:0] shift_reg;

    always @(posedge CLK) begin
        if (RESET) begin
            shift_reg <= 4'b0000; 
        end else begin
            shift_reg <= {shift_reg[2:0], DATA_IN}; 
        end
    end

    always @(*) begin
        SUM_OUT = shift_reg[0] + shift_reg[1] + shift_reg[2] + shift_reg[3];
        
        MOVING_AVG = SUM_OUT >> 2; 
    end

endmodule
