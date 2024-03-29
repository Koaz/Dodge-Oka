/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_7 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] alu_out,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  wire [1-1:0] M_alu_adder_z_adder;
  wire [1-1:0] M_alu_adder_v_adder;
  wire [1-1:0] M_alu_adder_n_adder;
  wire [16-1:0] M_alu_adder_adder_out;
  reg [2-1:0] M_alu_adder_alufn;
  reg [16-1:0] M_alu_adder_a_adder;
  reg [16-1:0] M_alu_adder_b_adder;
  adder_15 alu_adder (
    .alufn(M_alu_adder_alufn),
    .a_adder(M_alu_adder_a_adder),
    .b_adder(M_alu_adder_b_adder),
    .z_adder(M_alu_adder_z_adder),
    .v_adder(M_alu_adder_v_adder),
    .n_adder(M_alu_adder_n_adder),
    .adder_out(M_alu_adder_adder_out)
  );
  
  wire [16-1:0] M_alu_comparator_com_out;
  reg [6-1:0] M_alu_comparator_alufn;
  reg [16-1:0] M_alu_comparator_a;
  reg [16-1:0] M_alu_comparator_b;
  comparator_16 alu_comparator (
    .alufn(M_alu_comparator_alufn),
    .a(M_alu_comparator_a),
    .b(M_alu_comparator_b),
    .com_out(M_alu_comparator_com_out)
  );
  
  wire [16-1:0] M_alu_shifter_shift_out;
  reg [16-1:0] M_alu_shifter_a_shift;
  reg [3-1:0] M_alu_shifter_b_shift;
  reg [2-1:0] M_alu_shifter_alufn;
  shifter_17 alu_shifter (
    .a_shift(M_alu_shifter_a_shift),
    .b_shift(M_alu_shifter_b_shift),
    .alufn(M_alu_shifter_alufn),
    .shift_out(M_alu_shifter_shift_out)
  );
  
  wire [16-1:0] M_alu_boolean_boolean;
  reg [16-1:0] M_alu_boolean_a;
  reg [16-1:0] M_alu_boolean_b;
  reg [4-1:0] M_alu_boolean_alufn;
  boolean_18 alu_boolean (
    .a(M_alu_boolean_a),
    .b(M_alu_boolean_b),
    .alufn(M_alu_boolean_alufn),
    .boolean(M_alu_boolean_boolean)
  );
  
  always @* begin
    M_alu_adder_b_adder = b;
    M_alu_adder_a_adder = a;
    M_alu_adder_alufn = alufn[0+1-:2];
    z = M_alu_adder_z_adder;
    v = M_alu_adder_v_adder;
    n = M_alu_adder_n_adder;
    M_alu_comparator_a = a;
    M_alu_comparator_b = b;
    M_alu_comparator_alufn = alufn[0+5-:6];
    M_alu_boolean_a = a;
    M_alu_boolean_b = b;
    M_alu_boolean_alufn = alufn[0+3-:4];
    M_alu_shifter_a_shift = a;
    M_alu_shifter_b_shift = b[0+2-:3];
    M_alu_shifter_alufn = alufn[0+1-:2];
    
    case (alufn[4+1-:2])
      2'h0: begin
        alu_out = M_alu_adder_adder_out;
      end
      2'h1: begin
        alu_out = M_alu_boolean_boolean;
      end
      2'h2: begin
        alu_out = M_alu_shifter_shift_out;
      end
      2'h3: begin
        alu_out = M_alu_comparator_com_out;
      end
      default: begin
        alu_out = 16'h0000;
      end
    endcase
  end
endmodule
