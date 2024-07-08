`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2024 11:26:27
// Design Name: 
// Module Name: buffer
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


module buffer(
    input clk,
    input[4:0] datain,
    input valid,
    input reset,
    output[7:0] dataout, // заняты
    output[3:0] last_in_MRU
    );
    reg clk_in = 0;
    reg[7:0] dataout_reg = 0;
    assign dataout = dataout_reg;
    
    reg[7:0] enable_reg  = 0;
    

    wire [4:0] outs[7:0];    
    reg [4:0] inputs[7:0];  
    integer i;
    reg already;
    
    initial
    begin
    for(i = 0; i < 8;i = i + 1)
        inputs[i] = 0;
    end
      
    
    // 8 буферов + 1 состояние нулевое
    reg[3:0] last_reg = 0;
    assign last_in_MRU = last_reg; 

     
    simple_mem_el simple_mem_el_obj0(
        .clk(clk_in),
        .enable(enable_reg[0]),
        .reset(reset),
        .data(inputs[0]),
        .out(outs[0]),
        .flag(dataout[0])
    );
    
    simple_mem_el simple_mem_el_obj1(
        .clk(clk_in),
        .enable(enable_reg[1]),
        .reset(reset),
        .data(inputs[1]),
        .out(outs[1]),
        .flag(dataout[1])
    );
    
    simple_mem_el simple_mem_el_obj2(
        .clk(clk_in),
        .enable(enable_reg[2]),
        .reset(reset),
        .data(inputs[2]),
        .out(outs[2]),
        .flag(dataout[2])
    );
    
    simple_mem_el simple_mem_el_obj3(
        .clk(clk_in),
        .enable(enable_reg[3]),
        .reset(reset),
        .data(inputs[3]),
        .out(outs[3]),
        .flag(dataout[3])
    );


    simple_mem_el simple_mem_el_obj4(
        .clk(clk_in),
        .enable(enable_reg[4]),
        .reset(reset),
        .data(inputs[4]),
        .out(outs[4]),
        .flag(dataout[4])
    );
    
    simple_mem_el simple_mem_el_obj5(
        .clk(clk_in),
        .enable(enable_reg[5]),
        .reset(reset),
        .data(inputs[5]),
        .out(outs[5]),
        .flag(dataout[5])
    );
    
    simple_mem_el simple_mem_el_obj6(
        .clk(clk_in),
        .enable(enable_reg[6]),
        .reset(reset),
        .data(inputs[6]),
        .out(outs[6]),
        .flag(dataout[6])
    );
    
     simple_mem_el simple_mem_el_obj7(
        .clk(clk_in),
        .enable(enable_reg[7]),
        .reset(reset),
        .data(inputs[7]),
        .out(outs[7]),
        .flag(dataout[7])
    );


    
    always @(posedge clk)
    begin
        if(reset)
        begin
            // ресетим
        end
        else
        begin
            if(valid)
            begin
                // сначала проверим что такого числа нет(
                enable_reg[last_reg] = 0;
                //$display("lastreg = %b, enable_reg = %b", last_reg, enable_reg);
                already = 0;
                for(i = 0; i < 8;i = i + 1)
                    if(outs[i] == datain)
                    begin
                        last_reg = i;
                        already = 1;
                    end
                    
                if(!already)
                begin
                    for(i = 0; i < 8;i = i + 1)
                    if(outs[i] == 0)
                    begin
                        last_reg = i;
                        i = 9;
                    end
                    clk_in = 1;
                    inputs[last_reg] = datain;
                    enable_reg[last_reg] = 1;
                    //$display("lastreg = %b, enable_reg = %b", last_reg, enable_reg);
                    clk_in <= 0;
                end
            end  
        end

        
    end
    
    
    
    
endmodule
