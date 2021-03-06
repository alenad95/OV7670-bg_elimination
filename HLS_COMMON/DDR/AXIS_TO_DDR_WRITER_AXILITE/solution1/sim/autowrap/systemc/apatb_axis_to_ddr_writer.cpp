// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
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
#include "ap_stream.h"
#include "hls_stream.h"
#include "hls_half.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;


// [dump_struct_tree [build_nameSpaceTree] dumpedStructList] ---------->


// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "inputStream_V"
#define AUTOTB_TVIN_inputStream_V  "../tv/cdatafile/c.axis_to_ddr_writer.autotvin_inputStream_V.dat"
#define WRAPC_STREAM_SIZE_IN_inputStream_V  "../tv/stream_size/stream_size_in_inputStream_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_inputStream_V  "../tv/stream_size/stream_ingress_status_inputStream_V.dat"
// wrapc file define: "base_ddr_addr"
#define AUTOTB_TVOUT_base_ddr_addr  "../tv/cdatafile/c.axis_to_ddr_writer.autotvout_base_ddr_addr.dat"
#define AUTOTB_TVIN_base_ddr_addr  "../tv/cdatafile/c.axis_to_ddr_writer.autotvin_base_ddr_addr.dat"
// wrapc file define: "frame_index_V"
#define AUTOTB_TVOUT_frame_index_V  "../tv/cdatafile/c.axis_to_ddr_writer.autotvout_frame_index_V.dat"
// wrapc file define: "frame_count"
#define AUTOTB_TVOUT_frame_count  "../tv/cdatafile/c.axis_to_ddr_writer.autotvout_frame_count.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "base_ddr_addr"
#define AUTOTB_TVOUT_PC_base_ddr_addr  "../tv/rtldatafile/rtl.axis_to_ddr_writer.autotvout_base_ddr_addr.dat"
// tvout file define: "frame_index_V"
#define AUTOTB_TVOUT_PC_frame_index_V  "../tv/rtldatafile/rtl.axis_to_ddr_writer.autotvout_frame_index_V.dat"
// tvout file define: "frame_count"
#define AUTOTB_TVOUT_PC_frame_count  "../tv/rtldatafile/rtl.axis_to_ddr_writer.autotvout_frame_count.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			inputStream_V_depth = 0;
			base_ddr_addr_depth = 0;
			frame_index_V_depth = 0;
			frame_count_depth = 0;
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
			total_list << "{inputStream_V " << inputStream_V_depth << "}\n";
			total_list << "{base_ddr_addr " << base_ddr_addr_depth << "}\n";
			total_list << "{frame_index_V " << frame_index_V_depth << "}\n";
			total_list << "{frame_count " << frame_count_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int inputStream_V_depth;
		int base_ddr_addr_depth;
		int frame_index_V_depth;
		int frame_count_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};


#define axis_to_ddr_writer AESL_ORIG_DUT_axis_to_ddr_writer
extern void axis_to_ddr_writer (
hls::stream<unsigned char >& inputStream,
volatile long long int* base_ddr_addr,
ap_uint<3>* frame_index,
unsigned int* frame_count);
#undef axis_to_ddr_writer

