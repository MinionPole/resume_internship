`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 17:46:22
// Design Name: 
// Module Name: posege_counter
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


module posege_counter(
    input clk,
    input reset,
    input measure_req_i,
    input ready_i,
    output result_rsp_o,
    output busy_o,
    output result_data_o
    );
    reg busy_o_reg;
    assign busy_o = busy_o_reg;
    
    reg result_data_o_reg;
    assign result_data_o = result_data_o_reg;
     
    reg result_rsp_o_reg;
    assign result_rsp_o = result_rsp_o_reg;
    
    reg[15:0] count_reg;
    reg output_in_process = 0;
    reg[4:0] bit_out_now = 0;

    
    always @(posedge clk, posedge measure_req_i, posedge reset)
    begin
        if(reset == 1)
        begin
        result_data_o_reg = 0;
        count_reg = 0;
        busy_o_reg = 0;
        output_in_process = 0;
        result_rsp_o_reg = 0;
        bit_out_now = 0;
        end
        else
        begin
            if(measure_req_i == 1)
            begin
                if(reset != 1)
                begin
                    if(!output_in_process)
                        begin
                        if (busy_o_reg == 1)
                        begin
                            //���������� ����
                            busy_o_reg = 0;
                            output_in_process = 0;
                            result_rsp_o_reg = 1;
                        end
                        else
                        begin 
                            //������ ����
                            result_rsp_o_reg = 0;
                            busy_o_reg = 1;
                            count_reg = 0;
                        end
                    end
                end
            end
            else
            begin
            if(output_in_process)
            begin
                result_data_o_reg = count_reg[bit_out_now];
                bit_out_now = bit_out_now + 1;
                if(bit_out_now == 16)
                begin
                    output_in_process = 0;
                end
            end
            
            
            if(busy_o_reg == 1)
            begin
                // pro������� ����
                count_reg = (count_reg + 1);
            end
            
            if(ready_i == 1 && result_rsp_o_reg == 1)
            begin
                // ������ �����
                output_in_process = 1;
                bit_out_now = 0;
                result_rsp_o_reg = 0;
            end
            end
        end
    end
    
endmodule
