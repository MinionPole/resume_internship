`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2024 19:10:46
// Design Name: 
// Module Name: automato_test
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


module automato_test;
    reg clk_in;
    reg[39:0] inputA;
    reg[39:0] inputB;
    wire[42:0] output_data;
    
    automato automato_obj(
        .clk(clk_in),
        .input_dataA(inputA),
        .input_dataB(inputB),
        .output_data(output_data)
    );
    
    integer Ai, Bi, i;
    reg [1:0] clk_reg;
    
    initial begin

        clk_reg = 2;
        for(Ai = 1;Ai < 8;Ai = Ai + 1)
        begin
            for(Bi = 1;Bi < 8;Bi = Bi + 1)
            begin
                inputA = Ai;
                inputB = Bi;
                for(i = 0;i < 8;i=i+1)
                begin
                    clk_in = clk_reg[i%2];
                    #5
                    if(output_data != ((Ai + Bi) * 2 + Bi))
                        $display("not yet step=%b", i);
                    else
                        $display("done step=%b", i);
                end
                $display("\n");
            end
        end

    
    end
    
endmodule
