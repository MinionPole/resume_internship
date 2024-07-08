module mru_new_1tact #(
    parameter BUF_SIZE = 8,
    parameter WIDTH = 16
) (
    input clk,
    input rst_n,
    input en, // сигнал работы
    input set_i, // сигнал установки
    input [15:0] data_i, // вход
    input get_i,  // Flag to get data
    output reg [15:0] data_o
);

  reg [WIDTH - 1 : 0] outs                            [BUF_SIZE - 1:0];

  reg [          2:0] index;  // last in MRU
  reg [          3:0] freeEl = 3'b0;  // first free_el


  always @ (*) begin
    if (!rst_n) begin
      outs[0] <= 16'd0;
      outs[1] <= 16'd0;
      outs[2] <= 16'd0;
      outs[3] <= 16'd0;

      outs[4] <= 16'd0;
      outs[5] <= 16'd0;
      outs[6] <= 16'd0;
      outs[7] <= 16'd0;


      index <= 3'd0;
      freeEl <= 4'd0;

      data_o <= 16'd0;

    end else if (en) begin
        case ({
            set_i, get_i
        })
        2'b01: begin
            data_o <= outs[data_i];
        end
        2'b10: begin

            if (outs[0] == data_i)
            begin
                index  <= 0;
            end
            else if (outs[1] == data_i)
            begin
                index  <= 1;
            end
            else if (outs[2] == data_i)
            begin
                index  <= 2;
            end
            else if (outs[3] == data_i)
            begin
                index  <= 3;
            end
            else if (outs[4] == data_i)
            begin
                index  <= 4;
            end
            else if (outs[5] == data_i)
            begin
                index  <= 5;
            end
            else if (outs[6] == data_i)
            begin
                index  <= 6;
            end
            else if (outs[7] == data_i)
            begin
                index  <= 7;
            end
            else
            begin
                if (freeEl < 4'd8) begin
                outs[freeEl] <= data_i;
                index  <= freeEl;
                freeEl <= freeEl + 1;
                end
                else
                begin
                    outs[index] <= data_i;
                end
            end

        end
        endcase


    end
  end
endmodule
