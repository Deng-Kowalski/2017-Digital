# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7a35tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir M:/Xilinx/projects/adda/adda.cache/wt [current_project]
set_property parent.project_path M:/Xilinx/projects/adda/adda.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo m:/Xilinx/projects/adda/adda.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet m:/Xilinx/projects/adda/adda.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0.xci
set_property is_locked true [get_files m:/Xilinx/projects/adda/adda.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0.xci]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir M:/Xilinx/projects/adda/adda.runs/xadc_wiz_0_synth_1 -new_name xadc_wiz_0 -ip [get_ips xadc_wiz_0]]

if { $cached_ip eq {} } {

synth_design -top xadc_wiz_0 -part xc7a35tcsg324-1 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
catch {
 write_checkpoint -force -noxdef -rename_prefix xadc_wiz_0_ xadc_wiz_0.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ xadc_wiz_0_stub.v
 lappend ipCachedFiles xadc_wiz_0_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ xadc_wiz_0_stub.vhdl
 lappend ipCachedFiles xadc_wiz_0_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ xadc_wiz_0_sim_netlist.v
 lappend ipCachedFiles xadc_wiz_0_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ xadc_wiz_0_sim_netlist.vhdl
 lappend ipCachedFiles xadc_wiz_0_sim_netlist.vhdl

 config_ip_cache -add -dcp xadc_wiz_0.dcp -move_files $ipCachedFiles -use_project_ipc -ip [get_ips xadc_wiz_0]
}

rename_ref -prefix_all xadc_wiz_0_

write_checkpoint -force -noxdef xadc_wiz_0.dcp

catch { report_utilization -file xadc_wiz_0_utilization_synth.rpt -pb xadc_wiz_0_utilization_synth.pb }

if { [catch {
  file copy -force M:/Xilinx/projects/adda/adda.runs/xadc_wiz_0_synth_1/xadc_wiz_0.dcp m:/Xilinx/projects/adda/adda.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub m:/Xilinx/projects/adda/adda.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub m:/Xilinx/projects/adda/adda.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim m:/Xilinx/projects/adda/adda.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim m:/Xilinx/projects/adda/adda.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force M:/Xilinx/projects/adda/adda.runs/xadc_wiz_0_synth_1/xadc_wiz_0.dcp m:/Xilinx/projects/adda/adda.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force M:/Xilinx/projects/adda/adda.runs/xadc_wiz_0_synth_1/xadc_wiz_0_stub.v m:/Xilinx/projects/adda/adda.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force M:/Xilinx/projects/adda/adda.runs/xadc_wiz_0_synth_1/xadc_wiz_0_stub.vhdl m:/Xilinx/projects/adda/adda.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force M:/Xilinx/projects/adda/adda.runs/xadc_wiz_0_synth_1/xadc_wiz_0_sim_netlist.v m:/Xilinx/projects/adda/adda.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force M:/Xilinx/projects/adda/adda.runs/xadc_wiz_0_synth_1/xadc_wiz_0_sim_netlist.vhdl m:/Xilinx/projects/adda/adda.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir M:/Xilinx/projects/adda/adda.ip_user_files/ip/xadc_wiz_0]} {
  catch { 
    file copy -force m:/Xilinx/projects/adda/adda.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_stub.v M:/Xilinx/projects/adda/adda.ip_user_files/ip/xadc_wiz_0
  }
}

if {[file isdir M:/Xilinx/projects/adda/adda.ip_user_files/ip/xadc_wiz_0]} {
  catch { 
    file copy -force m:/Xilinx/projects/adda/adda.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_stub.vhdl M:/Xilinx/projects/adda/adda.ip_user_files/ip/xadc_wiz_0
  }
}