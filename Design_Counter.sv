// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module binary_counter (
    input logic clk,
    input logic rst,
    output logic [3:0] count
);

logic [3:0] count_reg;

always_ff @(posedge clk or posedge rst) begin
    if (rst)
        count_reg <= 4'b0000;
    else if (count_reg == 4'b1111)
        count_reg <= 4'b0000;
    else
        count_reg <= count_reg + 1;
end

assign count = count_reg;

endmodule