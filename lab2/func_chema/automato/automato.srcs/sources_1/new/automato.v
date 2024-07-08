`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2024 19:10:32
// Design Name: 
// Module Name: automato
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


module automato(
    input clk,
    input [39:0] input_dataA,
    input [39:0] input_dataB,
    output [42:0] output_data
    );
    reg [2:0] position = 1;
    reg [42:0] output_data_reg = 0;
    reg [39:0] input_dataA_reserve_reg = 0; 
    reg [39:0] input_dataB_reserve_reg = 0;
    
    reg [42:0] slag1 = 0;
    reg [42:0] slag2 = 0;   
    reg [42:0] sum_res = 0;
    

    assign output_data = output_data_reg;
    reg [42:0] reg_to_calc = 0;
    integer i;

    always @(posedge clk, input_dataA, input_dataB)
    begin    
        if(clk == 1)
        begin
            case(position)
            1:
            begin
            reg_to_calc <= 42'b0;
            output_data_reg <= reg_to_calc;
            input_dataA_reserve_reg = input_dataA;
            input_dataB_reserve_reg = input_dataB;
            slag1 = input_dataA_reserve_reg;
            slag2 = input_dataB_reserve_reg;
            sum_res = slag1 + slag2;
            reg_to_calc <= sum_res;
            slag1 = 0;
            slag2 = 0;
            position = 2;
            end
            2:
            begin
            reg_to_calc <= (reg_to_calc << 1);
            position = 3;
            end
            3:
            begin
            slag1 = reg_to_calc;
            slag2 = input_dataB_reserve_reg;
            sum_res = slag1 + slag2;
            reg_to_calc <= (sum_res);
            slag1 = 0;
            slag2 = 0;
            position = 4;
            end
            4:
            begin
            output_data_reg <= reg_to_calc;
            position = 1;
            end
            default:
                position = 1;
            endcase
        end
        else
        begin
            position = 1;
        end
    end
    
    
endmodule
