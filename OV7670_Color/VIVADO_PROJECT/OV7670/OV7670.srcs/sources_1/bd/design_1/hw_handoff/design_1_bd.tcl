
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# pixel_counter_v1, pixel_counter_v1, stream_aligner_new_fsm

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg484-1
   set_property BOARD_PART em.avnet.com:zed:part0:1.3 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: background_eraser
proc create_hier_cell_background_eraser { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_background_eraser() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 stream_out_V_V


  # Create pins
  create_bd_pin -dir I -type clk PCLK
  create_bd_pin -dir I -type data enable
  create_bd_pin -dir I -type rst resetn
  create_bd_pin -dir I -from 7 -to 0 tdata_camera
  create_bd_pin -dir I -from 7 -to 0 tdata_ref
  create_bd_pin -dir O tready_camera
  create_bd_pin -dir O tready_ref
  create_bd_pin -dir I tvalid_camera
  create_bd_pin -dir I tvalid_ref

  # Create instance: Background_subtractor_0, and set properties
  set Background_subtractor_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:Background_subtractor:1.0 Background_subtractor_0 ]

  # Create instance: ap_start_true, and set properties
  set ap_start_true [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 ap_start_true ]

  # Create instance: pixel_counter_camera, and set properties
  set block_name pixel_counter_v1
  set block_cell_name pixel_counter_camera
  if { [catch {set pixel_counter_camera [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pixel_counter_camera eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: pixel_counter_ref, and set properties
  set block_name pixel_counter_v1
  set block_cell_name pixel_counter_ref
  if { [catch {set pixel_counter_ref [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pixel_counter_ref eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: stream_aligner_new_f_0, and set properties
  set block_name stream_aligner_new_fsm
  set block_cell_name stream_aligner_new_f_0
  if { [catch {set stream_aligner_new_f_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $stream_aligner_new_f_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /background_eraser/stream_aligner_new_f_0/sync_rst]

  # Create instance: threshold_constant, and set properties
  set threshold_constant [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 threshold_constant ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {30} \
   CONFIG.CONST_WIDTH {8} \
 ] $threshold_constant

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins stream_out_V_V] [get_bd_intf_pins Background_subtractor_0/stream_out_V]

  # Create port connections
  connect_bd_net -net Background_subtractor_0_stream_new_V_V_TREADY [get_bd_pins Background_subtractor_0/stream_new_V_TREADY] [get_bd_pins stream_aligner_new_f_0/treadyOut_new]
  connect_bd_net -net Background_subtractor_0_stream_ref_V_V_TREADY [get_bd_pins Background_subtractor_0/stream_ref_V_TREADY] [get_bd_pins stream_aligner_new_f_0/treadyOut_ref]
  connect_bd_net -net Net [get_bd_pins tvalid_camera] [get_bd_pins Background_subtractor_0/stream_new_V_TVALID] [get_bd_pins pixel_counter_camera/tvalid] [get_bd_pins stream_aligner_new_f_0/tvalid_new]
  connect_bd_net -net Net1 [get_bd_pins tvalid_ref] [get_bd_pins Background_subtractor_0/stream_ref_V_TVALID] [get_bd_pins pixel_counter_ref/tvalid] [get_bd_pins stream_aligner_new_f_0/tvalid_ref]
  connect_bd_net -net PCLK_1 [get_bd_pins PCLK] [get_bd_pins Background_subtractor_0/ap_clk] [get_bd_pins pixel_counter_camera/clk] [get_bd_pins pixel_counter_ref/clk] [get_bd_pins stream_aligner_new_f_0/clk]
  connect_bd_net -net enable_0_1 [get_bd_pins enable] [get_bd_pins Background_subtractor_0/enable] [get_bd_pins stream_aligner_new_f_0/enable]
  connect_bd_net -net pixel_counter_camera_control [get_bd_pins pixel_counter_camera/control] [get_bd_pins stream_aligner_new_f_0/control_new]
  connect_bd_net -net pixel_counter_camera_frame_start [get_bd_pins pixel_counter_camera/frame_start] [get_bd_pins stream_aligner_new_f_0/frame_start_new]
  connect_bd_net -net pixel_counter_ref_control [get_bd_pins pixel_counter_ref/control] [get_bd_pins stream_aligner_new_f_0/control_ref]
  connect_bd_net -net pixel_counter_ref_frame_start [get_bd_pins pixel_counter_ref/frame_start] [get_bd_pins stream_aligner_new_f_0/frame_start_ref]
  connect_bd_net -net resetn_1 [get_bd_pins resetn] [get_bd_pins Background_subtractor_0/ap_rst_n] [get_bd_pins pixel_counter_camera/resetn] [get_bd_pins pixel_counter_ref/resetn] [get_bd_pins stream_aligner_new_f_0/resetn]
  connect_bd_net -net stream_aligner_new_f_0_sync_rst [get_bd_pins pixel_counter_camera/sync_rst] [get_bd_pins pixel_counter_ref/sync_rst] [get_bd_pins stream_aligner_new_f_0/sync_rst]
  connect_bd_net -net stream_aligner_new_f_0_tready_new [get_bd_pins tready_camera] [get_bd_pins stream_aligner_new_f_0/tready_new]
  connect_bd_net -net stream_aligner_new_f_0_tready_ref [get_bd_pins tready_ref] [get_bd_pins stream_aligner_new_f_0/tready_ref]
  connect_bd_net -net stream_new_V_V_TDATA_1 [get_bd_pins tdata_camera] [get_bd_pins Background_subtractor_0/stream_new_V_TDATA]
  connect_bd_net -net stream_ref_V_V_TDATA_1 [get_bd_pins tdata_ref] [get_bd_pins Background_subtractor_0/stream_ref_V_TDATA]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins Background_subtractor_0/ap_start] [get_bd_pins ap_start_true/dout]
  connect_bd_net -net xlconstant_0_dout1 [get_bd_pins Background_subtractor_0/threshold_V] [get_bd_pins threshold_constant/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: VDMA
proc create_hier_cell_VDMA { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_VDMA() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 AXIM_READER

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 AXIM_WRITER

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 AXIS_IN

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 AXIS_IN_RAW_CHROMA

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 AXIS_IN_RAW_LUMA

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 AXIS_OUT

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_AXILiteS

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_AXILiteS1

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_AXILiteS2

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_AXILite_raw_CHROMA

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_AXILite_raw_LUMA


  # Create pins
  create_bd_pin -dir I -from 0 -to 0 ap_start
  create_bd_pin -dir I -from 0 -to 0 -type rst aresetn_in
  create_bd_pin -dir I -from 0 -to 0 -type rst aresetn_out
  create_bd_pin -dir I -from 0 -to 0 -type rst aresetn_vdma
  create_bd_pin -dir I -type clk clk_in
  create_bd_pin -dir I -type clk clk_out
  create_bd_pin -dir I -type clk clk_vdma
  create_bd_pin -dir O -from 7 -to 0 -type data frame_index_V
  create_bd_pin -dir I -from 0 -to 0 -type rst interconnect_aresetn
  create_bd_pin -dir O -from 7 -to 0 tdata_ref
  create_bd_pin -dir I tready_ref
  create_bd_pin -dir O tvalid_ref

  # Create instance: axi_mem_intercon_reader, and set properties
  set axi_mem_intercon_reader [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon_reader ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {2} \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $axi_mem_intercon_reader

  # Create instance: axi_mem_intercon_writer, and set properties
  set axi_mem_intercon_writer [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon_writer ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {3} \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $axi_mem_intercon_writer

  # Create instance: axis_data_fifo_pipeline_to_writer, and set properties
  set axis_data_fifo_pipeline_to_writer [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_pipeline_to_writer ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {1024} \
   CONFIG.HAS_RD_DATA_COUNT {1} \
   CONFIG.HAS_WR_DATA_COUNT {1} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $axis_data_fifo_pipeline_to_writer

  # Create instance: axis_data_fifo_raw_CHROMA, and set properties
  set axis_data_fifo_raw_CHROMA [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_raw_CHROMA ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {1024} \
   CONFIG.HAS_RD_DATA_COUNT {1} \
   CONFIG.HAS_WR_DATA_COUNT {1} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $axis_data_fifo_raw_CHROMA

  # Create instance: axis_data_fifo_raw_LUMA, and set properties
  set axis_data_fifo_raw_LUMA [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_raw_LUMA ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {1024} \
   CONFIG.HAS_RD_DATA_COUNT {1} \
   CONFIG.HAS_WR_DATA_COUNT {1} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $axis_data_fifo_raw_LUMA

  # Create instance: axis_data_fifo_reader_ref, and set properties
  set axis_data_fifo_reader_ref [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_reader_ref ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {1024} \
   CONFIG.HAS_RD_DATA_COUNT {1} \
   CONFIG.HAS_WR_DATA_COUNT {1} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $axis_data_fifo_reader_ref

  # Create instance: axis_data_fifo_reader_to_vga, and set properties
  set axis_data_fifo_reader_to_vga [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_reader_to_vga ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {1024} \
   CONFIG.HAS_RD_DATA_COUNT {1} \
   CONFIG.HAS_WR_DATA_COUNT {1} \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $axis_data_fifo_reader_to_vga

  # Create instance: axis_to_ddr_writer_0, and set properties
  set axis_to_ddr_writer_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axis_to_ddr_writer:1.0 axis_to_ddr_writer_0 ]

  # Create instance: axis_to_ddr_writer_CHROMA, and set properties
  set axis_to_ddr_writer_CHROMA [ create_bd_cell -type ip -vlnv xilinx.com:hls:axis_to_ddr_writer:1.0 axis_to_ddr_writer_CHROMA ]

  # Create instance: axis_to_ddr_writer_LUMA, and set properties
  set axis_to_ddr_writer_LUMA [ create_bd_cell -type ip -vlnv xilinx.com:hls:axis_to_ddr_writer:1.0 axis_to_ddr_writer_LUMA ]

  # Create instance: ddr_to_axis_reader_0, and set properties
  set ddr_to_axis_reader_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:ddr_to_axis_reader:1.0 ddr_to_axis_reader_0 ]

  # Create instance: ddr_to_axis_reader_ref, and set properties
  set ddr_to_axis_reader_ref [ create_bd_cell -type ip -vlnv xilinx.com:hls:ddr_to_axis_reader:1.0 ddr_to_axis_reader_ref ]

  # Create interface connections
  connect_bd_intf_net -intf_net AXIS_IN_RAW_CHROMA_1 [get_bd_intf_pins AXIS_IN_RAW_CHROMA] [get_bd_intf_pins axis_data_fifo_raw_CHROMA/S_AXIS]
  connect_bd_intf_net -intf_net AXIS_IN_RAW_LUMA_1 [get_bd_intf_pins AXIS_IN_RAW_LUMA] [get_bd_intf_pins axis_data_fifo_raw_LUMA/S_AXIS]
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins s_axi_AXILiteS2] [get_bd_intf_pins ddr_to_axis_reader_ref/s_axi_AXILiteS]
  connect_bd_intf_net -intf_net Filter_Convolution_0_out_img_V [get_bd_intf_pins AXIS_IN] [get_bd_intf_pins axis_data_fifo_pipeline_to_writer/S_AXIS]
  connect_bd_intf_net -intf_net S01_AXI_1 [get_bd_intf_pins axi_mem_intercon_writer/S01_AXI] [get_bd_intf_pins axis_to_ddr_writer_CHROMA/m_axi_base_ddr_addr]
  connect_bd_intf_net -intf_net S02_AXI_1 [get_bd_intf_pins axi_mem_intercon_writer/S02_AXI] [get_bd_intf_pins axis_to_ddr_writer_LUMA/m_axi_base_ddr_addr]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins AXIM_WRITER] [get_bd_intf_pins axi_mem_intercon_writer/M00_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_reader_M00_AXI [get_bd_intf_pins AXIM_READER] [get_bd_intf_pins axi_mem_intercon_reader/M00_AXI]
  connect_bd_intf_net -intf_net axis_data_fifo_0_M_AXIS [get_bd_intf_pins axis_data_fifo_raw_LUMA/M_AXIS] [get_bd_intf_pins axis_to_ddr_writer_LUMA/inputStream_V]
  connect_bd_intf_net -intf_net axis_data_fifo_1_M_AXIS [get_bd_intf_pins axis_data_fifo_raw_CHROMA/M_AXIS] [get_bd_intf_pins axis_to_ddr_writer_CHROMA/inputStream_V]
  connect_bd_intf_net -intf_net axis_data_fifo_pipeline_to_writer_M_AXIS [get_bd_intf_pins axis_data_fifo_pipeline_to_writer/M_AXIS] [get_bd_intf_pins axis_to_ddr_writer_0/inputStream_V]
  connect_bd_intf_net -intf_net axis_data_fifo_reader_to_vga_M_AXIS [get_bd_intf_pins AXIS_OUT] [get_bd_intf_pins axis_data_fifo_reader_to_vga/M_AXIS]
  connect_bd_intf_net -intf_net axis_to_ddr_writer_0_m_axi_base_ddr_addr [get_bd_intf_pins axi_mem_intercon_writer/S00_AXI] [get_bd_intf_pins axis_to_ddr_writer_0/m_axi_base_ddr_addr]
  connect_bd_intf_net -intf_net ddr_to_axis_reader_0_m_axi_base_ddr_addr [get_bd_intf_pins axi_mem_intercon_reader/S00_AXI] [get_bd_intf_pins ddr_to_axis_reader_0/m_axi_base_ddr_addr]
  connect_bd_intf_net -intf_net ddr_to_axis_reader_0_outStream_V [get_bd_intf_pins axis_data_fifo_reader_to_vga/S_AXIS] [get_bd_intf_pins ddr_to_axis_reader_0/outStream_V]
  connect_bd_intf_net -intf_net ddr_to_axis_reader_ref_m_axi_base_ddr_addr [get_bd_intf_pins axi_mem_intercon_reader/S01_AXI] [get_bd_intf_pins ddr_to_axis_reader_ref/m_axi_base_ddr_addr]
  connect_bd_intf_net -intf_net ddr_to_axis_reader_ref_outStream_V [get_bd_intf_pins axis_data_fifo_reader_ref/S_AXIS] [get_bd_intf_pins ddr_to_axis_reader_ref/outStream_V]
  connect_bd_intf_net -intf_net s_axi_AXILiteS1_1 [get_bd_intf_pins s_axi_AXILiteS1] [get_bd_intf_pins ddr_to_axis_reader_0/s_axi_AXILiteS]
  connect_bd_intf_net -intf_net s_axi_AXILiteS_1 [get_bd_intf_pins s_axi_AXILiteS] [get_bd_intf_pins axis_to_ddr_writer_0/s_axi_AXILiteS]
  connect_bd_intf_net -intf_net s_axi_AXILite_raw_CHROMA_1 [get_bd_intf_pins s_axi_AXILite_raw_CHROMA] [get_bd_intf_pins axis_to_ddr_writer_CHROMA/s_axi_AXILiteS]
  connect_bd_intf_net -intf_net s_axi_AXILite_raw_LUMA_1 [get_bd_intf_pins s_axi_AXILite_raw_LUMA] [get_bd_intf_pins axis_to_ddr_writer_LUMA/s_axi_AXILiteS]

  # Create port connections
  connect_bd_net -net CLOCK_100M_1 [get_bd_pins clk_vdma] [get_bd_pins axi_mem_intercon_reader/ACLK] [get_bd_pins axi_mem_intercon_reader/M00_ACLK] [get_bd_pins axi_mem_intercon_reader/S00_ACLK] [get_bd_pins axi_mem_intercon_reader/S01_ACLK] [get_bd_pins axi_mem_intercon_writer/ACLK] [get_bd_pins axi_mem_intercon_writer/M00_ACLK] [get_bd_pins axi_mem_intercon_writer/S00_ACLK] [get_bd_pins axi_mem_intercon_writer/S01_ACLK] [get_bd_pins axi_mem_intercon_writer/S02_ACLK] [get_bd_pins axis_data_fifo_pipeline_to_writer/m_axis_aclk] [get_bd_pins axis_data_fifo_raw_CHROMA/m_axis_aclk] [get_bd_pins axis_data_fifo_raw_LUMA/m_axis_aclk] [get_bd_pins axis_data_fifo_reader_ref/s_axis_aclk] [get_bd_pins axis_data_fifo_reader_to_vga/s_axis_aclk] [get_bd_pins axis_to_ddr_writer_0/ap_clk] [get_bd_pins axis_to_ddr_writer_CHROMA/ap_clk] [get_bd_pins axis_to_ddr_writer_LUMA/ap_clk] [get_bd_pins ddr_to_axis_reader_0/ap_clk] [get_bd_pins ddr_to_axis_reader_ref/ap_clk]
  connect_bd_net -net PCLK_1 [get_bd_pins clk_in] [get_bd_pins axis_data_fifo_pipeline_to_writer/s_axis_aclk] [get_bd_pins axis_data_fifo_raw_CHROMA/s_axis_aclk] [get_bd_pins axis_data_fifo_raw_LUMA/s_axis_aclk] [get_bd_pins axis_data_fifo_reader_ref/m_axis_aclk]
  connect_bd_net -net aresetn_in_1 [get_bd_pins aresetn_in] [get_bd_pins axis_data_fifo_pipeline_to_writer/s_axis_aresetn] [get_bd_pins axis_data_fifo_raw_CHROMA/s_axis_aresetn] [get_bd_pins axis_data_fifo_raw_LUMA/s_axis_aresetn]
  connect_bd_net -net aresetn_vga -boundary_type lower [get_bd_pins aresetn_out]
  connect_bd_net -net axis_data_fifo_reader_to_vga_1_m_axis_tdata [get_bd_pins tdata_ref] [get_bd_pins axis_data_fifo_reader_ref/m_axis_tdata]
  connect_bd_net -net axis_data_fifo_reader_to_vga_1_m_axis_tvalid [get_bd_pins tvalid_ref] [get_bd_pins axis_data_fifo_reader_ref/m_axis_tvalid]
  connect_bd_net -net axis_to_ddr_writer_0_frame_index_V [get_bd_pins frame_index_V] [get_bd_pins axis_to_ddr_writer_0/frame_index_V] [get_bd_pins ddr_to_axis_reader_0/frame_index_V] [get_bd_pins ddr_to_axis_reader_ref/frame_index_V]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins clk_out] [get_bd_pins axis_data_fifo_reader_to_vga/m_axis_aclk]
  connect_bd_net -net m_axis_tready_1 [get_bd_pins tready_ref] [get_bd_pins axis_data_fifo_reader_ref/m_axis_tready]
  connect_bd_net -net rst_processing_system7_0_100M_interconnect_aresetn [get_bd_pins interconnect_aresetn] [get_bd_pins axi_mem_intercon_reader/ARESETN] [get_bd_pins axi_mem_intercon_writer/ARESETN]
  connect_bd_net -net rst_processing_system7_0_100M_peripheral_aresetn [get_bd_pins aresetn_vdma] [get_bd_pins axi_mem_intercon_reader/M00_ARESETN] [get_bd_pins axi_mem_intercon_reader/S00_ARESETN] [get_bd_pins axi_mem_intercon_reader/S01_ARESETN] [get_bd_pins axi_mem_intercon_writer/M00_ARESETN] [get_bd_pins axi_mem_intercon_writer/S00_ARESETN] [get_bd_pins axi_mem_intercon_writer/S01_ARESETN] [get_bd_pins axi_mem_intercon_writer/S02_ARESETN] [get_bd_pins axis_data_fifo_reader_ref/s_axis_aresetn] [get_bd_pins axis_data_fifo_reader_to_vga/s_axis_aresetn] [get_bd_pins axis_to_ddr_writer_0/ap_rst_n] [get_bd_pins axis_to_ddr_writer_CHROMA/ap_rst_n] [get_bd_pins axis_to_ddr_writer_LUMA/ap_rst_n] [get_bd_pins ddr_to_axis_reader_0/ap_rst_n] [get_bd_pins ddr_to_axis_reader_ref/ap_rst_n]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: OV7670_GRAYSCALE_TO_AXIS
proc create_hier_cell_OV7670_GRAYSCALE_TO_AXIS { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_OV7670_GRAYSCALE_TO_AXIS() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 AXIM_READER_SD

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 outStream_V_V

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 outStream_raw_CHROMA

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 outStream_raw_LUMA


  # Create pins
  create_bd_pin -dir O -from 0 -to 0 -type data LED_FRAME_VALID
  create_bd_pin -dir I -type clk ap_clk
  create_bd_pin -dir I -from 0 -to 0 -type rst ap_rst
  create_bd_pin -dir I -from 0 -to 0 -type rst ap_rst_n
  create_bd_pin -dir I -from 0 -to 0 ap_start
  create_bd_pin -dir I -from 7 -to 0 -type data data_in
  create_bd_pin -dir I -from 0 -to 0 -type data enable_raw_stream
  create_bd_pin -dir I -from 0 -to 0 -type data href
  create_bd_pin -dir I -from 0 -to 0 -type data vsync

  # Create instance: LF_valid_to_AXIS, and set properties
  set LF_valid_to_AXIS [ create_bd_cell -type ip -vlnv xilinx.com:hls:LF_valid_to_AXIS:1.0 LF_valid_to_AXIS ]

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {2} \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $axi_interconnect_0

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $axi_interconnect_1

  # Create instance: c_counter_binary_0, and set properties
  set c_counter_binary_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 c_counter_binary_0 ]
  set_property -dict [ list \
   CONFIG.Output_Width {4} \
   CONFIG.Restrict_Count {false} \
   CONFIG.Sync_Threshold_Output {true} \
   CONFIG.Threshold_Value {F} \
 ] $c_counter_binary_0

  # Create instance: ddr_to_axis_reader_SD_0, and set properties
  set ddr_to_axis_reader_SD_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:ddr_to_axis_reader_SD:1.0 ddr_to_axis_reader_SD_0 ]

  # Create instance: mux_sd_ov_1, and set properties
  set mux_sd_ov_1 [ create_bd_cell -type ip -vlnv xilinx.com:hls:mux_sd_ov:1.0 mux_sd_ov_1 ]

  # Create instance: ov7670_LUMA_CHROMA_0, and set properties
  set ov7670_LUMA_CHROMA_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:ov7670_LUMA_CHROMA:1.0 ov7670_LUMA_CHROMA_0 ]

  # Create instance: ov7670_interface_0, and set properties
  set ov7670_interface_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:ov7670_interface:1.0 ov7670_interface_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net LF_valid_to_AXIS_outputStream_V_V [get_bd_intf_pins LF_valid_to_AXIS/outputStream_V_V] [get_bd_intf_pins mux_sd_ov_1/data_in_ov7670_V_V]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins S00_AXI] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins ddr_to_axis_reader_SD_0/s_axi_AXILiteS]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_interconnect_0/M01_AXI] [get_bd_intf_pins mux_sd_ov_1/s_axi_AXILiteS]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins AXIM_READER_SD] [get_bd_intf_pins axi_interconnect_1/M00_AXI]
  connect_bd_intf_net -intf_net ddr_to_axis_reader_SD_0_m_axi_base_ddr_addr [get_bd_intf_pins axi_interconnect_1/S00_AXI] [get_bd_intf_pins ddr_to_axis_reader_SD_0/m_axi_base_ddr_addr]
  connect_bd_intf_net -intf_net ddr_to_axis_reader_SD_0_outStream_channel_1_V [get_bd_intf_pins ddr_to_axis_reader_SD_0/outStream_channel_1_V] [get_bd_intf_pins mux_sd_ov_1/data_in_sd_V_V]
  connect_bd_intf_net -intf_net mux_sd_ov_1_outputStream_V_V [get_bd_intf_pins mux_sd_ov_1/outputStream_V_V] [get_bd_intf_pins ov7670_LUMA_CHROMA_0/inStream_V_V]
  connect_bd_intf_net -intf_net ov7670_LUMA_CHROMA_0_outStream_CHROMA_V_V [get_bd_intf_pins outStream_raw_CHROMA] [get_bd_intf_pins ov7670_LUMA_CHROMA_0/outStream_CHROMA_V_V]
  connect_bd_intf_net -intf_net ov7670_LUMA_CHROMA_0_outStream_LUMA_V_V [get_bd_intf_pins outStream_raw_LUMA] [get_bd_intf_pins ov7670_LUMA_CHROMA_0/outStream_LUMA_V_V]
  connect_bd_intf_net -intf_net ov7670_LUMA_CHROMA_0_outStream_grayscale_V_V [get_bd_intf_pins outStream_V_V] [get_bd_intf_pins ov7670_LUMA_CHROMA_0/outStream_grayscale_V_V]

  # Create port connections
  connect_bd_net -net PCLK_1 [get_bd_pins ap_clk] [get_bd_pins LF_valid_to_AXIS/ap_clk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK] [get_bd_pins ddr_to_axis_reader_SD_0/ap_clk] [get_bd_pins mux_sd_ov_1/ap_clk] [get_bd_pins ov7670_LUMA_CHROMA_0/ap_clk] [get_bd_pins ov7670_interface_0/ap_clk]
  connect_bd_net -net ap_start_1 [get_bd_pins ap_start] [get_bd_pins LF_valid_to_AXIS/ap_start] [get_bd_pins mux_sd_ov_1/ap_start] [get_bd_pins ov7670_LUMA_CHROMA_0/ap_start] [get_bd_pins ov7670_interface_0/ap_start]
  connect_bd_net -net c_counter_binary_0_THRESH0 [get_bd_pins LED_FRAME_VALID] [get_bd_pins c_counter_binary_0/THRESH0]
  connect_bd_net -net data_in_V_1 [get_bd_pins data_in] [get_bd_pins ov7670_interface_0/data_in_V]
  connect_bd_net -net enable_raw_stream_1 [get_bd_pins enable_raw_stream] [get_bd_pins ov7670_LUMA_CHROMA_0/enable_raw_stream]
  connect_bd_net -net href_V_1 [get_bd_pins href] [get_bd_pins ov7670_interface_0/href_V]
  connect_bd_net -net ov7670_interface_0_data_out_V [get_bd_pins LF_valid_to_AXIS/data_in_V] [get_bd_pins ov7670_interface_0/data_out_V]
  set_property HDL_ATTRIBUTE.DEBUG_IN_BD {true} [get_bd_nets ov7670_interface_0_data_out_V]
  set_property HDL_ATTRIBUTE.MARK_DEBUG {true} [get_bd_nets ov7670_interface_0_data_out_V]
  connect_bd_net -net ov7670_interface_0_frame_valid_V [get_bd_pins LF_valid_to_AXIS/frame_valid] [get_bd_pins c_counter_binary_0/CLK] [get_bd_pins ov7670_interface_0/frame_valid_V]
  set_property HDL_ATTRIBUTE.DEBUG_IN_BD {true} [get_bd_nets ov7670_interface_0_frame_valid_V]
  set_property HDL_ATTRIBUTE.MARK_DEBUG {true} [get_bd_nets ov7670_interface_0_frame_valid_V]
  connect_bd_net -net ov7670_interface_0_line_valid_V [get_bd_pins LF_valid_to_AXIS/line_valid] [get_bd_pins ov7670_interface_0/line_valid_V]
  set_property HDL_ATTRIBUTE.DEBUG_IN_BD {true} [get_bd_nets ov7670_interface_0_line_valid_V]
  set_property HDL_ATTRIBUTE.MARK_DEBUG {true} [get_bd_nets ov7670_interface_0_line_valid_V]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins ap_rst_n] [get_bd_pins LF_valid_to_AXIS/ap_rst_n] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN] [get_bd_pins ddr_to_axis_reader_SD_0/ap_rst_n] [get_bd_pins mux_sd_ov_1/ap_rst_n] [get_bd_pins ov7670_LUMA_CHROMA_0/ap_rst_n]
  connect_bd_net -net reset_24M_peripheral_reset [get_bd_pins ap_rst] [get_bd_pins ov7670_interface_0/ap_rst]
  connect_bd_net -net vsync_V_1 [get_bd_pins vsync] [get_bd_pins ov7670_interface_0/vsync_V]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: Convolution_Filter
proc create_hier_cell_Convolution_Filter { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_Convolution_Filter() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 in_img_V

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 out_img_V


  # Create pins
  create_bd_pin -dir I -type clk ap_clk
  create_bd_pin -dir I -from 0 -to 0 -type rst ap_rst_n
  create_bd_pin -dir I -from 0 -to 0 ap_start
  create_bd_pin -dir O -from 7 -to 0 out_img_V_TDATA1
  create_bd_pin -dir I out_img_V_TREADY1
  create_bd_pin -dir O out_img_V_TVALID1

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $axi_interconnect_0

  # Create instance: convolution_filter_0, and set properties
  set convolution_filter_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:convolution_filter:1.0 convolution_filter_0 ]

  # Create instance: sep_convolution_filter_0, and set properties
  set sep_convolution_filter_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:sep_convolution_filter:1.0 sep_convolution_filter_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins in_img_V] [get_bd_intf_pins sep_convolution_filter_0/in_img_V]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S00_AXI] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins sep_convolution_filter_0/s_axi_AXILiteS]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_interconnect_0/M01_AXI] [get_bd_intf_pins convolution_filter_0/s_axi_AXILiteS]
  connect_bd_intf_net -intf_net sep_convolution_filter_0_out_img_V [get_bd_intf_pins convolution_filter_0/in_img_V] [get_bd_intf_pins sep_convolution_filter_0/out_img_V]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins ap_rst_n] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins convolution_filter_0/ap_rst_n] [get_bd_pins sep_convolution_filter_0/ap_rst_n]
  connect_bd_net -net M00_ACLK_1 [get_bd_pins ap_clk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins convolution_filter_0/ap_clk] [get_bd_pins sep_convolution_filter_0/ap_clk]
  connect_bd_net -net Net [get_bd_pins ap_start] [get_bd_pins convolution_filter_0/ap_start] [get_bd_pins sep_convolution_filter_0/ap_start]
  connect_bd_net -net convolution_filter_0_out_img_V_TDATA [get_bd_pins out_img_V_TDATA1] [get_bd_pins convolution_filter_0/out_img_V_TDATA]
  connect_bd_net -net convolution_filter_0_out_img_V_TVALID [get_bd_pins out_img_V_TVALID1] [get_bd_pins convolution_filter_0/out_img_V_TVALID]
  connect_bd_net -net out_img_V_TREADY1_1 [get_bd_pins out_img_V_TREADY1] [get_bd_pins convolution_filter_0/out_img_V_TREADY]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]

  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]


  # Create ports
  set B_V [ create_bd_port -dir O -from 3 -to 0 -type data B_V ]
  set G_V [ create_bd_port -dir O -from 3 -to 0 -type data G_V ]
  set H_SYNC_V [ create_bd_port -dir O -from 0 -to 0 -type data H_SYNC_V ]
  set LED_FRAME_VALID [ create_bd_port -dir O -from 0 -to 0 -type data LED_FRAME_VALID ]
  set OV7670_RESET [ create_bd_port -dir O -from 0 -to 0 -type rst OV7670_RESET ]
  set PCLK [ create_bd_port -dir I -type clk PCLK ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {24000000} \
 ] $PCLK
  set R_V [ create_bd_port -dir O -from 3 -to 0 -type data R_V ]
  set V_SYNC_V [ create_bd_port -dir O -from 0 -to 0 -type data V_SYNC_V ]
  set XCLK [ create_bd_port -dir O -type clk XCLK ]
  set capture_ref [ create_bd_port -dir I -type intr capture_ref ]
  set data_in_V [ create_bd_port -dir I -from 7 -to 0 -type data data_in_V ]
  set_property -dict [ list \
   CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}} \
 ] $data_in_V
  set enable_compare [ create_bd_port -dir I -type data enable_compare ]
  set href_V [ create_bd_port -dir I -from 0 -to 0 -type data href_V ]
  set_property -dict [ list \
   CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}} \
 ] $href_V
  set reset_sw [ create_bd_port -dir I -type intr reset_sw ]
  set selftest [ create_bd_port -dir I -from 0 -to 0 -type data selftest ]
  set_property -dict [ list \
   CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}} \
 ] $selftest
  set vsync_V [ create_bd_port -dir I -from 0 -to 0 -type data vsync_V ]
  set_property -dict [ list \
   CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}} \
 ] $vsync_V

  # Create instance: Convolution_Filter
  create_hier_cell_Convolution_Filter [current_bd_instance .] Convolution_Filter

  # Create instance: ENABLE_RAW_STREAM, and set properties
  set ENABLE_RAW_STREAM [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 ENABLE_RAW_STREAM ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {1} \
 ] $ENABLE_RAW_STREAM

  # Create instance: OV7670_GRAYSCALE_TO_AXIS
  create_hier_cell_OV7670_GRAYSCALE_TO_AXIS [current_bd_instance .] OV7670_GRAYSCALE_TO_AXIS

  # Create instance: VDMA
  create_hier_cell_VDMA [current_bd_instance .] VDMA

  # Create instance: axi_gpio_frame_intr, and set properties
  set axi_gpio_frame_intr [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_frame_intr ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS {1} \
   CONFIG.C_GPIO_WIDTH {8} \
   CONFIG.C_INTERRUPT_PRESENT {1} \
 ] $axi_gpio_frame_intr

  # Create instance: axi_gpio_pl_reset, and set properties
  set axi_gpio_pl_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_pl_reset ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_DOUT_DEFAULT {0x00000001} \
   CONFIG.C_GPIO_WIDTH {1} \
 ] $axi_gpio_pl_reset

  # Create instance: axi_stream_to_vga_0, and set properties
  set axi_stream_to_vga_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:axi_stream_to_vga:1.0 axi_stream_to_vga_0 ]

  # Create instance: background_eraser
  create_hier_cell_background_eraser [current_bd_instance .] background_eraser

  # Create instance: clk_gen_25M_24M, and set properties
  set clk_gen_25M_24M [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_gen_25M_24M ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_JITTER {469.645} \
   CONFIG.CLKOUT1_PHASE_ERROR {476.991} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {25.175} \
   CONFIG.CLKOUT2_JITTER {473.605} \
   CONFIG.CLKOUT2_PHASE_ERROR {476.991} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {24} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {53.750} \
   CONFIG.MMCM_CLKIN1_PERIOD {10.000} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.000} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {30.500} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {32} \
   CONFIG.MMCM_DIVCLK_DIVIDE {7} \
   CONFIG.NUM_OUT_CLKS {2} \
   CONFIG.USE_LOCKED {false} \
   CONFIG.USE_RESET {false} \
 ] $clk_gen_25M_24M

  # Create instance: const_1, and set properties
  set const_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_1 ]

  # Create instance: const_true, and set properties
  set const_true [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_true ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
   CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {666.666687} \
   CONFIG.PCW_ACT_CAN0_PERIPHERAL_FREQMHZ {23.8095} \
   CONFIG.PCW_ACT_CAN1_PERIPHERAL_FREQMHZ {23.8095} \
   CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.158730} \
   CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {125.000000} \
   CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {100.000000} \
   CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_I2C_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {50.000000} \
   CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {50.000000} \
   CONFIG.PCW_ACT_USB0_PERIPHERAL_FREQMHZ {60} \
   CONFIG.PCW_ACT_USB1_PERIPHERAL_FREQMHZ {60} \
   CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_APU_CLK_RATIO_ENABLE {6:2:1} \
   CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {666.666667} \
   CONFIG.PCW_ARMPLL_CTRL_FBDIV {40} \
   CONFIG.PCW_CAN0_BASEADDR {0xE0008000} \
   CONFIG.PCW_CAN0_GRP_CLK_ENABLE {0} \
   CONFIG.PCW_CAN0_HIGHADDR {0xE0008FFF} \
   CONFIG.PCW_CAN0_PERIPHERAL_CLKSRC {External} \
   CONFIG.PCW_CAN0_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_CAN0_PERIPHERAL_FREQMHZ {-1} \
   CONFIG.PCW_CAN1_BASEADDR {0xE0009000} \
   CONFIG.PCW_CAN1_GRP_CLK_ENABLE {0} \
   CONFIG.PCW_CAN1_HIGHADDR {0xE0009FFF} \
   CONFIG.PCW_CAN1_PERIPHERAL_CLKSRC {External} \
   CONFIG.PCW_CAN1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_CAN1_PERIPHERAL_FREQMHZ {-1} \
   CONFIG.PCW_CAN_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_CAN_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_CAN_PERIPHERAL_VALID {0} \
   CONFIG.PCW_CLK0_FREQ {100000000} \
   CONFIG.PCW_CLK1_FREQ {10000000} \
   CONFIG.PCW_CLK2_FREQ {10000000} \
   CONFIG.PCW_CLK3_FREQ {10000000} \
   CONFIG.PCW_CORE0_FIQ_INTR {0} \
   CONFIG.PCW_CORE0_IRQ_INTR {0} \
   CONFIG.PCW_CORE1_FIQ_INTR {0} \
   CONFIG.PCW_CORE1_IRQ_INTR {0} \
   CONFIG.PCW_CPU_CPU_6X4X_MAX_RANGE {667} \
   CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {1333.333} \
   CONFIG.PCW_CPU_PERIPHERAL_CLKSRC {ARM PLL} \
   CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {33.333333} \
   CONFIG.PCW_DCI_PERIPHERAL_CLKSRC {DDR PLL} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {15} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {7} \
   CONFIG.PCW_DCI_PERIPHERAL_FREQMHZ {10.159} \
   CONFIG.PCW_DDRPLL_CTRL_FBDIV {32} \
   CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {1066.667} \
   CONFIG.PCW_DDR_HPRLPR_QUEUE_PARTITION {HPR(24)/LPR(8)} \
   CONFIG.PCW_DDR_HPR_TO_CRITICAL_PRIORITY_LEVEL {15} \
   CONFIG.PCW_DDR_LPR_TO_CRITICAL_PRIORITY_LEVEL {2} \
   CONFIG.PCW_DDR_PERIPHERAL_CLKSRC {DDR PLL} \
   CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_DDR_PORT0_HPR_ENABLE {0} \
   CONFIG.PCW_DDR_PORT1_HPR_ENABLE {0} \
   CONFIG.PCW_DDR_PORT2_HPR_ENABLE {1} \
   CONFIG.PCW_DDR_PORT3_HPR_ENABLE {1} \
   CONFIG.PCW_DDR_PRIORITY_READPORT_0 {Low} \
   CONFIG.PCW_DDR_PRIORITY_READPORT_1 {Low} \
   CONFIG.PCW_DDR_PRIORITY_READPORT_2 {High} \
   CONFIG.PCW_DDR_PRIORITY_READPORT_3 {Low} \
   CONFIG.PCW_DDR_PRIORITY_WRITEPORT_0 {Low} \
   CONFIG.PCW_DDR_PRIORITY_WRITEPORT_1 {Low} \
   CONFIG.PCW_DDR_PRIORITY_WRITEPORT_2 {Low} \
   CONFIG.PCW_DDR_PRIORITY_WRITEPORT_3 {High} \
   CONFIG.PCW_DDR_RAM_BASEADDR {0x00100000} \
   CONFIG.PCW_DDR_RAM_HIGHADDR {0x1FFFFFFF} \
   CONFIG.PCW_DDR_WRITE_TO_CRITICAL_PRIORITY_LEVEL {2} \
   CONFIG.PCW_DM_WIDTH {4} \
   CONFIG.PCW_DQS_WIDTH {4} \
   CONFIG.PCW_DQ_WIDTH {32} \
   CONFIG.PCW_ENET0_BASEADDR {0xE000B000} \
   CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
   CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
   CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} \
   CONFIG.PCW_ENET0_HIGHADDR {0xE000BFFF} \
   CONFIG.PCW_ENET0_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {8} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_FREQMHZ {1000 Mbps} \
   CONFIG.PCW_ENET0_RESET_ENABLE {0} \
   CONFIG.PCW_ENET1_BASEADDR {0xE000C000} \
   CONFIG.PCW_ENET1_GRP_MDIO_ENABLE {0} \
   CONFIG.PCW_ENET1_HIGHADDR {0xE000CFFF} \
   CONFIG.PCW_ENET1_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_ENET1_PERIPHERAL_FREQMHZ {1000 Mbps} \
   CONFIG.PCW_ENET1_RESET_ENABLE {0} \
   CONFIG.PCW_ENET_RESET_ENABLE {1} \
   CONFIG.PCW_ENET_RESET_POLARITY {Active Low} \
   CONFIG.PCW_ENET_RESET_SELECT {Share reset pin} \
   CONFIG.PCW_EN_4K_TIMER {0} \
   CONFIG.PCW_EN_CAN0 {0} \
   CONFIG.PCW_EN_CAN1 {0} \
   CONFIG.PCW_EN_CLK0_PORT {1} \
   CONFIG.PCW_EN_CLK1_PORT {0} \
   CONFIG.PCW_EN_CLK2_PORT {0} \
   CONFIG.PCW_EN_CLK3_PORT {0} \
   CONFIG.PCW_EN_CLKTRIG0_PORT {0} \
   CONFIG.PCW_EN_CLKTRIG1_PORT {0} \
   CONFIG.PCW_EN_CLKTRIG2_PORT {0} \
   CONFIG.PCW_EN_CLKTRIG3_PORT {0} \
   CONFIG.PCW_EN_DDR {1} \
   CONFIG.PCW_EN_EMIO_CAN0 {0} \
   CONFIG.PCW_EN_EMIO_CAN1 {0} \
   CONFIG.PCW_EN_EMIO_CD_SDIO0 {0} \
   CONFIG.PCW_EN_EMIO_CD_SDIO1 {0} \
   CONFIG.PCW_EN_EMIO_ENET0 {0} \
   CONFIG.PCW_EN_EMIO_ENET1 {0} \
   CONFIG.PCW_EN_EMIO_GPIO {0} \
   CONFIG.PCW_EN_EMIO_I2C0 {0} \
   CONFIG.PCW_EN_EMIO_I2C1 {0} \
   CONFIG.PCW_EN_EMIO_MODEM_UART0 {0} \
   CONFIG.PCW_EN_EMIO_MODEM_UART1 {0} \
   CONFIG.PCW_EN_EMIO_PJTAG {0} \
   CONFIG.PCW_EN_EMIO_SDIO0 {0} \
   CONFIG.PCW_EN_EMIO_SDIO1 {0} \
   CONFIG.PCW_EN_EMIO_SPI0 {0} \
   CONFIG.PCW_EN_EMIO_SPI1 {0} \
   CONFIG.PCW_EN_EMIO_SRAM_INT {0} \
   CONFIG.PCW_EN_EMIO_TRACE {0} \
   CONFIG.PCW_EN_EMIO_TTC0 {1} \
   CONFIG.PCW_EN_EMIO_TTC1 {0} \
   CONFIG.PCW_EN_EMIO_UART0 {0} \
   CONFIG.PCW_EN_EMIO_UART1 {0} \
   CONFIG.PCW_EN_EMIO_WDT {0} \
   CONFIG.PCW_EN_EMIO_WP_SDIO0 {0} \
   CONFIG.PCW_EN_EMIO_WP_SDIO1 {0} \
   CONFIG.PCW_EN_ENET0 {1} \
   CONFIG.PCW_EN_ENET1 {0} \
   CONFIG.PCW_EN_GPIO {1} \
   CONFIG.PCW_EN_I2C0 {1} \
   CONFIG.PCW_EN_I2C1 {0} \
   CONFIG.PCW_EN_MODEM_UART0 {0} \
   CONFIG.PCW_EN_MODEM_UART1 {0} \
   CONFIG.PCW_EN_PJTAG {0} \
   CONFIG.PCW_EN_PTP_ENET0 {0} \
   CONFIG.PCW_EN_PTP_ENET1 {0} \
   CONFIG.PCW_EN_QSPI {1} \
   CONFIG.PCW_EN_RST0_PORT {1} \
   CONFIG.PCW_EN_RST1_PORT {0} \
   CONFIG.PCW_EN_RST2_PORT {0} \
   CONFIG.PCW_EN_RST3_PORT {0} \
   CONFIG.PCW_EN_SDIO0 {1} \
   CONFIG.PCW_EN_SDIO1 {0} \
   CONFIG.PCW_EN_SMC {0} \
   CONFIG.PCW_EN_SPI0 {0} \
   CONFIG.PCW_EN_SPI1 {0} \
   CONFIG.PCW_EN_TRACE {0} \
   CONFIG.PCW_EN_TTC0 {1} \
   CONFIG.PCW_EN_TTC1 {0} \
   CONFIG.PCW_EN_UART0 {0} \
   CONFIG.PCW_EN_UART1 {1} \
   CONFIG.PCW_EN_USB0 {1} \
   CONFIG.PCW_EN_USB1 {0} \
   CONFIG.PCW_EN_WDT {0} \
   CONFIG.PCW_FCLK0_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {2} \
   CONFIG.PCW_FCLK1_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK_CLK0_BUF {TRUE} \
   CONFIG.PCW_FCLK_CLK1_BUF {FALSE} \
   CONFIG.PCW_FCLK_CLK2_BUF {FALSE} \
   CONFIG.PCW_FCLK_CLK3_BUF {FALSE} \
   CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100.000000} \
   CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {150.000000} \
   CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_FPGA3_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_FPGA_FCLK0_ENABLE {1} \
   CONFIG.PCW_FPGA_FCLK1_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK2_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK3_ENABLE {0} \
   CONFIG.PCW_GP0_EN_MODIFIABLE_TXN {0} \
   CONFIG.PCW_GP0_NUM_READ_THREADS {4} \
   CONFIG.PCW_GP0_NUM_WRITE_THREADS {4} \
   CONFIG.PCW_GP1_EN_MODIFIABLE_TXN {0} \
   CONFIG.PCW_GP1_NUM_READ_THREADS {4} \
   CONFIG.PCW_GP1_NUM_WRITE_THREADS {4} \
   CONFIG.PCW_GPIO_BASEADDR {0xE000A000} \
   CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {0} \
   CONFIG.PCW_GPIO_EMIO_GPIO_WIDTH {64} \
   CONFIG.PCW_GPIO_HIGHADDR {0xE000AFFF} \
   CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
   CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO} \
   CONFIG.PCW_GPIO_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_I2C0_BASEADDR {0xE0004000} \
   CONFIG.PCW_I2C0_GRP_INT_ENABLE {0} \
   CONFIG.PCW_I2C0_HIGHADDR {0xE0004FFF} \
   CONFIG.PCW_I2C0_I2C0_IO {MIO 10 .. 11} \
   CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_I2C0_RESET_ENABLE {0} \
   CONFIG.PCW_I2C1_BASEADDR {0xE0005000} \
   CONFIG.PCW_I2C1_GRP_INT_ENABLE {0} \
   CONFIG.PCW_I2C1_HIGHADDR {0xE0005FFF} \
   CONFIG.PCW_I2C1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_I2C1_RESET_ENABLE {0} \
   CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_I2C_RESET_ENABLE {1} \
   CONFIG.PCW_I2C_RESET_POLARITY {Active Low} \
   CONFIG.PCW_I2C_RESET_SELECT {Share reset pin} \
   CONFIG.PCW_IMPORT_BOARD_PRESET {None} \
   CONFIG.PCW_INCLUDE_ACP_TRANS_CHECK {0} \
   CONFIG.PCW_INCLUDE_TRACE_BUFFER {0} \
   CONFIG.PCW_IOPLL_CTRL_FBDIV {30} \
   CONFIG.PCW_IO_IO_PLL_FREQMHZ {1000.000} \
   CONFIG.PCW_IRQ_F2P_INTR {1} \
   CONFIG.PCW_IRQ_F2P_MODE {DIRECT} \
   CONFIG.PCW_MIO_0_DIRECTION {inout} \
   CONFIG.PCW_MIO_0_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_0_PULLUP {disabled} \
   CONFIG.PCW_MIO_0_SLEW {slow} \
   CONFIG.PCW_MIO_10_DIRECTION {inout} \
   CONFIG.PCW_MIO_10_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_10_PULLUP {enabled} \
   CONFIG.PCW_MIO_10_SLEW {slow} \
   CONFIG.PCW_MIO_11_DIRECTION {inout} \
   CONFIG.PCW_MIO_11_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_11_PULLUP {enabled} \
   CONFIG.PCW_MIO_11_SLEW {slow} \
   CONFIG.PCW_MIO_12_DIRECTION {inout} \
   CONFIG.PCW_MIO_12_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_12_PULLUP {disabled} \
   CONFIG.PCW_MIO_12_SLEW {slow} \
   CONFIG.PCW_MIO_13_DIRECTION {inout} \
   CONFIG.PCW_MIO_13_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_13_PULLUP {disabled} \
   CONFIG.PCW_MIO_13_SLEW {slow} \
   CONFIG.PCW_MIO_14_DIRECTION {inout} \
   CONFIG.PCW_MIO_14_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_14_PULLUP {disabled} \
   CONFIG.PCW_MIO_14_SLEW {slow} \
   CONFIG.PCW_MIO_15_DIRECTION {inout} \
   CONFIG.PCW_MIO_15_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_15_PULLUP {disabled} \
   CONFIG.PCW_MIO_15_SLEW {slow} \
   CONFIG.PCW_MIO_16_DIRECTION {out} \
   CONFIG.PCW_MIO_16_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_16_PULLUP {disabled} \
   CONFIG.PCW_MIO_16_SLEW {fast} \
   CONFIG.PCW_MIO_17_DIRECTION {out} \
   CONFIG.PCW_MIO_17_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_17_PULLUP {disabled} \
   CONFIG.PCW_MIO_17_SLEW {fast} \
   CONFIG.PCW_MIO_18_DIRECTION {out} \
   CONFIG.PCW_MIO_18_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_18_PULLUP {disabled} \
   CONFIG.PCW_MIO_18_SLEW {fast} \
   CONFIG.PCW_MIO_19_DIRECTION {out} \
   CONFIG.PCW_MIO_19_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_19_PULLUP {disabled} \
   CONFIG.PCW_MIO_19_SLEW {fast} \
   CONFIG.PCW_MIO_1_DIRECTION {out} \
   CONFIG.PCW_MIO_1_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_1_PULLUP {disabled} \
   CONFIG.PCW_MIO_1_SLEW {fast} \
   CONFIG.PCW_MIO_20_DIRECTION {out} \
   CONFIG.PCW_MIO_20_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_20_PULLUP {disabled} \
   CONFIG.PCW_MIO_20_SLEW {fast} \
   CONFIG.PCW_MIO_21_DIRECTION {out} \
   CONFIG.PCW_MIO_21_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_21_PULLUP {disabled} \
   CONFIG.PCW_MIO_21_SLEW {fast} \
   CONFIG.PCW_MIO_22_DIRECTION {in} \
   CONFIG.PCW_MIO_22_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_22_PULLUP {disabled} \
   CONFIG.PCW_MIO_22_SLEW {fast} \
   CONFIG.PCW_MIO_23_DIRECTION {in} \
   CONFIG.PCW_MIO_23_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_23_PULLUP {disabled} \
   CONFIG.PCW_MIO_23_SLEW {fast} \
   CONFIG.PCW_MIO_24_DIRECTION {in} \
   CONFIG.PCW_MIO_24_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_24_PULLUP {disabled} \
   CONFIG.PCW_MIO_24_SLEW {fast} \
   CONFIG.PCW_MIO_25_DIRECTION {in} \
   CONFIG.PCW_MIO_25_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_25_PULLUP {disabled} \
   CONFIG.PCW_MIO_25_SLEW {fast} \
   CONFIG.PCW_MIO_26_DIRECTION {in} \
   CONFIG.PCW_MIO_26_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_26_PULLUP {disabled} \
   CONFIG.PCW_MIO_26_SLEW {fast} \
   CONFIG.PCW_MIO_27_DIRECTION {in} \
   CONFIG.PCW_MIO_27_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_27_PULLUP {disabled} \
   CONFIG.PCW_MIO_27_SLEW {fast} \
   CONFIG.PCW_MIO_28_DIRECTION {inout} \
   CONFIG.PCW_MIO_28_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_28_PULLUP {disabled} \
   CONFIG.PCW_MIO_28_SLEW {fast} \
   CONFIG.PCW_MIO_29_DIRECTION {in} \
   CONFIG.PCW_MIO_29_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_29_PULLUP {disabled} \
   CONFIG.PCW_MIO_29_SLEW {fast} \
   CONFIG.PCW_MIO_2_DIRECTION {inout} \
   CONFIG.PCW_MIO_2_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_2_PULLUP {disabled} \
   CONFIG.PCW_MIO_2_SLEW {fast} \
   CONFIG.PCW_MIO_30_DIRECTION {out} \
   CONFIG.PCW_MIO_30_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_30_PULLUP {disabled} \
   CONFIG.PCW_MIO_30_SLEW {fast} \
   CONFIG.PCW_MIO_31_DIRECTION {in} \
   CONFIG.PCW_MIO_31_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_31_PULLUP {disabled} \
   CONFIG.PCW_MIO_31_SLEW {fast} \
   CONFIG.PCW_MIO_32_DIRECTION {inout} \
   CONFIG.PCW_MIO_32_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_32_PULLUP {disabled} \
   CONFIG.PCW_MIO_32_SLEW {fast} \
   CONFIG.PCW_MIO_33_DIRECTION {inout} \
   CONFIG.PCW_MIO_33_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_33_PULLUP {disabled} \
   CONFIG.PCW_MIO_33_SLEW {fast} \
   CONFIG.PCW_MIO_34_DIRECTION {inout} \
   CONFIG.PCW_MIO_34_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_34_PULLUP {disabled} \
   CONFIG.PCW_MIO_34_SLEW {fast} \
   CONFIG.PCW_MIO_35_DIRECTION {inout} \
   CONFIG.PCW_MIO_35_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_35_PULLUP {disabled} \
   CONFIG.PCW_MIO_35_SLEW {fast} \
   CONFIG.PCW_MIO_36_DIRECTION {in} \
   CONFIG.PCW_MIO_36_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_36_PULLUP {disabled} \
   CONFIG.PCW_MIO_36_SLEW {fast} \
   CONFIG.PCW_MIO_37_DIRECTION {inout} \
   CONFIG.PCW_MIO_37_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_37_PULLUP {disabled} \
   CONFIG.PCW_MIO_37_SLEW {fast} \
   CONFIG.PCW_MIO_38_DIRECTION {inout} \
   CONFIG.PCW_MIO_38_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_38_PULLUP {disabled} \
   CONFIG.PCW_MIO_38_SLEW {fast} \
   CONFIG.PCW_MIO_39_DIRECTION {inout} \
   CONFIG.PCW_MIO_39_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_39_PULLUP {disabled} \
   CONFIG.PCW_MIO_39_SLEW {fast} \
   CONFIG.PCW_MIO_3_DIRECTION {inout} \
   CONFIG.PCW_MIO_3_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_3_PULLUP {disabled} \
   CONFIG.PCW_MIO_3_SLEW {fast} \
   CONFIG.PCW_MIO_40_DIRECTION {inout} \
   CONFIG.PCW_MIO_40_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_40_PULLUP {disabled} \
   CONFIG.PCW_MIO_40_SLEW {fast} \
   CONFIG.PCW_MIO_41_DIRECTION {inout} \
   CONFIG.PCW_MIO_41_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_41_PULLUP {disabled} \
   CONFIG.PCW_MIO_41_SLEW {fast} \
   CONFIG.PCW_MIO_42_DIRECTION {inout} \
   CONFIG.PCW_MIO_42_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_42_PULLUP {disabled} \
   CONFIG.PCW_MIO_42_SLEW {fast} \
   CONFIG.PCW_MIO_43_DIRECTION {inout} \
   CONFIG.PCW_MIO_43_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_43_PULLUP {disabled} \
   CONFIG.PCW_MIO_43_SLEW {fast} \
   CONFIG.PCW_MIO_44_DIRECTION {inout} \
   CONFIG.PCW_MIO_44_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_44_PULLUP {disabled} \
   CONFIG.PCW_MIO_44_SLEW {fast} \
   CONFIG.PCW_MIO_45_DIRECTION {inout} \
   CONFIG.PCW_MIO_45_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_45_PULLUP {disabled} \
   CONFIG.PCW_MIO_45_SLEW {fast} \
   CONFIG.PCW_MIO_46_DIRECTION {in} \
   CONFIG.PCW_MIO_46_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_46_PULLUP {disabled} \
   CONFIG.PCW_MIO_46_SLEW {slow} \
   CONFIG.PCW_MIO_47_DIRECTION {in} \
   CONFIG.PCW_MIO_47_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_47_PULLUP {disabled} \
   CONFIG.PCW_MIO_47_SLEW {slow} \
   CONFIG.PCW_MIO_48_DIRECTION {out} \
   CONFIG.PCW_MIO_48_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_48_PULLUP {disabled} \
   CONFIG.PCW_MIO_48_SLEW {slow} \
   CONFIG.PCW_MIO_49_DIRECTION {in} \
   CONFIG.PCW_MIO_49_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_49_PULLUP {disabled} \
   CONFIG.PCW_MIO_49_SLEW {slow} \
   CONFIG.PCW_MIO_4_DIRECTION {inout} \
   CONFIG.PCW_MIO_4_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_4_PULLUP {disabled} \
   CONFIG.PCW_MIO_4_SLEW {fast} \
   CONFIG.PCW_MIO_50_DIRECTION {inout} \
   CONFIG.PCW_MIO_50_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_50_PULLUP {disabled} \
   CONFIG.PCW_MIO_50_SLEW {slow} \
   CONFIG.PCW_MIO_51_DIRECTION {inout} \
   CONFIG.PCW_MIO_51_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_51_PULLUP {disabled} \
   CONFIG.PCW_MIO_51_SLEW {slow} \
   CONFIG.PCW_MIO_52_DIRECTION {out} \
   CONFIG.PCW_MIO_52_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_52_PULLUP {disabled} \
   CONFIG.PCW_MIO_52_SLEW {slow} \
   CONFIG.PCW_MIO_53_DIRECTION {inout} \
   CONFIG.PCW_MIO_53_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_53_PULLUP {disabled} \
   CONFIG.PCW_MIO_53_SLEW {slow} \
   CONFIG.PCW_MIO_5_DIRECTION {inout} \
   CONFIG.PCW_MIO_5_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_5_PULLUP {disabled} \
   CONFIG.PCW_MIO_5_SLEW {fast} \
   CONFIG.PCW_MIO_6_DIRECTION {out} \
   CONFIG.PCW_MIO_6_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_6_PULLUP {disabled} \
   CONFIG.PCW_MIO_6_SLEW {fast} \
   CONFIG.PCW_MIO_7_DIRECTION {out} \
   CONFIG.PCW_MIO_7_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_7_PULLUP {disabled} \
   CONFIG.PCW_MIO_7_SLEW {slow} \
   CONFIG.PCW_MIO_8_DIRECTION {out} \
   CONFIG.PCW_MIO_8_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_8_PULLUP {disabled} \
   CONFIG.PCW_MIO_8_SLEW {fast} \
   CONFIG.PCW_MIO_9_DIRECTION {inout} \
   CONFIG.PCW_MIO_9_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_9_PULLUP {disabled} \
   CONFIG.PCW_MIO_9_SLEW {slow} \
   CONFIG.PCW_MIO_PRIMITIVE {54} \
   CONFIG.PCW_MIO_TREE_PERIPHERALS {GPIO#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#GPIO#GPIO#GPIO#I2C 0#I2C 0#GPIO#GPIO#GPIO#GPIO#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#UART 1#UART 1#GPIO#GPIO#Enet 0#Enet 0} \
   CONFIG.PCW_MIO_TREE_SIGNALS {gpio[0]#qspi0_ss_b#qspi0_io[0]#qspi0_io[1]#qspi0_io[2]#qspi0_io[3]/HOLD_B#qspi0_sclk#gpio[7]#gpio[8]#gpio[9]#scl#sda#gpio[12]#gpio[13]#gpio[14]#gpio[15]#tx_clk#txd[0]#txd[1]#txd[2]#txd[3]#tx_ctl#rx_clk#rxd[0]#rxd[1]#rxd[2]#rxd[3]#rx_ctl#data[4]#dir#stp#nxt#data[0]#data[1]#data[2]#data[3]#clk#data[5]#data[6]#data[7]#clk#cmd#data[0]#data[1]#data[2]#data[3]#wp#cd#tx#rx#gpio[50]#gpio[51]#mdc#mdio} \
   CONFIG.PCW_M_AXI_GP0_ENABLE_STATIC_REMAP {0} \
   CONFIG.PCW_M_AXI_GP0_ID_WIDTH {12} \
   CONFIG.PCW_M_AXI_GP0_SUPPORT_NARROW_BURST {0} \
   CONFIG.PCW_M_AXI_GP0_THREAD_ID_WIDTH {12} \
   CONFIG.PCW_M_AXI_GP1_ENABLE_STATIC_REMAP {0} \
   CONFIG.PCW_M_AXI_GP1_ID_WIDTH {12} \
   CONFIG.PCW_M_AXI_GP1_SUPPORT_NARROW_BURST {0} \
   CONFIG.PCW_M_AXI_GP1_THREAD_ID_WIDTH {12} \
   CONFIG.PCW_NAND_CYCLES_T_AR {1} \
   CONFIG.PCW_NAND_CYCLES_T_CLR {1} \
   CONFIG.PCW_NAND_CYCLES_T_RC {11} \
   CONFIG.PCW_NAND_CYCLES_T_REA {1} \
   CONFIG.PCW_NAND_CYCLES_T_RR {1} \
   CONFIG.PCW_NAND_CYCLES_T_WC {11} \
   CONFIG.PCW_NAND_CYCLES_T_WP {1} \
   CONFIG.PCW_NAND_GRP_D8_ENABLE {0} \
   CONFIG.PCW_NAND_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_NOR_CS0_T_CEOE {1} \
   CONFIG.PCW_NOR_CS0_T_PC {1} \
   CONFIG.PCW_NOR_CS0_T_RC {11} \
   CONFIG.PCW_NOR_CS0_T_TR {1} \
   CONFIG.PCW_NOR_CS0_T_WC {11} \
   CONFIG.PCW_NOR_CS0_T_WP {1} \
   CONFIG.PCW_NOR_CS0_WE_TIME {0} \
   CONFIG.PCW_NOR_CS1_T_CEOE {1} \
   CONFIG.PCW_NOR_CS1_T_PC {1} \
   CONFIG.PCW_NOR_CS1_T_RC {11} \
   CONFIG.PCW_NOR_CS1_T_TR {1} \
   CONFIG.PCW_NOR_CS1_T_WC {11} \
   CONFIG.PCW_NOR_CS1_T_WP {1} \
   CONFIG.PCW_NOR_CS1_WE_TIME {0} \
   CONFIG.PCW_NOR_GRP_A25_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_CS0_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_CS1_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_CS0_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_CS1_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_INT_ENABLE {0} \
   CONFIG.PCW_NOR_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_NOR_SRAM_CS0_T_CEOE {1} \
   CONFIG.PCW_NOR_SRAM_CS0_T_PC {1} \
   CONFIG.PCW_NOR_SRAM_CS0_T_RC {11} \
   CONFIG.PCW_NOR_SRAM_CS0_T_TR {1} \
   CONFIG.PCW_NOR_SRAM_CS0_T_WC {11} \
   CONFIG.PCW_NOR_SRAM_CS0_T_WP {1} \
   CONFIG.PCW_NOR_SRAM_CS0_WE_TIME {0} \
   CONFIG.PCW_NOR_SRAM_CS1_T_CEOE {1} \
   CONFIG.PCW_NOR_SRAM_CS1_T_PC {1} \
   CONFIG.PCW_NOR_SRAM_CS1_T_RC {11} \
   CONFIG.PCW_NOR_SRAM_CS1_T_TR {1} \
   CONFIG.PCW_NOR_SRAM_CS1_T_WC {11} \
   CONFIG.PCW_NOR_SRAM_CS1_T_WP {1} \
   CONFIG.PCW_NOR_SRAM_CS1_WE_TIME {0} \
   CONFIG.PCW_OVERRIDE_BASIC_CLOCK {0} \
   CONFIG.PCW_P2F_CAN0_INTR {0} \
   CONFIG.PCW_P2F_CAN1_INTR {0} \
   CONFIG.PCW_P2F_CTI_INTR {0} \
   CONFIG.PCW_P2F_DMAC0_INTR {0} \
   CONFIG.PCW_P2F_DMAC1_INTR {0} \
   CONFIG.PCW_P2F_DMAC2_INTR {0} \
   CONFIG.PCW_P2F_DMAC3_INTR {0} \
   CONFIG.PCW_P2F_DMAC4_INTR {0} \
   CONFIG.PCW_P2F_DMAC5_INTR {0} \
   CONFIG.PCW_P2F_DMAC6_INTR {0} \
   CONFIG.PCW_P2F_DMAC7_INTR {0} \
   CONFIG.PCW_P2F_DMAC_ABORT_INTR {0} \
   CONFIG.PCW_P2F_ENET0_INTR {0} \
   CONFIG.PCW_P2F_ENET1_INTR {0} \
   CONFIG.PCW_P2F_GPIO_INTR {0} \
   CONFIG.PCW_P2F_I2C0_INTR {0} \
   CONFIG.PCW_P2F_I2C1_INTR {0} \
   CONFIG.PCW_P2F_QSPI_INTR {0} \
   CONFIG.PCW_P2F_SDIO0_INTR {0} \
   CONFIG.PCW_P2F_SDIO1_INTR {0} \
   CONFIG.PCW_P2F_SMC_INTR {0} \
   CONFIG.PCW_P2F_SPI0_INTR {0} \
   CONFIG.PCW_P2F_SPI1_INTR {0} \
   CONFIG.PCW_P2F_UART0_INTR {0} \
   CONFIG.PCW_P2F_UART1_INTR {0} \
   CONFIG.PCW_P2F_USB0_INTR {0} \
   CONFIG.PCW_P2F_USB1_INTR {0} \
   CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY0 {0.063} \
   CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY1 {0.062} \
   CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY2 {0.065} \
   CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY3 {0.083} \
   CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_0 {-0.007} \
   CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_1 {-0.010} \
   CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_2 {-0.006} \
   CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_3 {-0.048} \
   CONFIG.PCW_PACKAGE_NAME {clg484} \
   CONFIG.PCW_PCAP_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_PCAP_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_PERIPHERAL_BOARD_PRESET {part0} \
   CONFIG.PCW_PJTAG_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_PLL_BYPASSMODE_ENABLE {0} \
   CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 3.3V} \
   CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
   CONFIG.PCW_PS7_SI_REV {PRODUCTION} \
   CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {0} \
   CONFIG.PCW_QSPI_GRP_IO1_ENABLE {0} \
   CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
   CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO {MIO 1 .. 6} \
   CONFIG.PCW_QSPI_GRP_SS1_ENABLE {0} \
   CONFIG.PCW_QSPI_INTERNAL_HIGHADDRESS {0xFCFFFFFF} \
   CONFIG.PCW_QSPI_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_QSPI_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6} \
   CONFIG.PCW_SD0_GRP_CD_ENABLE {1} \
   CONFIG.PCW_SD0_GRP_CD_IO {MIO 47} \
   CONFIG.PCW_SD0_GRP_POW_ENABLE {0} \
   CONFIG.PCW_SD0_GRP_WP_ENABLE {1} \
   CONFIG.PCW_SD0_GRP_WP_IO {MIO 46} \
   CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45} \
   CONFIG.PCW_SD1_GRP_CD_ENABLE {0} \
   CONFIG.PCW_SD1_GRP_POW_ENABLE {0} \
   CONFIG.PCW_SD1_GRP_WP_ENABLE {0} \
   CONFIG.PCW_SD1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_SDIO0_BASEADDR {0xE0100000} \
   CONFIG.PCW_SDIO0_HIGHADDR {0xE0100FFF} \
   CONFIG.PCW_SDIO1_BASEADDR {0xE0101000} \
   CONFIG.PCW_SDIO1_HIGHADDR {0xE0101FFF} \
   CONFIG.PCW_SDIO_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {20} \
   CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_SDIO_PERIPHERAL_VALID {1} \
   CONFIG.PCW_SINGLE_QSPI_DATA_MODE {x4} \
   CONFIG.PCW_SMC_CYCLE_T0 {NA} \
   CONFIG.PCW_SMC_CYCLE_T1 {NA} \
   CONFIG.PCW_SMC_CYCLE_T2 {NA} \
   CONFIG.PCW_SMC_CYCLE_T3 {NA} \
   CONFIG.PCW_SMC_CYCLE_T4 {NA} \
   CONFIG.PCW_SMC_CYCLE_T5 {NA} \
   CONFIG.PCW_SMC_CYCLE_T6 {NA} \
   CONFIG.PCW_SMC_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SMC_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_SMC_PERIPHERAL_VALID {0} \
   CONFIG.PCW_SPI0_BASEADDR {0xE0006000} \
   CONFIG.PCW_SPI0_GRP_SS0_ENABLE {0} \
   CONFIG.PCW_SPI0_GRP_SS1_ENABLE {0} \
   CONFIG.PCW_SPI0_GRP_SS2_ENABLE {0} \
   CONFIG.PCW_SPI0_HIGHADDR {0xE0006FFF} \
   CONFIG.PCW_SPI0_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_SPI1_BASEADDR {0xE0007000} \
   CONFIG.PCW_SPI1_GRP_SS0_ENABLE {0} \
   CONFIG.PCW_SPI1_GRP_SS1_ENABLE {0} \
   CONFIG.PCW_SPI1_GRP_SS2_ENABLE {0} \
   CONFIG.PCW_SPI1_HIGHADDR {0xE0007FFF} \
   CONFIG.PCW_SPI1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_SPI_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SPI_PERIPHERAL_FREQMHZ {166.666666} \
   CONFIG.PCW_SPI_PERIPHERAL_VALID {0} \
   CONFIG.PCW_S_AXI_ACP_ARUSER_VAL {31} \
   CONFIG.PCW_S_AXI_ACP_AWUSER_VAL {31} \
   CONFIG.PCW_S_AXI_ACP_ID_WIDTH {3} \
   CONFIG.PCW_S_AXI_GP0_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_GP1_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_HP0_DATA_WIDTH {64} \
   CONFIG.PCW_S_AXI_HP0_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_HP1_DATA_WIDTH {64} \
   CONFIG.PCW_S_AXI_HP1_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_HP2_DATA_WIDTH {64} \
   CONFIG.PCW_S_AXI_HP2_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_HP3_DATA_WIDTH {64} \
   CONFIG.PCW_S_AXI_HP3_ID_WIDTH {6} \
   CONFIG.PCW_TPIU_PERIPHERAL_CLKSRC {External} \
   CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TPIU_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_TRACE_BUFFER_CLOCK_DELAY {12} \
   CONFIG.PCW_TRACE_BUFFER_FIFO_SIZE {128} \
   CONFIG.PCW_TRACE_GRP_16BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_GRP_2BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_GRP_32BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_GRP_4BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_GRP_8BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_INTERNAL_WIDTH {2} \
   CONFIG.PCW_TRACE_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_TRACE_PIPELINE_WIDTH {8} \
   CONFIG.PCW_TTC0_BASEADDR {0xE0104000} \
   CONFIG.PCW_TTC0_CLK0_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC0_CLK0_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC0_CLK0_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC0_CLK1_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC0_CLK1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC0_CLK1_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC0_CLK2_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC0_CLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC0_CLK2_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC0_HIGHADDR {0xE0104fff} \
   CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_TTC0_TTC0_IO {EMIO} \
   CONFIG.PCW_TTC1_BASEADDR {0xE0105000} \
   CONFIG.PCW_TTC1_CLK0_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC1_CLK0_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC1_CLK0_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC1_CLK1_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC1_CLK1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC1_CLK1_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC1_CLK2_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC1_CLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC1_CLK2_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC1_HIGHADDR {0xE0105fff} \
   CONFIG.PCW_TTC1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_TTC_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_UART0_BASEADDR {0xE0000000} \
   CONFIG.PCW_UART0_BAUD_RATE {115200} \
   CONFIG.PCW_UART0_GRP_FULL_ENABLE {0} \
   CONFIG.PCW_UART0_HIGHADDR {0xE0000FFF} \
   CONFIG.PCW_UART0_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_UART1_BASEADDR {0xE0001000} \
   CONFIG.PCW_UART1_BAUD_RATE {115200} \
   CONFIG.PCW_UART1_GRP_FULL_ENABLE {0} \
   CONFIG.PCW_UART1_HIGHADDR {0xE0001FFF} \
   CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_UART1_UART1_IO {MIO 48 .. 49} \
   CONFIG.PCW_UART_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {20} \
   CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_UART_PERIPHERAL_VALID {1} \
   CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {533.333374} \
   CONFIG.PCW_UIPARAM_DDR_ADV_ENABLE {1} \
   CONFIG.PCW_UIPARAM_DDR_AL {0} \
   CONFIG.PCW_UIPARAM_DDR_BANK_ADDR_COUNT {3} \
   CONFIG.PCW_UIPARAM_DDR_BL {8} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.41} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.411} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.341} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.358} \
   CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {32 Bit} \
   CONFIG.PCW_UIPARAM_DDR_CL {7} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_0_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PACKAGE_LENGTH {61.0905} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_1_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PACKAGE_LENGTH {61.0905} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_2_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PACKAGE_LENGTH {61.0905} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_3_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PACKAGE_LENGTH {61.0905} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_STOP_EN {0} \
   CONFIG.PCW_UIPARAM_DDR_COL_ADDR_COUNT {10} \
   CONFIG.PCW_UIPARAM_DDR_CWL {6} \
   CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {2048 MBits} \
   CONFIG.PCW_UIPARAM_DDR_DQS_0_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_DQS_0_PACKAGE_LENGTH {68.4725} \
   CONFIG.PCW_UIPARAM_DDR_DQS_0_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQS_1_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_DQS_1_PACKAGE_LENGTH {71.086} \
   CONFIG.PCW_UIPARAM_DDR_DQS_1_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQS_2_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_DQS_2_PACKAGE_LENGTH {66.794} \
   CONFIG.PCW_UIPARAM_DDR_DQS_2_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQS_3_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_DQS_3_PACKAGE_LENGTH {108.7385} \
   CONFIG.PCW_UIPARAM_DDR_DQS_3_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {0.025} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {0.028} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {-0.009} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {-0.061} \
   CONFIG.PCW_UIPARAM_DDR_DQ_0_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_DQ_0_PACKAGE_LENGTH {64.1705} \
   CONFIG.PCW_UIPARAM_DDR_DQ_0_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQ_1_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_DQ_1_PACKAGE_LENGTH {63.686} \
   CONFIG.PCW_UIPARAM_DDR_DQ_1_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQ_2_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_DQ_2_PACKAGE_LENGTH {68.46} \
   CONFIG.PCW_UIPARAM_DDR_DQ_2_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQ_3_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_DQ_3_PACKAGE_LENGTH {105.4895} \
   CONFIG.PCW_UIPARAM_DDR_DQ_3_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
   CONFIG.PCW_UIPARAM_DDR_ECC {Disabled} \
   CONFIG.PCW_UIPARAM_DDR_ENABLE {1} \
   CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {533.333313} \
   CONFIG.PCW_UIPARAM_DDR_HIGH_TEMP {Normal (0-85)} \
   CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {DDR 3} \
   CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41J128M16 HA-15E} \
   CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {14} \
   CONFIG.PCW_UIPARAM_DDR_SPEED_BIN {DDR3_1066F} \
   CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE {1} \
   CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE {1} \
   CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL {1} \
   CONFIG.PCW_UIPARAM_DDR_T_FAW {45.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {36.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RC {49.5} \
   CONFIG.PCW_UIPARAM_DDR_T_RCD {7} \
   CONFIG.PCW_UIPARAM_DDR_T_RP {7} \
   CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF {1} \
   CONFIG.PCW_UIPARAM_GENERATE_SUMMARY {NA} \
   CONFIG.PCW_USB0_BASEADDR {0xE0102000} \
   CONFIG.PCW_USB0_HIGHADDR {0xE0102fff} \
   CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_USB0_PERIPHERAL_FREQMHZ {60} \
   CONFIG.PCW_USB0_RESET_ENABLE {0} \
   CONFIG.PCW_USB0_USB0_IO {MIO 28 .. 39} \
   CONFIG.PCW_USB1_BASEADDR {0xE0103000} \
   CONFIG.PCW_USB1_HIGHADDR {0xE0103fff} \
   CONFIG.PCW_USB1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_USB1_PERIPHERAL_FREQMHZ {60} \
   CONFIG.PCW_USB1_RESET_ENABLE {0} \
   CONFIG.PCW_USB_RESET_ENABLE {1} \
   CONFIG.PCW_USB_RESET_POLARITY {Active Low} \
   CONFIG.PCW_USB_RESET_SELECT {Share reset pin} \
   CONFIG.PCW_USE_AXI_FABRIC_IDLE {0} \
   CONFIG.PCW_USE_AXI_NONSECURE {0} \
   CONFIG.PCW_USE_CORESIGHT {0} \
   CONFIG.PCW_USE_CROSS_TRIGGER {0} \
   CONFIG.PCW_USE_CR_FABRIC {1} \
   CONFIG.PCW_USE_DDR_BYPASS {0} \
   CONFIG.PCW_USE_DEBUG {0} \
   CONFIG.PCW_USE_DEFAULT_ACP_USER_VAL {0} \
   CONFIG.PCW_USE_DMA0 {0} \
   CONFIG.PCW_USE_DMA1 {0} \
   CONFIG.PCW_USE_DMA2 {0} \
   CONFIG.PCW_USE_DMA3 {0} \
   CONFIG.PCW_USE_EXPANDED_IOP {0} \
   CONFIG.PCW_USE_EXPANDED_PS_SLCR_REGISTERS {0} \
   CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
   CONFIG.PCW_USE_HIGH_OCM {0} \
   CONFIG.PCW_USE_M_AXI_GP0 {1} \
   CONFIG.PCW_USE_M_AXI_GP1 {1} \
   CONFIG.PCW_USE_PROC_EVENT_BUS {0} \
   CONFIG.PCW_USE_PS_SLCR_REGISTERS {0} \
   CONFIG.PCW_USE_S_AXI_ACP {0} \
   CONFIG.PCW_USE_S_AXI_GP0 {0} \
   CONFIG.PCW_USE_S_AXI_GP1 {0} \
   CONFIG.PCW_USE_S_AXI_HP0 {1} \
   CONFIG.PCW_USE_S_AXI_HP1 {0} \
   CONFIG.PCW_USE_S_AXI_HP2 {1} \
   CONFIG.PCW_USE_S_AXI_HP3 {1} \
   CONFIG.PCW_USE_TRACE {0} \
   CONFIG.PCW_USE_TRACE_DATA_EDGE_DETECTOR {0} \
   CONFIG.PCW_VALUE_SILVERSION {3} \
   CONFIG.PCW_WDT_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_WDT_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_WDT_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_WDT_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.preset {ZedBoard} \
 ] $processing_system7_0

  # Create instance: processing_system7_0_axi_periph, and set properties
  set processing_system7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 processing_system7_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {8} \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $processing_system7_0_axi_periph

  # Create instance: reset_100M, and set properties
  set reset_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 reset_100M ]

  # Create instance: reset_24M, and set properties
  set reset_24M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 reset_24M ]

  # Create instance: reset_25M, and set properties
  set reset_25M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 reset_25M ]

  # Create instance: xlconcat, and set properties
  set xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {3} \
 ] $xlconcat

  # Create interface connections
  connect_bd_intf_net -intf_net AXIS_IN_1 [get_bd_intf_pins VDMA/AXIS_IN] [get_bd_intf_pins background_eraser/stream_out_V_V]
  connect_bd_intf_net -intf_net OV7670_GRAYSCALE_TO_AXIS_AXIM_READER_SD [get_bd_intf_pins OV7670_GRAYSCALE_TO_AXIS/AXIM_READER_SD] [get_bd_intf_pins processing_system7_0/S_AXI_HP3]
  connect_bd_intf_net -intf_net OV7670_GRAYSCALE_TO_AXIS_outStream_V_V [get_bd_intf_pins Convolution_Filter/in_img_V] [get_bd_intf_pins OV7670_GRAYSCALE_TO_AXIS/outStream_V_V]
  connect_bd_intf_net -intf_net OV7670_GRAYSCALE_TO_AXIS_outStream_raw_CHROMA [get_bd_intf_pins OV7670_GRAYSCALE_TO_AXIS/outStream_raw_CHROMA] [get_bd_intf_pins VDMA/AXIS_IN_RAW_CHROMA]
  connect_bd_intf_net -intf_net OV7670_GRAYSCALE_TO_AXIS_outStream_raw_LUMA [get_bd_intf_pins OV7670_GRAYSCALE_TO_AXIS/outStream_raw_LUMA] [get_bd_intf_pins VDMA/AXIS_IN_RAW_LUMA]
  connect_bd_intf_net -intf_net VDMA_AXIS_OUT [get_bd_intf_pins VDMA/AXIS_OUT] [get_bd_intf_pins axi_stream_to_vga_0/inStream_V_V]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins VDMA/AXIM_WRITER] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net axi_mem_intercon_reader_M00_AXI [get_bd_intf_pins VDMA/AXIM_READER] [get_bd_intf_pins processing_system7_0/S_AXI_HP2]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins processing_system7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP1 [get_bd_intf_pins OV7670_GRAYSCALE_TO_AXIS/S00_AXI] [get_bd_intf_pins processing_system7_0/M_AXI_GP1]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins axi_gpio_frame_intr/S_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M01_AXI [get_bd_intf_pins axi_gpio_pl_reset/S_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M02_AXI [get_bd_intf_pins VDMA/s_axi_AXILiteS] [get_bd_intf_pins processing_system7_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M03_AXI [get_bd_intf_pins VDMA/s_axi_AXILiteS1] [get_bd_intf_pins processing_system7_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M04_AXI [get_bd_intf_pins VDMA/s_axi_AXILite_raw_LUMA] [get_bd_intf_pins processing_system7_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M05_AXI [get_bd_intf_pins VDMA/s_axi_AXILite_raw_CHROMA] [get_bd_intf_pins processing_system7_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M06_AXI [get_bd_intf_pins Convolution_Filter/S00_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M06_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M07_AXI [get_bd_intf_pins VDMA/s_axi_AXILiteS2] [get_bd_intf_pins processing_system7_0_axi_periph/M07_AXI]

  # Create port connections
  connect_bd_net -net CLOCK_100M_1 [get_bd_pins VDMA/clk_vdma] [get_bd_pins axi_gpio_frame_intr/s_axi_aclk] [get_bd_pins axi_gpio_pl_reset/s_axi_aclk] [get_bd_pins clk_gen_25M_24M/clk_in1] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP2_ACLK] [get_bd_pins processing_system7_0_axi_periph/ACLK] [get_bd_pins processing_system7_0_axi_periph/M00_ACLK] [get_bd_pins processing_system7_0_axi_periph/M01_ACLK] [get_bd_pins processing_system7_0_axi_periph/M02_ACLK] [get_bd_pins processing_system7_0_axi_periph/M03_ACLK] [get_bd_pins processing_system7_0_axi_periph/M04_ACLK] [get_bd_pins processing_system7_0_axi_periph/M05_ACLK] [get_bd_pins processing_system7_0_axi_periph/M07_ACLK] [get_bd_pins processing_system7_0_axi_periph/S00_ACLK] [get_bd_pins reset_100M/slowest_sync_clk]
  connect_bd_net -net Convolution_Filter_out_img_V_TDATA1 [get_bd_pins Convolution_Filter/out_img_V_TDATA1] [get_bd_pins background_eraser/tdata_camera]
  connect_bd_net -net Convolution_Filter_out_img_V_TVALID1 [get_bd_pins Convolution_Filter/out_img_V_TVALID1] [get_bd_pins background_eraser/tvalid_camera]
  connect_bd_net -net ENABLE_RAW_STREAM_dout [get_bd_pins ENABLE_RAW_STREAM/dout] [get_bd_pins OV7670_GRAYSCALE_TO_AXIS/enable_raw_stream]
  connect_bd_net -net OV7670_GRAYSCALE_TO_AXIS_Q [get_bd_ports LED_FRAME_VALID] [get_bd_pins OV7670_GRAYSCALE_TO_AXIS/LED_FRAME_VALID]
  connect_bd_net -net PCLK_1 [get_bd_ports PCLK] [get_bd_pins Convolution_Filter/ap_clk] [get_bd_pins OV7670_GRAYSCALE_TO_AXIS/ap_clk] [get_bd_pins VDMA/clk_in] [get_bd_pins background_eraser/PCLK] [get_bd_pins processing_system7_0/M_AXI_GP1_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP3_ACLK] [get_bd_pins processing_system7_0_axi_periph/M06_ACLK] [get_bd_pins reset_24M/slowest_sync_clk]
  connect_bd_net -net ap_start_1 [get_bd_pins Convolution_Filter/ap_start] [get_bd_pins OV7670_GRAYSCALE_TO_AXIS/ap_start] [get_bd_pins VDMA/ap_start] [get_bd_pins axi_stream_to_vga_0/ap_start] [get_bd_pins const_true/dout]
  connect_bd_net -net axi_gpio_frame_intr_ip2intc_irpt [get_bd_pins axi_gpio_frame_intr/ip2intc_irpt] [get_bd_pins xlconcat/In0]
  connect_bd_net -net axi_stream_to_vga_0_B_V [get_bd_ports B_V] [get_bd_pins axi_stream_to_vga_0/B_V]
  set_property HDL_ATTRIBUTE.DEBUG_IN_BD {true} [get_bd_nets axi_stream_to_vga_0_B_V]
  set_property HDL_ATTRIBUTE.MARK_DEBUG {true} [get_bd_nets axi_stream_to_vga_0_B_V]
  connect_bd_net -net axi_stream_to_vga_0_G_V [get_bd_ports G_V] [get_bd_pins axi_stream_to_vga_0/G_V]
  set_property HDL_ATTRIBUTE.DEBUG_IN_BD {true} [get_bd_nets axi_stream_to_vga_0_G_V]
  set_property HDL_ATTRIBUTE.MARK_DEBUG {true} [get_bd_nets axi_stream_to_vga_0_G_V]
  connect_bd_net -net axi_stream_to_vga_0_H_SYNC_V [get_bd_ports H_SYNC_V] [get_bd_pins axi_stream_to_vga_0/H_SYNC_V]
  set_property HDL_ATTRIBUTE.DEBUG_IN_BD {true} [get_bd_nets axi_stream_to_vga_0_H_SYNC_V]
  set_property HDL_ATTRIBUTE.MARK_DEBUG {true} [get_bd_nets axi_stream_to_vga_0_H_SYNC_V]
  connect_bd_net -net axi_stream_to_vga_0_R_V [get_bd_ports R_V] [get_bd_pins axi_stream_to_vga_0/R_V]
  set_property HDL_ATTRIBUTE.DEBUG_IN_BD {true} [get_bd_nets axi_stream_to_vga_0_R_V]
  set_property HDL_ATTRIBUTE.MARK_DEBUG {true} [get_bd_nets axi_stream_to_vga_0_R_V]
  connect_bd_net -net axi_stream_to_vga_0_V_SYNC_V [get_bd_ports V_SYNC_V] [get_bd_pins axi_stream_to_vga_0/V_SYNC_V]
  set_property HDL_ATTRIBUTE.DEBUG_IN_BD {true} [get_bd_nets axi_stream_to_vga_0_V_SYNC_V]
  set_property HDL_ATTRIBUTE.MARK_DEBUG {true} [get_bd_nets axi_stream_to_vga_0_V_SYNC_V]
  connect_bd_net -net axis_to_ddr_writer_0_frame_index_V [get_bd_pins VDMA/frame_index_V] [get_bd_pins axi_gpio_frame_intr/gpio_io_i]
  set_property HDL_ATTRIBUTE.DEBUG_IN_BD {true} [get_bd_nets axis_to_ddr_writer_0_frame_index_V]
  set_property HDL_ATTRIBUTE.MARK_DEBUG {true} [get_bd_nets axis_to_ddr_writer_0_frame_index_V]
  connect_bd_net -net background_eraser_tready_ref [get_bd_pins VDMA/tready_ref] [get_bd_pins background_eraser/tready_ref]
  connect_bd_net -net capture_ref_1 [get_bd_ports capture_ref] [get_bd_pins xlconcat/In2]
  connect_bd_net -net clk_gen_25M_23M_clk_out2 [get_bd_ports XCLK] [get_bd_pins clk_gen_25M_24M/clk_out2]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins VDMA/clk_out] [get_bd_pins axi_stream_to_vga_0/ap_clk] [get_bd_pins clk_gen_25M_24M/clk_out1] [get_bd_pins reset_25M/slowest_sync_clk]
  connect_bd_net -net data_in_V_1 [get_bd_ports data_in_V] [get_bd_pins OV7670_GRAYSCALE_TO_AXIS/data_in]
  set_property HDL_ATTRIBUTE.DEBUG_IN_BD {true} [get_bd_nets data_in_V_1]
  set_property HDL_ATTRIBUTE.MARK_DEBUG {true} [get_bd_nets data_in_V_1]
  connect_bd_net -net enable_0_1 [get_bd_ports enable_compare] [get_bd_pins background_eraser/enable]
  connect_bd_net -net ext_reset_in_1 [get_bd_ports OV7670_RESET] [get_bd_pins axi_gpio_pl_reset/gpio_io_o] [get_bd_pins reset_100M/ext_reset_in] [get_bd_pins reset_24M/ext_reset_in] [get_bd_pins reset_25M/ext_reset_in]
  set_property HDL_ATTRIBUTE.DEBUG_IN_BD {true} [get_bd_nets ext_reset_in_1]
  set_property HDL_ATTRIBUTE.MARK_DEBUG {true} [get_bd_nets ext_reset_in_1]
  connect_bd_net -net href_V_1 [get_bd_ports href_V] [get_bd_pins OV7670_GRAYSCALE_TO_AXIS/href]
  set_property HDL_ATTRIBUTE.DEBUG_IN_BD {true} [get_bd_nets href_V_1]
  set_property HDL_ATTRIBUTE.MARK_DEBUG {true} [get_bd_nets href_V_1]
  connect_bd_net -net out_img_V_TREADY1_1 [get_bd_pins Convolution_Filter/out_img_V_TREADY1] [get_bd_pins background_eraser/tready_camera]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins Convolution_Filter/ap_rst_n] [get_bd_pins OV7670_GRAYSCALE_TO_AXIS/ap_rst_n] [get_bd_pins VDMA/aresetn_in] [get_bd_pins background_eraser/resetn] [get_bd_pins reset_24M/peripheral_aresetn]
  connect_bd_net -net reset_24M_peripheral_reset [get_bd_pins OV7670_GRAYSCALE_TO_AXIS/ap_rst] [get_bd_pins reset_24M/peripheral_reset]
  connect_bd_net -net reset_25M_peripheral_aresetn [get_bd_pins VDMA/aresetn_out] [get_bd_pins axi_stream_to_vga_0/ap_rst_n] [get_bd_pins reset_25M/peripheral_aresetn]
  connect_bd_net -net reset_sw_1 [get_bd_ports reset_sw] [get_bd_pins xlconcat/In1]
  connect_bd_net -net rst_processing_system7_0_100M_interconnect_aresetn [get_bd_pins VDMA/interconnect_aresetn] [get_bd_pins reset_100M/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_100M_peripheral_aresetn [get_bd_pins VDMA/aresetn_vdma] [get_bd_pins axi_gpio_frame_intr/s_axi_aresetn] [get_bd_pins reset_100M/peripheral_aresetn]
  connect_bd_net -net selftest_1 [get_bd_ports selftest] [get_bd_pins axi_stream_to_vga_0/selftest]
  set_property HDL_ATTRIBUTE.DEBUG_IN_BD {true} [get_bd_nets selftest_1]
  set_property HDL_ATTRIBUTE.MARK_DEBUG {true} [get_bd_nets selftest_1]
  connect_bd_net -net tdata_ref_1 [get_bd_pins VDMA/tdata_ref] [get_bd_pins background_eraser/tdata_ref]
  connect_bd_net -net tvalid_ref_1 [get_bd_pins VDMA/tvalid_ref] [get_bd_pins background_eraser/tvalid_ref]
  connect_bd_net -net vsync_V_1 [get_bd_ports vsync_V] [get_bd_pins OV7670_GRAYSCALE_TO_AXIS/vsync]
  set_property HDL_ATTRIBUTE.DEBUG_IN_BD {true} [get_bd_nets vsync_V_1]
  set_property HDL_ATTRIBUTE.MARK_DEBUG {true} [get_bd_nets vsync_V_1]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins processing_system7_0/IRQ_F2P] [get_bd_pins xlconcat/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins axi_gpio_pl_reset/s_axi_aresetn] [get_bd_pins const_1/dout] [get_bd_pins processing_system7_0_axi_periph/ARESETN] [get_bd_pins processing_system7_0_axi_periph/M00_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M01_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M02_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M03_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M04_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M05_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M06_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M07_ARESETN] [get_bd_pins processing_system7_0_axi_periph/S00_ARESETN]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x41200000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_gpio_frame_intr/S_AXI/Reg] SEG_axi_gpio_frame_intr_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41210000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_gpio_pl_reset/S_AXI/Reg] SEG_axi_gpio_pl_reset_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs VDMA/axis_to_ddr_writer_0/s_axi_AXILiteS/Reg] SEG_axis_to_ddr_writer_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C20000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs VDMA/axis_to_ddr_writer_CHROMA/s_axi_AXILiteS/Reg] SEG_axis_to_ddr_writer_1_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C30000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs VDMA/axis_to_ddr_writer_LUMA/s_axi_AXILiteS/Reg] SEG_axis_to_ddr_writer_2_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C40000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs Convolution_Filter/convolution_filter_0/s_axi_AXILiteS/Reg] SEG_convolution_filter_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C10000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs VDMA/ddr_to_axis_reader_0/s_axi_AXILiteS/Reg] SEG_ddr_to_axis_reader_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x83C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs OV7670_GRAYSCALE_TO_AXIS/ddr_to_axis_reader_SD_0/s_axi_AXILiteS/Reg] SEG_ddr_to_axis_reader_SD_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C60000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs VDMA/ddr_to_axis_reader_ref/s_axi_AXILiteS/Reg] SEG_ddr_to_axis_reader_ref_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x83C10000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs OV7670_GRAYSCALE_TO_AXIS/mux_sd_ov_1/s_axi_AXILiteS/Reg] SEG_mux_sd_ov_1_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C50000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs Convolution_Filter/sep_convolution_filter_0/s_axi_AXILiteS/Reg] SEG_sep_convolution_filter_0_Reg
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces OV7670_GRAYSCALE_TO_AXIS/ddr_to_axis_reader_SD_0/Data_m_axi_base_ddr_addr] [get_bd_addr_segs processing_system7_0/S_AXI_HP3/HP3_DDR_LOWOCM] SEG_processing_system7_0_HP3_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces VDMA/axis_to_ddr_writer_0/Data_m_axi_base_ddr_addr] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces VDMA/axis_to_ddr_writer_CHROMA/Data_m_axi_base_ddr_addr] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces VDMA/axis_to_ddr_writer_LUMA/Data_m_axi_base_ddr_addr] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces VDMA/ddr_to_axis_reader_0/Data_m_axi_base_ddr_addr] [get_bd_addr_segs processing_system7_0/S_AXI_HP2/HP2_DDR_LOWOCM] SEG_processing_system7_0_HP2_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces VDMA/ddr_to_axis_reader_ref/Data_m_axi_base_ddr_addr] [get_bd_addr_segs processing_system7_0/S_AXI_HP2/HP2_DDR_LOWOCM] SEG_processing_system7_0_HP2_DDR_LOWOCM


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


