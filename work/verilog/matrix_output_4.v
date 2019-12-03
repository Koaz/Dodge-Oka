/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module matrix_output_4 (
    input clk,
    input rst,
    output reg spi_miso,
    output reg [3:0] spi_channel,
    output reg avr_rx,
    output reg out,
    output reg [9:0] score,
    input [0:0] startBtn,
    input leftBtn,
    input rightBtn,
    output reg [0:0] reset
  );
  
  
  
  wire [16-1:0] M_alu_alu_out;
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  reg [6-1:0] M_alu_alufn;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  alu_7 alu (
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .alu_out(M_alu_alu_out),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n)
  );
  
  integer i;
  
  integer j;
  
  reg start;
  
  localparam B = 24'hff0000;
  
  localparam R = 24'h00ff00;
  
  localparam G = 24'h0000ff;
  
  localparam P = 24'hff00ff;
  
  localparam BL = 24'h000000;
  
  localparam W = 24'hffffff;
  
  wire [1-1:0] M_button_start_out;
  reg [1-1:0] M_button_start_in;
  button_conditioner_8 button_start (
    .clk(clk),
    .in(M_button_start_in),
    .out(M_button_start_out)
  );
  wire [1-1:0] M_start_edge_out;
  reg [1-1:0] M_start_edge_in;
  edge_detector_2 start_edge (
    .clk(clk),
    .in(M_start_edge_in),
    .out(M_start_edge_out)
  );
  wire [8-1:0] M_blink_pixel;
  wire [1-1:0] M_blink_led;
  reg [1536-1:0] M_blink_color;
  reg [1-1:0] M_blink_update;
  ws2812b_9 blink (
    .clk(clk),
    .rst(rst),
    .color(M_blink_color),
    .update(M_blink_update),
    .pixel(M_blink_pixel),
    .led(M_blink_led)
  );
  wire [192-1:0] M_sprite_fillup;
  sprite_10 sprite (
    .clk(clk),
    .rst(rst),
    .button_l(leftBtn),
    .button_r(rightBtn),
    .startBtn(startBtn),
    .fillup(M_sprite_fillup)
  );
  localparam IDLE_state = 5'd0;
  localparam SHOWLIVES_state = 5'd1;
  localparam MOVE_state = 5'd2;
  localparam CHECKAND_state = 5'd3;
  localparam CHECKSUM_state = 5'd4;
  localparam DED_state = 5'd5;
  localparam MOVEFASTER2_state = 5'd6;
  localparam CHECKAND2_state = 5'd7;
  localparam CHECKSUM2_state = 5'd8;
  localparam STAGE2_state = 5'd9;
  localparam MOVEFASTER3_state = 5'd10;
  localparam CHECKAND3_state = 5'd11;
  localparam CHECKSUM3_state = 5'd12;
  localparam STAGE3_state = 5'd13;
  localparam WIN_state = 5'd14;
  localparam LIVE1_state = 5'd15;
  localparam LIVE2_state = 5'd16;
  localparam LIVE3_state = 5'd17;
  localparam CHECKDED_state = 5'd18;
  localparam SHOWDED_state = 5'd19;
  
  reg [4:0] M_state_d, M_state_q = IDLE_state;
  wire [8-1:0] M_random_out;
  randomNumGen_11 random (
    .clk(clk),
    .rst(rst),
    .out(M_random_out)
  );
  reg [71:0] M_regs_d, M_regs_q = 1'h0;
  reg [7:0] M_temp_d, M_temp_q = 1'h0;
  reg [7:0] M_temp2_d, M_temp2_q = 1'h0;
  reg [7:0] M_temp3_d, M_temp3_q = 1'h0;
  reg [9:0] M_score_reg_d, M_score_reg_q = 1'h0;
  reg [9:0] M_lives_d, M_lives_q = 1'h0;
  reg [25:0] M_counter1_d, M_counter1_q = 1'h0;
  reg [25:0] M_counter2_d, M_counter2_q = 1'h0;
  reg [24:0] M_counter3_d, M_counter3_q = 1'h0;
  reg [24:0] M_counter4_d, M_counter4_q = 1'h0;
  reg [23:0] M_counter5_d, M_counter5_q = 1'h0;
  reg [23:0] M_counter6_d, M_counter6_q = 1'h0;
  
  always @* begin
    M_state_d = M_state_q;
    M_temp2_d = M_temp2_q;
    M_temp3_d = M_temp3_q;
    M_counter6_d = M_counter6_q;
    M_counter4_d = M_counter4_q;
    M_counter5_d = M_counter5_q;
    M_lives_d = M_lives_q;
    M_counter2_d = M_counter2_q;
    M_temp_d = M_temp_q;
    M_counter3_d = M_counter3_q;
    M_score_reg_d = M_score_reg_q;
    M_regs_d = M_regs_q;
    M_counter1_d = M_counter1_q;
    
    M_button_start_in = startBtn;
    M_start_edge_in = M_button_start_out;
    start = M_start_edge_out;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_blink_update = 1'h1;
    M_alu_a = 8'h00;
    M_alu_b = 8'h00;
    M_alu_alufn = 6'h00;
    M_counter1_d = M_counter1_q + 1'h1;
    M_counter2_d = M_counter2_q + 1'h1;
    M_counter3_d = M_counter3_q + 1'h1;
    M_counter4_d = M_counter4_q + 1'h1;
    M_counter5_d = M_counter5_q + 1'h1;
    M_counter6_d = M_counter6_q + 1'h1;
    score = M_score_reg_q;
    reset = 1'h0;
    
    case (M_state_q)
      IDLE_state: begin
        M_blink_color[0+1535-:1536] = 1536'hff000000ff0000ff00ff0000ff0000ff00000000ffff000000ff00ff000000ff00ff0000ff0000ff00000000ffff0000ff000000ff0000ff00ff0000ff0000ff00000000ffff00000000ff0000ff0000ffff0000ff0000ff00000000ffff00000000ffff0000ff0000ff0000ff00000000ff0000ff0000ff0000ff0000ff0000ffff0000ff000000ff0000ff0000ff00ff0000ff00000000ffff0000ff0000ff000000ff00ff00000000ff0000ff0000ffff0000ff000000ff0000ff0000ff00;
        for (i = 1'h0; i < 4'h8; i = i + 1) begin
          for (j = 1'h0; j < 4'h8; j = j + 1) begin
            M_regs_d[(i)*8+(j)*1+0-:1] = 1'h0;
          end
        end
        reset = 1'h1;
        M_score_reg_d = 1'h0;
        M_lives_d = 1'h0;
        if (start) begin
          M_state_d = SHOWLIVES_state;
        end else begin
          M_state_d = IDLE_state;
        end
      end
      SHOWLIVES_state: begin
        M_blink_color[0+1535-:1536] = 1536'h00ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff000000ff0000ff00ff0000ff0000ff0000ff0000ff000000ff0000ff0000ff0000ff00ff0000ff0000ff0000ff000000ff0000ff0000ff0000ff00ff0000ff0000ff000000ff0000ff0000ff0000ff0000ff0000ff00ff0000ff000000ff0000ff0000ff0000ff0000ff0000ff00ff0000ff000000ff0000ff00ff0000ff000000ff0000ff00ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00;
        if (start) begin
          M_state_d = MOVE_state;
        end else begin
          M_state_d = SHOWLIVES_state;
        end
      end
      MOVE_state: begin
        if (M_counter1_q[25+0-:1]) begin
          M_counter1_d = 1'h0;
          M_regs_d[0+7-:8] = M_random_out;
          for (i = 1'h1; i < 4'h8; i = i + 1) begin
            for (j = 1'h0; j < 4'h8; j = j + 1) begin
              M_regs_d[(i)*8+(j)*1+0-:1] = M_regs_q[(i - 1'h1)*8+(j)*1+0-:1];
            end
          end
        end
        for (i = 1'h0; i < 4'h8; i = i + 1) begin
          for (j = 1'h0; j < 4'h8; j = j + 1) begin
            if (M_regs_q[(i)*8+(j)*1+0-:1]) begin
              M_blink_color[(i)*192+(j)*24+23-:24] = 24'h00ff00;
            end else begin
              M_blink_color[(i)*192+(j)*24+23-:24] = 24'hff0000;
            end
          end
        end
        for (i = 1'h0; i < 4'h8; i = i + 1) begin
          if (M_sprite_fillup[(i)*24+23-:24] == 24'h0000ff) begin
            M_regs_d[64+(i)*1+0-:1] = 1'h1;
            M_blink_color[1344+(i)*24+23-:24] = 24'h0000ff;
          end else begin
            M_regs_d[64+(i)*1+0-:1] = 1'h0;
          end
        end
        if (M_counter2_q[25+0-:1]) begin
          M_counter2_d = 1'h0;
          M_state_d = CHECKAND_state;
        end
      end
      CHECKAND_state: begin
        M_alu_a = M_regs_q[56+0+7-:8];
        M_alu_b = M_regs_q[64+0+7-:8];
        M_alu_alufn = 6'h18;
        M_temp_d = M_alu_alu_out;
        M_state_d = CHECKSUM_state;
      end
      CHECKSUM_state: begin
        if (M_temp_q > 8'h00) begin
          M_alu_a = M_lives_q;
          M_alu_b = 1'h1;
          M_alu_alufn = 6'h00;
          M_lives_d = M_alu_alu_out;
          M_state_d = CHECKDED_state;
        end else begin
          M_alu_a = M_score_reg_q;
          M_alu_b = 1'h1;
          M_alu_alufn = 6'h00;
          M_score_reg_d = M_alu_alu_out;
          if (M_score_reg_q == 10'h010) begin
            M_state_d = STAGE2_state;
          end else begin
            M_state_d = MOVE_state;
          end
        end
      end
      STAGE2_state: begin
        M_blink_color[0+1535-:1536] = 1536'hff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00000000ff0000ff0000ff0000ffff0000ff0000ff0000ff0000ff0000ff0000ff00000000ffff0000ff0000ff0000ff00000000ff0000ff0000ff0000ffff0000ff0000ff0000ff00000000ffff0000ff0000ff0000ff0000ff0000ff0000ff00000000ff0000ff0000ff0000ffff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000;
        for (i = 1'h0; i < 4'h8; i = i + 1) begin
          for (j = 1'h0; j < 4'h8; j = j + 1) begin
            M_regs_d[(i)*8+(j)*1+0-:1] = 1'h0;
          end
        end
        if (start) begin
          M_state_d = MOVEFASTER2_state;
        end else begin
          M_state_d = STAGE2_state;
        end
      end
      MOVEFASTER2_state: begin
        if (M_counter3_q[24+0-:1]) begin
          M_counter3_d = 1'h0;
          M_regs_d[0+7-:8] = M_random_out;
          for (i = 1'h1; i < 4'h8; i = i + 1) begin
            for (j = 1'h0; j < 4'h8; j = j + 1) begin
              M_regs_d[(i)*8+(j)*1+0-:1] = M_regs_q[(i - 1'h1)*8+(j)*1+0-:1];
            end
          end
        end
        for (i = 1'h0; i < 4'h8; i = i + 1) begin
          for (j = 1'h0; j < 4'h8; j = j + 1) begin
            if (M_regs_q[(i)*8+(j)*1+0-:1]) begin
              M_blink_color[(i)*192+(j)*24+23-:24] = 24'h00ff00;
            end else begin
              M_blink_color[(i)*192+(j)*24+23-:24] = 24'hff0000;
            end
          end
        end
        for (i = 1'h0; i < 4'h8; i = i + 1) begin
          if (M_sprite_fillup[(i)*24+23-:24] == 24'h0000ff) begin
            M_regs_d[64+(i)*1+0-:1] = 1'h1;
            M_blink_color[1344+(i)*24+23-:24] = 24'h0000ff;
          end else begin
            M_regs_d[64+(i)*1+0-:1] = 1'h0;
          end
        end
        if (M_counter4_q[24+0-:1]) begin
          M_counter4_d = 1'h0;
          M_state_d = CHECKAND2_state;
        end
      end
      CHECKAND2_state: begin
        M_alu_a = M_regs_q[56+0+7-:8];
        M_alu_b = M_regs_q[64+0+7-:8];
        M_alu_alufn = 6'h18;
        M_temp2_d = M_alu_alu_out;
        M_state_d = CHECKSUM2_state;
      end
      CHECKSUM2_state: begin
        if (M_temp2_q > 8'h00) begin
          M_alu_a = M_lives_q;
          M_alu_b = 1'h1;
          M_alu_alufn = 6'h00;
          M_lives_d = M_alu_alu_out;
          M_state_d = CHECKDED_state;
        end else begin
          M_alu_a = M_score_reg_q;
          M_alu_b = 1'h1;
          M_alu_alufn = 6'h00;
          M_score_reg_d = M_alu_alu_out;
          if (M_score_reg_q == 10'h040) begin
            M_state_d = STAGE3_state;
          end else begin
            M_state_d = MOVEFASTER2_state;
          end
        end
      end
      STAGE3_state: begin
        M_blink_color[0+1535-:1536] = 1536'hff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00000000ff0000ff0000ff0000ffff0000ff0000ff0000ff00000000ffff0000ff0000ff0000ff0000ff0000ff0000ff00000000ff0000ff0000ff0000ffff0000ff0000ff0000ff00000000ffff0000ff0000ff0000ff0000ff0000ff0000ff00000000ff0000ff0000ff0000ffff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000;
        for (i = 1'h0; i < 4'h8; i = i + 1) begin
          for (j = 1'h0; j < 4'h8; j = j + 1) begin
            M_regs_d[(i)*8+(j)*1+0-:1] = 1'h0;
          end
        end
        if (start) begin
          M_state_d = MOVEFASTER3_state;
        end else begin
          M_state_d = STAGE3_state;
        end
      end
      MOVEFASTER3_state: begin
        if (M_counter5_q[23+0-:1]) begin
          M_counter5_d = 1'h0;
          M_regs_d[0+7-:8] = M_random_out;
          for (i = 1'h1; i < 4'h8; i = i + 1) begin
            for (j = 1'h0; j < 4'h8; j = j + 1) begin
              M_regs_d[(i)*8+(j)*1+0-:1] = M_regs_q[(i - 1'h1)*8+(j)*1+0-:1];
            end
          end
        end
        for (i = 1'h0; i < 4'h8; i = i + 1) begin
          for (j = 1'h0; j < 4'h8; j = j + 1) begin
            if (M_regs_q[(i)*8+(j)*1+0-:1]) begin
              M_blink_color[(i)*192+(j)*24+23-:24] = 24'h00ff00;
            end else begin
              M_blink_color[(i)*192+(j)*24+23-:24] = 24'hff0000;
            end
          end
        end
        for (i = 1'h0; i < 4'h8; i = i + 1) begin
          if (M_sprite_fillup[(i)*24+23-:24] == 24'h0000ff) begin
            M_regs_d[64+(i)*1+0-:1] = 1'h1;
            M_blink_color[1344+(i)*24+23-:24] = 24'h0000ff;
          end else begin
            M_regs_d[64+(i)*1+0-:1] = 1'h0;
          end
        end
        if (M_counter6_q[23+0-:1]) begin
          M_counter6_d = 1'h0;
          M_state_d = CHECKAND3_state;
        end
      end
      CHECKAND3_state: begin
        M_alu_a = M_regs_q[56+0+7-:8];
        M_alu_b = M_regs_q[64+0+7-:8];
        M_alu_alufn = 6'h18;
        M_temp3_d = M_alu_alu_out;
        M_state_d = CHECKSUM3_state;
      end
      CHECKSUM3_state: begin
        if (M_temp3_q > 8'h00) begin
          M_alu_a = M_lives_q;
          M_alu_b = 1'h1;
          M_alu_alufn = 6'h00;
          M_lives_d = M_alu_alu_out;
        end else begin
          M_alu_a = M_score_reg_q;
          M_alu_b = 1'h1;
          M_alu_alufn = 6'h00;
          M_score_reg_d = M_alu_alu_out;
          if (M_score_reg_q == 10'h0ff) begin
            M_state_d = WIN_state;
          end else begin
            M_state_d = MOVEFASTER3_state;
          end
        end
      end
      CHECKDED_state: begin
        if (M_lives_q == 10'h003) begin
          M_state_d = SHOWDED_state;
        end else begin
          if (M_lives_q == 10'h001) begin
            M_state_d = LIVE1_state;
          end else begin
            if (M_lives_q == 10'h002) begin
              M_state_d = LIVE2_state;
            end else begin
              if (M_lives_q == 3'h3) begin
                M_state_d = LIVE3_state;
              end
            end
          end
        end
      end
      LIVE1_state: begin
        M_blink_color[0+1535-:1536] = 1536'h00ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff000000ff0000ff00ff0000ff0000ff0000ff0000ff000000ff0000ff0000ff0000ff00ff0000ff0000ff0000ff000000ff0000ff0000ff0000ff00ff0000ff0000ff000000ff0000ff0000ff0000ff0000ff0000ff00ff0000ff00ffffffffffffffffffffffffffffffffffff00ff0000ff00ffffffffffff00ff0000ff00ffffffffffff00ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00;
        for (i = 1'h0; i < 4'h8; i = i + 1) begin
          for (j = 1'h0; j < 4'h8; j = j + 1) begin
            M_regs_d[(i)*8+(j)*1+0-:1] = 1'h0;
          end
        end
        if (start) begin
          if (M_score_reg_q < 10'h010) begin
            M_state_d = MOVE_state;
          end else begin
            if (M_score_reg_q < 10'h040) begin
              M_state_d = MOVEFASTER2_state;
            end else begin
              if (M_score_reg_q < 10'h0ff) begin
                M_state_d = MOVEFASTER3_state;
              end
            end
          end
        end else begin
          M_state_d = LIVE1_state;
        end
      end
      LIVE2_state: begin
        M_blink_color[0+1535-:1536] = 1536'h00ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff000000ff0000ff00ff0000ff0000ff0000ff0000ff000000ff0000ff0000ff0000ff00ff0000ff0000ff0000ff00ffffffffffffffffffffffff00ff0000ff0000ff00ffffffffffffffffffffffffffffffffffff00ff0000ff00ffffffffffffffffffffffffffffffffffff00ff0000ff00ffffffffffff00ff0000ff00ffffffffffff00ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00;
        for (i = 1'h0; i < 4'h8; i = i + 1) begin
          for (j = 1'h0; j < 4'h8; j = j + 1) begin
            M_regs_d[(i)*8+(j)*1+0-:1] = 1'h0;
          end
        end
        if (start) begin
          if (M_score_reg_q < 10'h010) begin
            M_state_d = MOVE_state;
          end else begin
            if (M_score_reg_q < 10'h040) begin
              M_state_d = MOVEFASTER2_state;
            end else begin
              if (M_score_reg_q < 10'h0ff) begin
                M_state_d = MOVEFASTER3_state;
              end
            end
          end
        end else begin
          M_state_d = LIVE2_state;
        end
      end
      SHOWDED_state: begin
        M_blink_color[0+1535-:1536] = 1536'h00ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00ffffffffffff00ff0000ff0000ff0000ff0000ff00ffffffffffffffffffffffff00ff0000ff0000ff0000ff00ffffffffffffffffffffffff00ff0000ff0000ff00ffffffffffffffffffffffffffffffffffff00ff0000ff00ffffffffffffffffffffffffffffffffffff00ff0000ff00ffffffffffff00ff0000ff00ffffffffffff00ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00;
        if (start) begin
          M_state_d = DED_state;
        end else begin
          M_state_d = SHOWDED_state;
        end
      end
      WIN_state: begin
        M_blink_color[0+1535-:1536] = 1536'hff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00000000ff0000ffff0000ff0000ff0000ff0000ff00000000ffff0000ff00000000ffff0000ff0000ff00000000ffff0000ff0000ff0000ff00000000ffff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff00000000ffff0000ff00000000ffff0000ff0000ff0000ff00000000ffff0000ff00000000ffff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000;
        if (start) begin
          M_state_d = IDLE_state;
        end else begin
          M_state_d = WIN_state;
        end
      end
      DED_state: begin
        M_blink_color[0+1535-:1536] = 1536'h00ff00ff000000ff00ff0000ff0000ff0000ff0000ff000000ff00ff000000ff00ff0000ff0000ff0000ff0000ff0000ff000000ff00ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff000000ff00ff000000ff00ff0000ff0000ff0000ff0000ff0000ff000000ff0000ff00ff0000ff0000ff0000ff0000ff000000ff00ff000000ff0000ff0000ff0000ff00ff0000ff0000ff0000ff0000ff000000ff00ff000000ff00ff0000ff0000ff0000ff0000ff000000ff0000ff0000ff00;
        if (start) begin
          M_state_d = IDLE_state;
        end else begin
          M_state_d = DED_state;
        end
      end
    endcase
    out = M_blink_led;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_regs_q <= 1'h0;
      M_temp_q <= 1'h0;
      M_temp2_q <= 1'h0;
      M_temp3_q <= 1'h0;
      M_score_reg_q <= 1'h0;
      M_lives_q <= 1'h0;
      M_counter1_q <= 1'h0;
      M_counter2_q <= 1'h0;
      M_counter3_q <= 1'h0;
      M_counter4_q <= 1'h0;
      M_counter5_q <= 1'h0;
      M_counter6_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_regs_q <= M_regs_d;
      M_temp_q <= M_temp_d;
      M_temp2_q <= M_temp2_d;
      M_temp3_q <= M_temp3_d;
      M_score_reg_q <= M_score_reg_d;
      M_lives_q <= M_lives_d;
      M_counter1_q <= M_counter1_d;
      M_counter2_q <= M_counter2_d;
      M_counter3_q <= M_counter3_d;
      M_counter4_q <= M_counter4_d;
      M_counter5_q <= M_counter5_d;
      M_counter6_q <= M_counter6_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule