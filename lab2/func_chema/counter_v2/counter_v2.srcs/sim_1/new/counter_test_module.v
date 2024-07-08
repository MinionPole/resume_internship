`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2024 18:35:41
// Design Name: 
// Module Name: counter_test_module
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


module counter_test_module;
    reg clk_in, reset_in;
    
    wire[39:0] ans_out;
    counter counter_obj(
        .clk(clk_in),
        .reset(reset_in),
        .reg_output(ans_out)
    );
    
    integer i;
    reg [1:0] clk_reg;
    integer ans;
    initial 
    begin

        ans = 0;
        reset_in = 1;
        clk_in = 0;
        clk_reg = 2;
        reset_in = 0;
        for(i = 0;i < 32;i=i+1)
        begin
            clk_in = clk_reg[i%2];
            if(clk_in == 1)
                ans = ans + 1;
            
            
            if(i == 27)
            begin
            reset_in = 1;
            ans = 0;
            end
            
            #10
            if(clk_in == 1 && ans_out != ans)
            begin
                $display("counter_wrong ans_out =%b ans=%b i=%b", ans_out, ans, i);
            end
            else
            begin
                $display("everything ok ans_out =%b ans=%b i=%b", ans_out, ans, i);
            end
            
            if(i == 27)
            begin
            reset_in = 0;
            end
        end
    end
    
endmodule
