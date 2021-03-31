// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================

#define AP_INT_MAX_W 32678

#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;


// [dump_struct_tree [build_nameSpaceTree] dumpedStructList] ---------->


// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "stream_in_V"
#define AUTOTB_TVIN_stream_in_V  "../tv/cdatafile/c.Background_subtractor.autotvin_stream_in_V.dat"
// wrapc file define: "enable_V"
#define AUTOTB_TVIN_enable_V  "../tv/cdatafile/c.Background_subtractor.autotvin_enable_V.dat"
// wrapc file define: "frame_done_V"
#define AUTOTB_TVOUT_frame_done_V  "../tv/cdatafile/c.Background_subtractor.autotvout_frame_done_V.dat"
// wrapc file define: "stream_out_V"
#define AUTOTB_TVOUT_stream_out_V  "../tv/cdatafile/c.Background_subtractor.autotvout_stream_out_V.dat"
#define AUTOTB_TVIN_stream_out_V  "../tv/cdatafile/c.Background_subtractor.autotvin_stream_out_V.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "frame_done_V"
#define AUTOTB_TVOUT_PC_frame_done_V  "../tv/rtldatafile/rtl.Background_subtractor.autotvout_frame_done_V.dat"
// tvout file define: "stream_out_V"
#define AUTOTB_TVOUT_PC_stream_out_V  "../tv/rtldatafile/rtl.Background_subtractor.autotvout_stream_out_V.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			stream_in_V_depth = 0;
			enable_V_depth = 0;
			frame_done_V_depth = 0;
			stream_out_V_depth = 0;
			trans_num =0;
		}

		~INTER_TCL_FILE() {
			mFile.open(mName);
			if (!mFile.good()) {
				cout << "Failed to open file ref.tcl" << endl;
				exit (1);
			}
			string total_list = get_depth_list();
			mFile << "set depth_list {\n";
			mFile << total_list;
			mFile << "}\n";
			mFile << "set trans_num "<<trans_num<<endl;
			mFile.close();
		}

		string get_depth_list () {
			stringstream total_list;
			total_list << "{stream_in_V " << stream_in_V_depth << "}\n";
			total_list << "{enable_V " << enable_V_depth << "}\n";
			total_list << "{frame_done_V " << frame_done_V_depth << "}\n";
			total_list << "{stream_out_V " << stream_out_V_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int stream_in_V_depth;
		int enable_V_depth;
		int frame_done_V_depth;
		int stream_out_V_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern void Background_subtractor (
ap_uint<16>* stream_in,
ap_uint<1> enable,
volatile ap_uint<1>* frame_done,
volatile ap_uint<8>* stream_out);

void AESL_WRAP_Background_subtractor (
ap_uint<16>* stream_in,
ap_uint<1> enable,
volatile ap_uint<1>* frame_done,
volatile ap_uint<8>* stream_out)
{
	refine_signal_handler();
	fstream wrapc_switch_file_token;
	wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
	int AESL_i;
	if (wrapc_switch_file_token.good())
	{
		CodeState = ENTER_WRAPC_PC;
		static unsigned AESL_transaction_pc = 0;
		string AESL_token;
		string AESL_num;
		static AESL_FILE_HANDLER aesl_fh;


		// output port post check: "frame_done_V"
		aesl_fh.read(AUTOTB_TVOUT_PC_frame_done_V, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_frame_done_V, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_frame_done_V, AESL_token); // data

			sc_bv<1> *frame_done_V_pc_buffer = new sc_bv<1>[1];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'frame_done_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'frame_done_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					frame_done_V_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_frame_done_V, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_frame_done_V))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: frame_done_V
				{
					// bitslice(0, 0)
					// {
						// celement: frame_done.V(0, 0)
						// {
							sc_lv<1>* frame_done_V_lv0_0_0_1 = new sc_lv<1>[1];
						// }
					// }

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: frame_done.V(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(frame_done[0]) != NULL) // check the null address if the c port is array or others
								{
									frame_done_V_lv0_0_0_1[hls_map_index].range(0, 0) = sc_bv<1>(frame_done_V_pc_buffer[hls_map_index].range(0, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: frame_done.V(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : frame_done[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : frame_done[0]
								// output_left_conversion : frame_done[i_0]
								// output_type_conversion : (frame_done_V_lv0_0_0_1[hls_map_index]).to_string(SC_BIN).c_str()
								if (&(frame_done[0]) != NULL) // check the null address if the c port is array or others
								{
									frame_done[i_0] = (frame_done_V_lv0_0_0_1[hls_map_index]).to_string(SC_BIN).c_str();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] frame_done_V_pc_buffer;
		}

		// output port post check: "stream_out_V"
		aesl_fh.read(AUTOTB_TVOUT_PC_stream_out_V, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_stream_out_V, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_stream_out_V, AESL_token); // data

			sc_bv<8> *stream_out_V_pc_buffer = new sc_bv<8>[4];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'stream_out_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'stream_out_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					stream_out_V_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_stream_out_V, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_stream_out_V))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: stream_out_V
				{
					// bitslice(7, 0)
					// {
						// celement: stream_out.V(7, 0)
						// {
							sc_lv<8>* stream_out_V_lv0_0_3_1 = new sc_lv<8>[4];
						// }
					// }

					// bitslice(7, 0)
					{
						int hls_map_index = 0;
						// celement: stream_out.V(7, 0)
						{
							// carray: (0) => (3) @ (1)
							for (int i_0 = 0; i_0 <= 3; i_0 += 1)
							{
								if (&(stream_out[0]) != NULL) // check the null address if the c port is array or others
								{
									stream_out_V_lv0_0_3_1[hls_map_index].range(7, 0) = sc_bv<8>(stream_out_V_pc_buffer[hls_map_index].range(7, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(7, 0)
					{
						int hls_map_index = 0;
						// celement: stream_out.V(7, 0)
						{
							// carray: (0) => (3) @ (1)
							for (int i_0 = 0; i_0 <= 3; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : stream_out[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : stream_out[0]
								// output_left_conversion : stream_out[i_0]
								// output_type_conversion : (stream_out_V_lv0_0_3_1[hls_map_index]).to_string(SC_BIN).c_str()
								if (&(stream_out[0]) != NULL) // check the null address if the c port is array or others
								{
									stream_out[i_0] = (stream_out_V_lv0_0_3_1[hls_map_index]).to_string(SC_BIN).c_str();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] stream_out_V_pc_buffer;
		}

		AESL_transaction_pc++;
	}
	else
	{
		CodeState = ENTER_WRAPC;
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "stream_in_V"
		char* tvin_stream_in_V = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_stream_in_V);

		// "enable_V"
		char* tvin_enable_V = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_enable_V);

		// "frame_done_V"
		char* tvout_frame_done_V = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_frame_done_V);

		// "stream_out_V"
		char* tvin_stream_out_V = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_stream_out_V);
		char* tvout_stream_out_V = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_stream_out_V);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// [[transaction]]
		sprintf(tvin_stream_in_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_stream_in_V, tvin_stream_in_V);

		sc_bv<16>* stream_in_V_tvin_wrapc_buffer = new sc_bv<16>[4];

		// RTL Name: stream_in_V
		{
			// bitslice(15, 0)
			{
				int hls_map_index = 0;
				// celement: stream_in.V(15, 0)
				{
					// carray: (0) => (3) @ (1)
					for (int i_0 = 0; i_0 <= 3; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : stream_in[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : stream_in[0]
						// regulate_c_name       : stream_in_V
						// input_type_conversion : (stream_in[i_0]).to_string(2).c_str()
						if (&(stream_in[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<16> stream_in_V_tmp_mem;
							stream_in_V_tmp_mem = (stream_in[i_0]).to_string(2).c_str();
							stream_in_V_tvin_wrapc_buffer[hls_map_index].range(15, 0) = stream_in_V_tmp_mem.range(15, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 4; i++)
		{
			sprintf(tvin_stream_in_V, "%s\n", (stream_in_V_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_stream_in_V, tvin_stream_in_V);
		}

		tcl_file.set_num(4, &tcl_file.stream_in_V_depth);
		sprintf(tvin_stream_in_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_stream_in_V, tvin_stream_in_V);

		// release memory allocation
		delete [] stream_in_V_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_enable_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_enable_V, tvin_enable_V);

		sc_bv<1> enable_V_tvin_wrapc_buffer;

		// RTL Name: enable_V
		{
			// bitslice(0, 0)
			{
				// celement: enable.V(0, 0)
				{
					// carray: (0) => (0) @ (0)
					{
						// sub                   : 
						// ori_name              : enable
						// sub_1st_elem          : 
						// ori_name_1st_elem     : enable
						// regulate_c_name       : enable_V
						// input_type_conversion : (enable).to_string(2).c_str()
						if (&(enable) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> enable_V_tmp_mem;
							enable_V_tmp_mem = (enable).to_string(2).c_str();
							enable_V_tvin_wrapc_buffer.range(0, 0) = enable_V_tmp_mem.range(0, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_enable_V, "%s\n", (enable_V_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_enable_V, tvin_enable_V);
		}

		tcl_file.set_num(1, &tcl_file.enable_V_depth);
		sprintf(tvin_enable_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_enable_V, tvin_enable_V);

		// [[transaction]]
		sprintf(tvin_stream_out_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_stream_out_V, tvin_stream_out_V);

		sc_bv<8>* stream_out_V_tvin_wrapc_buffer = new sc_bv<8>[4];

		// RTL Name: stream_out_V
		{
			// bitslice(7, 0)
			{
				int hls_map_index = 0;
				// celement: stream_out.V(7, 0)
				{
					// carray: (0) => (3) @ (1)
					for (int i_0 = 0; i_0 <= 3; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : stream_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : stream_out[0]
						// regulate_c_name       : stream_out_V
						// input_type_conversion : (stream_out[i_0]).to_string(2).c_str()
						if (&(stream_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> stream_out_V_tmp_mem;
							stream_out_V_tmp_mem = (stream_out[i_0]).to_string(2).c_str();
							stream_out_V_tvin_wrapc_buffer[hls_map_index].range(7, 0) = stream_out_V_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 4; i++)
		{
			sprintf(tvin_stream_out_V, "%s\n", (stream_out_V_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_stream_out_V, tvin_stream_out_V);
		}

		tcl_file.set_num(4, &tcl_file.stream_out_V_depth);
		sprintf(tvin_stream_out_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_stream_out_V, tvin_stream_out_V);

		// release memory allocation
		delete [] stream_out_V_tvin_wrapc_buffer;

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		Background_subtractor(stream_in, enable, frame_done, stream_out);

		CodeState = DUMP_OUTPUTS;

		// [[transaction]]
		sprintf(tvout_frame_done_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_frame_done_V, tvout_frame_done_V);

		sc_bv<1>* frame_done_V_tvout_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: frame_done_V
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: frame_done.V(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : frame_done[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : frame_done[0]
						// regulate_c_name       : frame_done_V
						// input_type_conversion : (frame_done[i_0]).to_string(2).c_str()
						if (&(frame_done[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> frame_done_V_tmp_mem;
							frame_done_V_tmp_mem = (frame_done[i_0]).to_string(2).c_str();
							frame_done_V_tvout_wrapc_buffer[hls_map_index].range(0, 0) = frame_done_V_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_frame_done_V, "%s\n", (frame_done_V_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_frame_done_V, tvout_frame_done_V);
		}

		tcl_file.set_num(1, &tcl_file.frame_done_V_depth);
		sprintf(tvout_frame_done_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_frame_done_V, tvout_frame_done_V);

		// release memory allocation
		delete [] frame_done_V_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_stream_out_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_stream_out_V, tvout_stream_out_V);

		sc_bv<8>* stream_out_V_tvout_wrapc_buffer = new sc_bv<8>[4];

		// RTL Name: stream_out_V
		{
			// bitslice(7, 0)
			{
				int hls_map_index = 0;
				// celement: stream_out.V(7, 0)
				{
					// carray: (0) => (3) @ (1)
					for (int i_0 = 0; i_0 <= 3; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : stream_out[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : stream_out[0]
						// regulate_c_name       : stream_out_V
						// input_type_conversion : (stream_out[i_0]).to_string(2).c_str()
						if (&(stream_out[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> stream_out_V_tmp_mem;
							stream_out_V_tmp_mem = (stream_out[i_0]).to_string(2).c_str();
							stream_out_V_tvout_wrapc_buffer[hls_map_index].range(7, 0) = stream_out_V_tmp_mem.range(7, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 4; i++)
		{
			sprintf(tvout_stream_out_V, "%s\n", (stream_out_V_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_stream_out_V, tvout_stream_out_V);
		}

		tcl_file.set_num(4, &tcl_file.stream_out_V_depth);
		sprintf(tvout_stream_out_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_stream_out_V, tvout_stream_out_V);

		// release memory allocation
		delete [] stream_out_V_tvout_wrapc_buffer;

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "stream_in_V"
		delete [] tvin_stream_in_V;
		// release memory allocation: "enable_V"
		delete [] tvin_enable_V;
		// release memory allocation: "frame_done_V"
		delete [] tvout_frame_done_V;
		// release memory allocation: "stream_out_V"
		delete [] tvout_stream_out_V;
		delete [] tvin_stream_out_V;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

