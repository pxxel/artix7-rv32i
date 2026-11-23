`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2026 10:36:10 PM
// Design Name: 
// Module Name: regfile
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


module regfile(
    input wire clk,
    input wire rst,
    input wire reg_write,
    input wire [4:0] src1,
    input wire [4:0] src2,
    input wire [4:0] dst,
    input wire [31:0] dst_data,
    output wire [31:0] src1_data,
    output wire [31:0] src2_data
);
    reg [31:0] regs [31:0];
    
    //r0 hardwored to 0
    assign src1_data = (src1 == 5'd0) ? 32'd0 : regs[src1];
    assign src2_data = (src2 == 5'd0) ? 32'd0 : regs[src2];
    
    integer i;
    
    always @(posedge clk) begin
        if (rst) begin
            for(i = 0; i < 32; i = i + 1) begin
                regs[i] <= 32'd0;
            end
        end else if (reg_write && dst != 5'd0) begin
            regs[dst] <= dst_data;
        end
    end

endmodule
