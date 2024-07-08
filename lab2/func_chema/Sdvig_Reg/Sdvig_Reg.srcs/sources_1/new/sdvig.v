`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2024 18:08:32
// Design Name: 
// Module Name: sdvig
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


module sdvig(
    input clk,
    input enable,
    input reset,
    input[15:0] input_signs,
    output[15:0] output_signs,  
    output last_sign
    );
    reg last_sign_reg = 0;
    reg[15:0] output_signs_reg  = 0;
    
    assign last_sign = last_sign_reg;
    assign output_signs = output_signs_reg;
    integer i = 0;
       
        
    always @(posedge clk, posedge reset)
    begin
        if(reset != 1)
            if(enable == 1)
            begin
                for(i = 0; i < 15;i = i + 1)
                begin
                    output_signs_reg[i] <= input_signs[i + 1];
                end
                output_signs_reg[15] <= 0;
                last_sign_reg <= input_signs[0];
            end
        else
        begin
            last_sign_reg = 0;
            output_signs_reg <= 16'b0;
        end         
    end
    
endmodule
