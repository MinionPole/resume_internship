`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2024 18:25:40
// Design Name: 
// Module Name: sdvig_test
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


module sdvig_test;
    reg clk_in, reset_in, enable;
    reg[15:0] input_data;
    
    wire[15:0] ans_out;
    wire last_sign;
    sdvig sdvig_obj(
        .clk(clk_in),
        .enable(enable),
        .reset(reset_in),
        .input_signs(input_data),
        .output_signs(ans_out),
        .last_sign(last_sign)
    );
    integer i;
    reg [1:0] clk_reg;
    integer j;
    
    initial 
    begin
        clk_reg = 2;
        enable = 1;
        reset_in = 0;
        j = 0;
        for(i = 0; i < 64;i = i + 1)
        begin
            clk_in = clk_reg[i%2];
            
            if(i == 27)
            begin
            reset_in = 1;
            end
            
            if(i == 40)
            begin
            enable = 0;
            end
            
            if(clk_in == 1)
                j = j + 1;
            input_data = j;
            #10
            if(input_data[0] == last_sign)
                $display("OK i = %b j = %b", i, j);
            else
            begin
                if((!enable || reset_in) && last_sign == 0)
                    $display("OK i = %b j = %b", i, j);
                else
                    $display("WRONG i = %b j = %b", i, j);
            end
            if(i == 27)
            begin
            reset_in = 0;
            end
            
            if(i == 46)
            begin
            enable = 1;
            end
        end
    
    end
    
    
endmodule
