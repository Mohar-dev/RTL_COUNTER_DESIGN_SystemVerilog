`timescale 1ns / 1ps

module tb_binary_counter;

logic clk;
logic rst;
logic [3:0] count;

binary_counter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
);

// Clock generation
initial clk = 0;
always #5 clk = ~clk;  // 10ns period

// Test sequence
initial begin
    $monitor("Time = %0t | Count = %b", $time, count);

    rst = 1;
    #10;
    rst = 0;

    #200;
    $finish;
end

endmodule