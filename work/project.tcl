set projDir "C:/Users/Tharun/Documents/mojo/1D_final_game/work/planAhead"
set projName "1D_final_game"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/mojo_top_0.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/reset_conditioner_1.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/edge_detector_2.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/multi_dec_ctr_3.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/matrix_output_4.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/multi_seven_seg_5.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/decimal_counter_6.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/alu_7.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/button_conditioner_8.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/ws2812b_9.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/sprite_10.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/randomNumGen_11.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/counter_12.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/seven_seg_13.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/decoder_14.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/adder_15.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/comparator_16.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/shifter_17.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/boolean_18.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/pipeline_19.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/registerSetup_20.v" "C:/Users/Tharun/Documents/mojo/1D_final_game/work/verilog/pn_gen_21.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/Tharun/Documents/mojo/1D_final_game/constraint/custom.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
