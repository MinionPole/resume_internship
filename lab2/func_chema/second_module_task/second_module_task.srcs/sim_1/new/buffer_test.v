`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2024 12:15:21
// Design Name: 
// Module Name: buffer_test
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


module buffer_test;
    reg clk;
    reg[4:0] datain;
    reg valid;
    reg reset;
    wire[7:0] dataout;
    wire[3:0] last_in_MRU;
    
    buffer buffer_obj(
    .clk(clk),
    .datain(datain),
    .valid(valid),
    .reset(reset),
    .dataout(dataout),
    .last_in_MRU(last_in_MRU)
    );
    
    integer i;
    integer last_in;
    
    reg [1:0] clk_reg;
    reg [4:0] outs[20:0];
    
    initial begin
    last_in = 0;
    outs[0] = 1;
    outs[1] = 2;
    outs[2] = 3;
    outs[3] = 4;
    outs[4] = 5;
    outs[5] = 6;
    outs[6] = 7;
    outs[7] = 8;
    outs[8] = 2;
    outs[9] = 9;
    // 1 2 3 4
    // 1 7 3 4
    // 1 7 8 4
    datain = outs[last_in];
    valid = 1;
    reset = 0;
    clk_reg = 2;
    for(i = 0; i < 30;i = i + 1)
    begin

        clk = clk_reg[i % 2];
        #5
        if(clk == 1)
        begin
            $display("out data = %b", dataout);
            datain = outs[last_in];
            last_in = last_in + 1;
        end
    end

    
    end
    
endmodule
