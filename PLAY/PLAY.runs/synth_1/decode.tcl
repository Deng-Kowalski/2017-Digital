# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir M:/Xilinx/projects/PLAY/PLAY.cache/wt [current_project]
set_property parent.project_path M:/Xilinx/projects/PLAY/PLAY.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo m:/Xilinx/projects/PLAY/PLAY.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files -quiet m:/Xilinx/projects/PLAY/PLAY.srcs/sources_1/ip/xadc_1/xadc_1.dcp
set_property used_in_implementation false [get_files m:/Xilinx/projects/PLAY/PLAY.srcs/sources_1/ip/xadc_1/xadc_1.dcp]
add_files -quiet m:/Xilinx/projects/PLAY/PLAY.srcs/sources_1/ip/clk_wiz_0_2/clk_wiz_0.dcp
set_property used_in_implementation false [get_files m:/Xilinx/projects/PLAY/PLAY.srcs/sources_1/ip/clk_wiz_0_2/clk_wiz_0.dcp]
read_verilog -library xil_defaultlib M:/Xilinx/projects/PLAY/PLAY.srcs/sources_1/new/decode.v
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc M:/Xilinx/projects/PLAY/PLAY.srcs/constrs_1/new/DECODE.xdc
set_property used_in_implementation false [get_files M:/Xilinx/projects/PLAY/PLAY.srcs/constrs_1/new/DECODE.xdc]


synth_design -top decode -part xc7a35tcsg324-1


write_checkpoint -force -noxdef decode.dcp

catch { report_utilization -file decode_utilization_synth.rpt -pb decode_utilization_synth.pb }
