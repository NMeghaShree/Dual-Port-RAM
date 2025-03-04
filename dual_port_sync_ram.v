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

module dual_port_sync_ram # (parameter ADDR_WIDTH = 4,
     parameter DATA_WIDTH = 8,
     parameter DEPTH = 16,
     parameter const=55
    )
(
    input cs,                     
    input [DATA_WIDTH-1:0] data_a, data_b,    
    input [ ADDR_WIDTH-1:0] addr_a, addr_b,    
    input we_a, we_b, oe_a,  oe_b,            
    input clk,                     
    inout [ DATA_WIDTH-1:0] q_a, q_b     
    );

    reg [DATA_WIDTH-1:0] RAM[DEPTH-1:0];          
    reg [DATA_WIDTH-1:0] temp_qa=0, temp_qb=0  ;   
    always @(posedge clk) begin
            if (we_a & cs) begin
                RAM[addr_a] <= data_a;  
            end 
   end 
   always @(posedge clk) begin
            if(!we_a & cs) begin
                temp_qa <= RAM[addr_a];  
            end
    
    end

    always @(posedge clk) begin
            if (we_b & cs) begin
                RAM[addr_b] <= data_b; 
            end 
    end
    always @(posedge clk) begin
            if(!we_b & cs) begin
                temp_qb <= RAM[addr_b];  
            end
  
    end
assign q_a=cs & oe_a & !we_a ? temp_qa : 'hz;
assign q_b=cs & oe_b & !we_b ? temp_qb : 'hz;
endmodule


