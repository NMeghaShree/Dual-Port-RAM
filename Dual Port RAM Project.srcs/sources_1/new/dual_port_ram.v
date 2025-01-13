`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2025 17:36:23
// Design Name: 
// Module Name: dual_port_ram
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


module dual_port_ram(
    //it has two sets of address and data bus
    input rst,
    input [7:0] data_a, data_b, // 8-bit data buses a and b
    input [5:0] addr_a, addr_b, // 6-bit address buses a and b
    input we_a, we_b,           // we_a=0 implies read enable and we_a=1 implies write enable, same for we_b
    input clk,
    output reg [7:0] q_a, q_b  // output data of two ports a and b
    );
    
    reg [7:0] RAM[63:0];   // 64 x 8 bit RAM
    integer i;
    always@( posedge clk)
   
    begin
        if(we_a)           // when write is enabled
        begin
            RAM[addr_a]<=data_a;    //writing data into memory 
        end
        else         // read is enabled
        begin
            q_a<=RAM[addr_a];       
        end
   end
    always@( posedge clk)
        begin 
    
   
        if(we_b)           // when write is enabled
        begin
            RAM[addr_b]<=data_b;    //writing data into memory 
        end
        else           // read  is enabled
        begin
            q_b<=RAM[addr_b];       
        end
    end
endmodule
