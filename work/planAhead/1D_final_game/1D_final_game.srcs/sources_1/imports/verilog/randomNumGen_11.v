/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module randomNumGen_11 (
    input clk,
    input rst,
    output reg [7:0] out
  );
  
  
  
  integer i;
  
  reg [31:0] M_randseed_d, M_randseed_q = 1'h0;
  reg [25:0] M_counter_d, M_counter_q = 1'h0;
  reg [7:0] M_temp_d, M_temp_q = 1'h0;
  
  wire [32-1:0] M_rng_num;
  reg [1-1:0] M_rng_next;
  reg [32-1:0] M_rng_seed;
  pn_gen_21 rng (
    .clk(clk),
    .rst(rst),
    .next(M_rng_next),
    .seed(M_rng_seed),
    .num(M_rng_num)
  );
  
  always @* begin
    M_counter_d = M_counter_q;
    M_temp_d = M_temp_q;
    M_randseed_d = M_randseed_q;
    
    M_rng_seed = M_randseed_q;
    M_randseed_d = M_randseed_q + 1'h1;
    M_rng_next = 1'h1;
    M_counter_d = M_counter_q + 1'h1;
    if (M_counter_q[25+0-:1] == 1'h1) begin
      M_counter_d = 1'h0;
      M_temp_d = M_rng_num[16+7-:8];
    end else begin
      M_temp_d = M_temp_q;
    end
    out = M_temp_q;
    for (i = 1'h0; i < 4'h8; i = i + 1) begin
      if (M_temp_q[(i)*1+0-:1] & (i == 1'h0 | i == 2'h2 | i == 3'h4 | i == 3'h6)) begin
        if (i == 2'h2 & M_temp_q[0+0-:1]) begin
          out[0+0-:1] = 1'h0;
          out[1+0-:1] = 1'h1;
        end else begin
          if (i == 3'h4 & M_temp_q[2+0-:1]) begin
            out[4+0-:1] = 1'h0;
          end else begin
            if (i == 3'h6 & M_temp_q[4+0-:1]) begin
              out[6+0-:1] = 1'h0;
              out[5+0-:1] = 1'h1;
            end
          end
        end
      end else begin
        out[(i)*1+0-:1] = 1'h0;
      end
    end
  end
  
  always @(posedge clk) begin
    M_randseed_q <= M_randseed_d;
    
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
      M_temp_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
      M_temp_q <= M_temp_d;
    end
  end
  
endmodule