void axis_to_ddr_writer (
hls::stream<unsigned char >& inputStream,
volatile long long int* base_ddr_addr,
ap_uint<3>* frame_index,
unsigned int* frame_count)
{
	fstream wrapc_switch_file_token;
	wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
	int AESL_i;
	if (wrapc_switch_file_token.good())
	{
		static unsigned AESL_transaction_pc = 0;
		string AESL_token;
		string AESL_num;
		static AESL_FILE_HANDLER aesl_fh;

		// pop stream input: "inputStream"
		aesl_fh.read(WRAPC_STREAM_SIZE_IN_inputStream_V, AESL_token); // [[transaction]]
		aesl_fh.read(WRAPC_STREAM_SIZE_IN_inputStream_V, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(WRAPC_STREAM_SIZE_IN_inputStream_V, AESL_token); // pop_size
			int aesl_tmp_1 = atoi(AESL_token.c_str());
			for (int i = 0; i < aesl_tmp_1; i++)
			{
				inputStream.read();
			}
			aesl_fh.read(WRAPC_STREAM_SIZE_IN_inputStream_V, AESL_token); // [[/transaction]]
		}

		// output port post check: "base_ddr_addr"
		aesl_fh.read(AUTOTB_TVOUT_PC_base_ddr_addr, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_base_ddr_addr, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_base_ddr_addr, AESL_token); // data

			sc_bv<64> *base_ddr_addr_pc_buffer = new sc_bv<64>[32];
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
							cerr << "@W [SIM-201] RTL produces unknown value 'X' on port 'base_ddr_addr', possible cause: There are uninitialized variables in the C design." << endl;
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
							cerr << "@W [SIM-201] RTL produces unknown value 'X' on port 'base_ddr_addr', possible cause: There are uninitialized variables in the C design." << endl;
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
					base_ddr_addr_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_base_ddr_addr, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_base_ddr_addr))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: base_ddr_addr
				{
					// bitslice(63, 0)
					// {
						// celement: base_ddr_addr(63, 0)
						// {
							sc_lv<64>* base_ddr_addr_lv0_0_31_1 = new sc_lv<64>[32];
						// }
					// }

					// bitslice(63, 0)
					{
						int hls_map_index = 0;
						// celement: base_ddr_addr(63, 0)
						{
							// carray: (0) => (31) @ (1)
							for (int i_0 = 0; i_0 <= 31; i_0 += 1)
							{
								if (&(base_ddr_addr[0]) != NULL) // check the null address if the c port is array or others
								{
									base_ddr_addr_lv0_0_31_1[hls_map_index++].range(63, 0) = sc_bv<64>(base_ddr_addr_pc_buffer[hls_map_index].range(63, 0));
								}
							}
						}
					}

					// bitslice(63, 0)
					{
						int hls_map_index = 0;
						// celement: base_ddr_addr(63, 0)
						{
							// carray: (0) => (31) @ (1)
							for (int i_0 = 0; i_0 <= 31; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : base_ddr_addr[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : base_ddr_addr[0]
								// output_left_conversion : base_ddr_addr[i_0]
								// output_type_conversion : (base_ddr_addr_lv0_0_31_1[hls_map_index++]).to_uint64()
								if (&(base_ddr_addr[0]) != NULL) // check the null address if the c port is array or others
								{
									base_ddr_addr[i_0] = (base_ddr_addr_lv0_0_31_1[hls_map_index++]).to_uint64();
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] base_ddr_addr_pc_buffer;
		}

		// output port post check: "frame_index_V"
		aesl_fh.read(AUTOTB_TVOUT_PC_frame_index_V, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_frame_index_V, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_frame_index_V, AESL_token); // data

			sc_bv<3> *frame_index_V_pc_buffer = new sc_bv<3>[1];
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
							cerr << "@W [SIM-201] RTL produces unknown value 'X' on port 'frame_index_V', possible cause: There are uninitialized variables in the C design." << endl;
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
							cerr << "@W [SIM-201] RTL produces unknown value 'X' on port 'frame_index_V', possible cause: There are uninitialized variables in the C design." << endl;
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
					frame_index_V_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_frame_index_V, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_frame_index_V))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: frame_index_V
				{
					// bitslice(2, 0)
					// {
						// celement: frame_index.V(2, 0)
						// {
							sc_lv<3>* frame_index_V_lv0_0_0_1 = new sc_lv<3>[1];
						// }
					// }

					// bitslice(2, 0)
					{
						int hls_map_index = 0;
						// celement: frame_index.V(2, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(frame_index[0]) != NULL) // check the null address if the c port is array or others
								{
									frame_index_V_lv0_0_0_1[hls_map_index++].range(2, 0) = sc_bv<3>(frame_index_V_pc_buffer[hls_map_index].range(2, 0));
								}
							}
						}
					}

					// bitslice(2, 0)
					{
						int hls_map_index = 0;
						// celement: frame_index.V(2, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : frame_index[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : frame_index[0]
								// output_left_conversion : frame_index[i_0]
								// output_type_conversion : (frame_index_V_lv0_0_0_1[hls_map_index++]).to_string(SC_BIN).c_str()
								if (&(frame_index[0]) != NULL) // check the null address if the c port is array or others
								{
									frame_index[i_0] = (frame_index_V_lv0_0_0_1[hls_map_index++]).to_string(SC_BIN).c_str();
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] frame_index_V_pc_buffer;
		}

		// output port post check: "frame_count"
		aesl_fh.read(AUTOTB_TVOUT_PC_frame_count, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_frame_count, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_frame_count, AESL_token); // data

			sc_bv<32> *frame_count_pc_buffer = new sc_bv<32>[1];
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
							cerr << "@W [SIM-201] RTL produces unknown value 'X' on port 'frame_count', possible cause: There are uninitialized variables in the C design." << endl;
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
							cerr << "@W [SIM-201] RTL produces unknown value 'X' on port 'frame_count', possible cause: There are uninitialized variables in the C design." << endl;
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
					frame_count_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_frame_count, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_frame_count))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: frame_count
				{
					// bitslice(31, 0)
					// {
						// celement: frame_count(31, 0)
						// {
							sc_lv<32>* frame_count_lv0_0_0_1 = new sc_lv<32>[1];
						// }
					// }

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: frame_count(31, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(frame_count[0]) != NULL) // check the null address if the c port is array or others
								{
									frame_count_lv0_0_0_1[hls_map_index++].range(31, 0) = sc_bv<32>(frame_count_pc_buffer[hls_map_index].range(31, 0));
								}
							}
						}
					}

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: frame_count(31, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : frame_count[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : frame_count[0]
								// output_left_conversion : frame_count[i_0]
								// output_type_conversion : (frame_count_lv0_0_0_1[hls_map_index++]).to_uint64()
								if (&(frame_count[0]) != NULL) // check the null address if the c port is array or others
								{
									frame_count[i_0] = (frame_count_lv0_0_0_1[hls_map_index++]).to_uint64();
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] frame_count_pc_buffer;
		}

		AESL_transaction_pc++;
	}
	else
	{
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "inputStream_V"
		char* tvin_inputStream_V = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_inputStream_V);
		char* wrapc_stream_size_in_inputStream_V = new char[50];
		aesl_fh.touch(WRAPC_STREAM_SIZE_IN_inputStream_V);
		char* wrapc_stream_ingress_status_inputStream_V = new char[50];
		aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_inputStream_V);

		// "base_ddr_addr"
		char* tvin_base_ddr_addr = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_base_ddr_addr);
		char* tvout_base_ddr_addr = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_base_ddr_addr);

		// "frame_index_V"
		char* tvout_frame_index_V = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_frame_index_V);

		// "frame_count"
		char* tvout_frame_count = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_frame_count);

		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// dump stream tvin: "inputStream"
		std::vector<unsigned char > aesl_tmp_0;
		int aesl_tmp_1 = 0;
		while (!inputStream.empty())
		{
			aesl_tmp_0.push_back(inputStream.read());
			aesl_tmp_1++;
		}

		// [[transaction]]
		sprintf(tvin_base_ddr_addr, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_base_ddr_addr, tvin_base_ddr_addr);

		sc_bv<64>* base_ddr_addr_tvin_wrapc_buffer = new sc_bv<64>[32];

		// RTL Name: base_ddr_addr
		{
			// bitslice(63, 0)
			{
				int hls_map_index = 0;
				// celement: base_ddr_addr(63, 0)
				{
					// carray: (0) => (31) @ (1)
					for (int i_0 = 0; i_0 <= 31; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : base_ddr_addr[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : base_ddr_addr[0]
						// regulate_c_name       : base_ddr_addr
						// input_type_conversion : base_ddr_addr[i_0]
						if (&(base_ddr_addr[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<64> base_ddr_addr_tmp_mem;
							base_ddr_addr_tmp_mem = base_ddr_addr[i_0];
							base_ddr_addr_tvin_wrapc_buffer[hls_map_index++].range(63, 0) = base_ddr_addr_tmp_mem.range(63, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 32; i++)
		{
			sprintf(tvin_base_ddr_addr, "%s\n", (base_ddr_addr_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_base_ddr_addr, tvin_base_ddr_addr);
		}

		tcl_file.set_num(32, &tcl_file.base_ddr_addr_depth);
		sprintf(tvin_base_ddr_addr, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_base_ddr_addr, tvin_base_ddr_addr);

		// release memory allocation
		delete [] base_ddr_addr_tvin_wrapc_buffer;

		// push back input stream: "inputStream"
		for (int i = 0; i < aesl_tmp_1; i++)
		{
			inputStream.write(aesl_tmp_0[i]);
		}

// [call_c_dut] ---------->

		AESL_ORIG_DUT_axis_to_ddr_writer(inputStream, base_ddr_addr, frame_index, frame_count);

		// record input size to tv3: "inputStream"
		int aesl_tmp_2 = inputStream.size();

		// [[transaction]]
		sprintf(tvin_inputStream_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_inputStream_V, tvin_inputStream_V);
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inputStream_V, tvin_inputStream_V);

		sc_bv<8>* inputStream_V_tvin_wrapc_buffer = new sc_bv<8>[aesl_tmp_1 - aesl_tmp_2];

		// RTL Name: inputStream_V
		{
			// bitslice(7, 0)
			{
				int hls_map_index = 0;
				// celement: inputStream.V(7, 0)
				{
					// carray: (0) => (aesl_tmp_1 - aesl_tmp_2 - 1) @ (1)
					for (int i_0 = 0; i_0 <= aesl_tmp_1 - aesl_tmp_2 - 1; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : aesl_tmp_0[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : aesl_tmp_0[0]
						// regulate_c_name       : inputStream_V
						// input_type_conversion : aesl_tmp_0[i_0]
						if (&(aesl_tmp_0[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> inputStream_V_tmp_mem;
							inputStream_V_tmp_mem = aesl_tmp_0[i_0];
							inputStream_V_tvin_wrapc_buffer[hls_map_index++].range(7, 0) = inputStream_V_tmp_mem.range(7, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < aesl_tmp_1 - aesl_tmp_2; i++)
		{
			sprintf(tvin_inputStream_V, "%s\n", (inputStream_V_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_inputStream_V, tvin_inputStream_V);
		}

		// dump stream ingress status to file
		sc_int<32> stream_ingress_size_inputStream_V = aesl_tmp_1;
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inputStream_V, stream_ingress_size_inputStream_V.to_string().c_str());
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inputStream_V, "\n");

		for (int i = 0; i < aesl_tmp_1 - aesl_tmp_2; i++)
		{
			stream_ingress_size_inputStream_V--;
			aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inputStream_V, stream_ingress_size_inputStream_V.to_string().c_str());
			aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inputStream_V, "\n");
		}

		tcl_file.set_num(aesl_tmp_1 - aesl_tmp_2, &tcl_file.inputStream_V_depth);
		sprintf(tvin_inputStream_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_inputStream_V, tvin_inputStream_V);
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inputStream_V, tvin_inputStream_V);

		// release memory allocation
		delete [] inputStream_V_tvin_wrapc_buffer;

		// dump stream size
		sprintf(wrapc_stream_size_in_inputStream_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_inputStream_V, wrapc_stream_size_in_inputStream_V);
		sprintf(wrapc_stream_size_in_inputStream_V, "%d\n", aesl_tmp_1 - aesl_tmp_2);
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_inputStream_V, wrapc_stream_size_in_inputStream_V);
		sprintf(wrapc_stream_size_in_inputStream_V, "[[/transaction]] \n");
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_inputStream_V, wrapc_stream_size_in_inputStream_V);

		// [[transaction]]
		sprintf(tvout_base_ddr_addr, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_base_ddr_addr, tvout_base_ddr_addr);

		sc_bv<64>* base_ddr_addr_tvout_wrapc_buffer = new sc_bv<64>[32];

		// RTL Name: base_ddr_addr
		{
			// bitslice(63, 0)
			{
				int hls_map_index = 0;
				// celement: base_ddr_addr(63, 0)
				{
					// carray: (0) => (31) @ (1)
					for (int i_0 = 0; i_0 <= 31; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : base_ddr_addr[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : base_ddr_addr[0]
						// regulate_c_name       : base_ddr_addr
						// input_type_conversion : base_ddr_addr[i_0]
						if (&(base_ddr_addr[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<64> base_ddr_addr_tmp_mem;
							base_ddr_addr_tmp_mem = base_ddr_addr[i_0];
							base_ddr_addr_tvout_wrapc_buffer[hls_map_index++].range(63, 0) = base_ddr_addr_tmp_mem.range(63, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 32; i++)
		{
			sprintf(tvout_base_ddr_addr, "%s\n", (base_ddr_addr_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_base_ddr_addr, tvout_base_ddr_addr);
		}

		tcl_file.set_num(32, &tcl_file.base_ddr_addr_depth);
		sprintf(tvout_base_ddr_addr, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_base_ddr_addr, tvout_base_ddr_addr);

		// release memory allocation
		delete [] base_ddr_addr_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_frame_index_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_frame_index_V, tvout_frame_index_V);

		sc_bv<3>* frame_index_V_tvout_wrapc_buffer = new sc_bv<3>[1];

		// RTL Name: frame_index_V
		{
			// bitslice(2, 0)
			{
				int hls_map_index = 0;
				// celement: frame_index.V(2, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : frame_index[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : frame_index[0]
						// regulate_c_name       : frame_index_V
						// input_type_conversion : (frame_index[i_0]).to_string(2).c_str()
						if (&(frame_index[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<3> frame_index_V_tmp_mem;
							frame_index_V_tmp_mem = (frame_index[i_0]).to_string(2).c_str();
							frame_index_V_tvout_wrapc_buffer[hls_map_index++].range(2, 0) = frame_index_V_tmp_mem.range(2, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_frame_index_V, "%s\n", (frame_index_V_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_frame_index_V, tvout_frame_index_V);
		}

		tcl_file.set_num(1, &tcl_file.frame_index_V_depth);
		sprintf(tvout_frame_index_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_frame_index_V, tvout_frame_index_V);

		// release memory allocation
		delete [] frame_index_V_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_frame_count, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_frame_count, tvout_frame_count);

		sc_bv<32>* frame_count_tvout_wrapc_buffer = new sc_bv<32>[1];

		// RTL Name: frame_count
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: frame_count(31, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : frame_count[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : frame_count[0]
						// regulate_c_name       : frame_count
						// input_type_conversion : frame_count[i_0]
						if (&(frame_count[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> frame_count_tmp_mem;
							frame_count_tmp_mem = frame_count[i_0];
							frame_count_tvout_wrapc_buffer[hls_map_index++].range(31, 0) = frame_count_tmp_mem.range(31, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_frame_count, "%s\n", (frame_count_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_frame_count, tvout_frame_count);
		}

		tcl_file.set_num(1, &tcl_file.frame_count_depth);
		sprintf(tvout_frame_count, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_frame_count, tvout_frame_count);

		// release memory allocation
		delete [] frame_count_tvout_wrapc_buffer;

		// release memory allocation: "inputStream_V"
		delete [] tvin_inputStream_V;
		delete [] wrapc_stream_size_in_inputStream_V;
		// release memory allocation: "base_ddr_addr"
		delete [] tvout_base_ddr_addr;
		delete [] tvin_base_ddr_addr;
		// release memory allocation: "frame_index_V"
		delete [] tvout_frame_index_V;
		// release memory allocation: "frame_count"
		delete [] tvout_frame_count;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

