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


module dual_port_RAM(
    // Two sets of address and data buses
    input rst,                     // Reset signal
    input [7:0] data_a, data_b,    // 8-bit data buses a and b
    input [5:0] addr_a, addr_b,    // 6-bit address buses a and b
    input we_a, we_b,              // Write enable for ports a and b
    input clk,                     // Clock signal
    output reg [7:0] q_a, q_b      // Output data for ports a and b
    );

    reg [7:0] RAM[63:0];           // 64 x 8-bit RAM

    always @(posedge clk) begin
        if (rst) begin
            q_a <= 8'b0;           // Reset output for port A
        end else if (we_a) begin
            RAM[addr_a] <= data_a; // Write operation for port A
        end else begin
            q_a <= RAM[addr_a];    // Read operation for port A
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            q_b <= 8'b0;           // Reset output for port B
        end else if (we_b) begin
            RAM[addr_b] <= data_b; // Write operation for port B
        end else begin
            q_b <= RAM[addr_b];    // Read operation for port B
        end
    end

endmodule

