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
    input rst,                     
    input [7:0] data_a, data_b,    
    input [5:0] addr_a, addr_b,    
    input we_a, we_b,              
    input clk,                     
    output reg [7:0] q_a, q_b     
    );

    reg [7:0] RAM[63:0];          

    always @(posedge clk) begin
        if (rst) begin
            q_a <= 8'b0;          
        end else if (we_a) begin
            RAM[addr_a] <= data_a; 
        end else begin
            q_a <= RAM[addr_a];   
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            q_b <= 8'b0;           
        end else if (we_b) begin
            RAM[addr_b] <= data_b; 
        end else begin
            q_b <= RAM[addr_b];    
        end
    end

endmodule
