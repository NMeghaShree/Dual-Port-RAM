`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2025 18:08:51
// Design Name: 
// Module Name: dual_port_RAM_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();
    parameter ADDR_WIDTH = 4;
    parameter DATA_WIDTH = 8;
    parameter DEPTH = 16;
    reg cs;
    reg [DATA_WIDTH-1:0] data_a, data_b;  
    reg [ADDR_WIDTH-1:0] addr_a, addr_b;  
    reg we_a, we_b, oe_a, oe_b=1;       
    reg clk;
    integer i;
    wire [DATA_WIDTH-1:0] q_a, q_b;
    wire [DATA_WIDTH-1:0] tbdata_a, tbdata_b;
    dual_port_sync_ram #(.DATA_WIDTH(DATA_WIDTH)) dut(
    .data_a(tbdata_a),
    .cs(cs),
    .data_b(tbdata_b), 
    .addr_a(addr_a),
    .addr_b(addr_b),  
    .we_a(we_a), 
    .we_b(we_b), 
    .oe_a(oe_a), 
    .oe_b(oe_b),          
    .clk(clk),
    .q_a(q_a), 
    .q_b(q_b));
    always #10 clk=~clk;
    
    assign tbdata_a = !oe_a ? data_a : 'hz;
    assign tbdata_b = !oe_b ? data_b : 'hz;
     
    
   

  initial begin
    {clk, cs, we_a, we_b, addr_a, addr_b, data_a, data_b, oe_a} <= 0;

    repeat (2) @ (posedge clk);

    for ( i = 0; i < 8; i= i+1) begin
      repeat (1) @(posedge clk) addr_a <= i; we_a <= 1; cs <=1; oe_a <= 0; data_a <= $random;
    end

    for ( i = 0; i < 8; i= i+1) begin
      repeat (1) @(posedge clk) addr_a <= i; we_a <= 0; cs <= 1; oe_a <= 1;
    end
    
    for ( i = 8; i < 16; i= i+1) begin
      repeat (1) @(posedge clk) addr_b <= i; we_b <= 1; cs <=1; oe_b <= 0; data_b <= $random;
    end

    for ( i = 8; i < 16; i= i+1) begin
      repeat (1) @(posedge clk) addr_b <= i; we_b <= 0; cs <= 1; oe_b <= 1;
    end
   

   
    #20 $finish;
    end
endmodule

   