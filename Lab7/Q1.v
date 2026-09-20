module LFSR (
    input CLOCK,
    input RESET,
    output reg [3:0] Q
);

    wire feedback;
    assign feedback = Q[3] ^ Q[0];

    always @(posedge CLOCK) begin
        if (RESET) begin
            Q <= 4'b0001; 
        end else begin
            Q <= {Q[2:0], feedback}; 
        end
    end

endmodule
