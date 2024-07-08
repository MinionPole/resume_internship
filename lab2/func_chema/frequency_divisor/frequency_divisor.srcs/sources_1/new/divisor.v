`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 16:33:14
// Design Name: 
// Module Name: divisor
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


module divisor(
  input  clk,
  input  rstN,
  output clkOut
  );
  reg clkOut_reg = 0;
  reg [2:0] count = 0;
  assign clkOut = clkOut_reg;
  
  always @(clk or negedge rstN) begin
    if (!rstN) begin
      count <= 0;
      clkOut_reg <= 0;
    end
    else begin
      count = count + 1;
      if (count == 5) begin
        count  <= 0;
        clkOut_reg <= ~clkOut_reg;
      end
    end
  end
    
endmodule
