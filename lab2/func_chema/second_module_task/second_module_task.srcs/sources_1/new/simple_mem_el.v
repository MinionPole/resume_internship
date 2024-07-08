`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2024 11:02:37
// Design Name: 
// Module Name: simple_mem_el
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


module simple_mem_el(
    input clk,
    input enable,
    input reset,
    input[4:0] data,
    output[4:0] out,
    output flag
    );
    reg[4:0] out_reg = 0;
    assign out = out_reg;
    
    reg flag_reg = 0;
    assign flag = flag_reg;
    
    always @(posedge clk, posedge reset)
    begin
        if(!reset)
        begin
            if(enable)
            begin
            flag_reg = 1;
            out_reg = data;        
            end
        end
        if(reset)
        begin
            flag_reg = 0;
            out_reg = 0;
        end 
    end
    

    
endmodule
