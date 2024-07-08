`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 16:33:29
// Design Name: 
// Module Name: divisor_test
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


module divisor_test;
    reg clk_in, reset_in;
    wire ans_out;
    divisor divisor_obj(
        .clk(clk_in),
        .rstN(reset_in),
        .clkOut(ans_out)
    );
    integer i;
    integer count;
    reg [1:0] clk_reg;
    
    
    initial 
    begin
        count = 0;
        reset_in = 0;
        clk_in = 0;
        clk_reg = 2;
        reset_in = 1;
        
        for(i = 0;i < 124;i=i+1)
        begin
            clk_in = clk_reg[i%2];
            #5
            if(ans_out == 1)
            begin
                $display("1");
                count = count + 1;
            end
            else
            begin
                $display("0");
            end
        end
        $display(count / 5);
        $display(124 / 2);
    end
    
endmodule
