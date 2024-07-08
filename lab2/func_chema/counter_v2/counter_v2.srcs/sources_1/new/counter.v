`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2024 18:35:03
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input reset,
    output[39:0] reg_output);
    

    reg[39:0] reg_out = 0;
    /*or(reg_output[0], clk, clk);
    or(reg_output[1], clk, clk);
    or(reg_output[2], clk, clk);*/
    assign reg_output = reg_out;

       
        
    always @(posedge clk, posedge reset)
    begin
        if(reset != 1)
            reg_out <= (reg_out + 1);
        else
            reg_out <= 40'b0;
    end
    
endmodule
