`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 17:46:38
// Design Name: 
// Module Name: posege_test
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


module posege_test;
    reg clk_in, reset_in, measure_req_i, ready_i;
    wire result_rsp_o, busy_o, result_data_o;
    
    posege_counter posege_counter_obj(
        .clk(clk_in),
        .reset(reset_in),
        .measure_req_i(measure_req_i),
        .ready_i(ready_i),
        .result_rsp_o(result_rsp_o),
        .busy_o(busy_o),
        .result_data_o(result_data_o)
    );
    integer i;
    integer cnt = 0;
    reg [1:0] clk_reg;
    
    initial 
    begin
        reset_in = 0;
        clk_reg = 2;
        
        for(i = 0;i < 58;i=i+1)
        begin
            clk_in = clk_reg[i % 2];           
            
            if(i == 1)
                measure_req_i = 1;
            if(i == 57)
                measure_req_i = 1;   
                 
            #5
            if(i%2 == 1 && i >= 1 && i < 57)
                cnt = cnt + 1;
            if(busy_o == 1)
                $display("модуль в работе");
            else
                $display("модуль проставивает");
            
            if(i == 57)
                measure_req_i = 0;    
            
            if(i == 1)
                measure_req_i = 0;
        end
        $display("are module ready result_rsp_o = %b", result_rsp_o);
        ready_i = 1;
        
        $display("correct result is %b", cnt);
        
        for(i = 0;i < 34;i=i+1)
        begin
            clk_in = clk_reg[i % 2];           
            #5
            if(i%2 == 1)
                $display("новый бит %b", result_data_o);
            
        end
        
        

    end
    
endmodule
