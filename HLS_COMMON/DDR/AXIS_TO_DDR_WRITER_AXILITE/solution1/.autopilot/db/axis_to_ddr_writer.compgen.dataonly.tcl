# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_AXILiteS {
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
base_address { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
frame_buffer_dim { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
frame_buffer_offset { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
frame_buffer_number { 
	dir I
	width 8
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
update_intr { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
}
dict set axilite_register_dict AXILiteS $port_AXILiteS


