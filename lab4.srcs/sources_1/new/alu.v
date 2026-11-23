`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2026 07:07:55 PM
// Design Name: 
// Module Name: alu
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

module alu(
    input wire [31:0] op1,
    input wire [31:0] op2,
    input wire [3:0] alu_ctrl,
    output reg [31:0] result,
    output wire zero
    );
    
    //opcodes
    localparam ALU_ADD = 4'b0000;
    localparam ALU_SUB = 4'b1000;
    localparam ALU_SLL = 4'b0001;
    localparam ALU_SLT = 4'b0010;
    localparam ALU_SLTU = 4'b0011;
    localparam ALU_XOR = 4'b0100;
    localparam ALU_SRL = 4'b0101;
    localparam ALU_SRA = 4'b1101;
    localparam ALU_OR = 4'b0110;
    localparam ALU_AND = 4'b0111;
    localparam ALU_OP2 = 4'b1111;
    
    assign zero = (result == 32'd0);
    
    always @(*) begin
        case (alu_ctrl)
            ALU_ADD: result = op1 + op2;
            ALU_SUB: result = op1 - op2;
            ALU_SLL: result = op1 << op2[4:0];
            ALU_SLT: result = ($signed(op1) < $signed(op2)) ? 32'd1 : 32'd0;
            ALU_SLTU: result = (op1 < op2) ? 32'd1 : 32'd0;
            ALU_XOR: result = op1 ^ op2;
            ALU_SRL: result = op1 >> op1[4:0];
            ALU_SRA: result = $signed(op1) >>> op2[4:0];
            ALU_OR: result = op1 | op2;
            ALU_AND: result = op1 & op2;
            ALU_OP2: result = op2;
            default: result = 32'd0;
        endcase
    end
                
endmodule
