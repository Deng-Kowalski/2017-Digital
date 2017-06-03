# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir M:/Xilinx/projects/ad_frequncy2serial/ad_frequncy2serial.cache/wt [current_project]
set_property parent.project_path M:/Xilinx/projects/ad_frequncy2serial/ad_frequncy2serial.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo m:/Xilinx/projects/ad_frequncy2serial/ad_frequncy2serial.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files -quiet m:/Xilinx/projects/ad_frequncy2serial/ad_frequncy2serial.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0.dcp
set_property used_in_implementation false [get_files m:/Xilinx/projects/ad_frequncy2serial/ad_frequncy2serial.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0.dcp]
read_verilog -library xil_defaultlib {
  M:/Xilinx/projects/ad_frequncy2serial/ad_frequncy2serial.srcs/sources_1/new/analogfre2binary.v
  M:/Xilinx/projects/ad_frequncy2serial/ad_frequncy2serial.srcs/sources_1/new/ad.v
  M:/Xilinx/projects/ad_frequncy2serial/ad_frequncy2serial.srcs/sources_1/new/binary2bcd.v
  M:/Xilinx/projects/ad_frequncy2serial/ad_frequncy2serial.srcs/sources_1/new/bcd_round.v
  M:/Xilinx/projects/ad_frequncy2serial/ad_frequncy2serial.srcs/sources_1/new/7digits.v
  M:/Xilinx/projects/ad_frequncy2serial/ad_frequncy2serial.srcs/sources_1/new/main.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc M:/Xilinx/projects/ad_frequncy2serial/ad_frequncy2serial.srcs/constrs_1/new/main.xdc
set_property used_in_implementation false [get_files M:/Xilinx/projects/ad_frequncy2serial/ad_frequncy2serial.srcs/constrs_1/new/main.xdc]


synth_design -top main -part xc7a35tcsg324-1


write_checkpoint -force -noxdef main.dcp

catch { report_utilization -file main_utilization_synth.rpt -pb main_utilization_synth.pb }
