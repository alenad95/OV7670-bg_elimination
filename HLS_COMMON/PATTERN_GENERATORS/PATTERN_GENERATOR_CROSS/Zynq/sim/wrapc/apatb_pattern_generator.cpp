// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// ==============================================================

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


// wrapc file define: "outputStream_V"
#define AUTOTB_TVOUT_outputStream_V  "../tv/cdatafile/c.pattern_generator.autotvout_outputStream_V.dat"
#define AUTOTB_TVIN_outputStream_V  "../tv/cdatafile/c.pattern_generator.autotvin_outputStream_V.dat"
#define WRAPC_STREAM_SIZE_OUT_outputStream_V  "../tv/stream_size/stream_size_out_outputStream_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_outputStream_V  "../tv/stream_size/stream_egress_status_outputStream_V.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "outputStream_V"
#define AUTOTB_TVOUT_PC_outputStream_V  "../tv/rtldatafile/rtl.pattern_generator.autotvout_outputStream_V.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			outputStream_V_depth = 0;
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
			total_list << "{outputStream_V " << outputStream_V_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int outputStream_V_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};


#define pattern_generator AESL_ORIG_DUT_pattern_generator
extern void pattern_generator (
hls::stream<unsigned char >& outputStream);
#undef pattern_generator

void pattern_generator (
hls::stream<unsigned char >& outputStream)
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

		// define output stream variables: "outputStream"
		std::vector<unsigned char > aesl_tmp_0;
		int aesl_tmp_1;
		int aesl_tmp_2 = 0;

		// read output stream size: "outputStream"
		aesl_fh.read(WRAPC_STREAM_SIZE_OUT_outputStream_V, AESL_token); // [[transaction]]
		aesl_fh.read(WRAPC_STREAM_SIZE_OUT_outputStream_V, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(WRAPC_STREAM_SIZE_OUT_outputStream_V, AESL_token); // pop_size
			aesl_tmp_1 = atoi(AESL_token.c_str());
			aesl_fh.read(WRAPC_STREAM_SIZE_OUT_outputStream_V, AESL_token); // [[/transaction]]
		}

		// output port post check: "outputStream_V"
		aesl_fh.read(AUTOTB_TVOUT_PC_outputStream_V, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_outputStream_V, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_outputStream_V, AESL_token); // data

			std::vector<sc_bv<8> > outputStream_V_pc_buffer;
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
							cerr << "@W [SIM-201] RTL produces unknown value 'X' on port 'outputStream_V', possible cause: There are uninitialized variables in the C design." << endl;
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
							cerr << "@W [SIM-201] RTL produces unknown value 'X' on port 'outputStream_V', possible cause: There are uninitialized variables in the C design." << endl;
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
					outputStream_V_pc_buffer.push_back(AESL_token.c_str());
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_outputStream_V, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_outputStream_V))
				{
					exit(1);
				}
			}

			// correct the buffer size the current transaction
			if (i != aesl_tmp_1)
			{
				aesl_tmp_1 = i;
			}

			if (aesl_tmp_1 > 0 && aesl_tmp_0.size() < aesl_tmp_1)
			{
				int aesl_tmp_0_size = aesl_tmp_0.size();

				for (int tmp_aesl_tmp_0 = 0; tmp_aesl_tmp_0 < aesl_tmp_1 - aesl_tmp_0_size; tmp_aesl_tmp_0++)
				{
					unsigned char tmp;
					aesl_tmp_0.push_back(tmp);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: outputStream_V
				{
					// bitslice(7, 0)
					// {
						// celement: outputStream.V(7, 0)
						// {
							sc_lv<8>* outputStream_V_lv0_0_0_1 = new sc_lv<8>[aesl_tmp_1 - aesl_tmp_2];
						// }
					// }

					// bitslice(7, 0)
					{
						int hls_map_index = 0;
						// celement: outputStream.V(7, 0)
						{
							// carray: (aesl_tmp_2) => (aesl_tmp_1 - 1) @ (1)
							for (int i_0 = aesl_tmp_2; i_0 <= aesl_tmp_1 - 1; i_0 += 1)
							{
								if (&(aesl_tmp_0[0]) != NULL) // check the null address if the c port is array or others
								{
									outputStream_V_lv0_0_0_1[hls_map_index++].range(7, 0) = sc_bv<8>(outputStream_V_pc_buffer[hls_map_index].range(7, 0));
								}
							}
						}
					}

					// bitslice(7, 0)
					{
						int hls_map_index = 0;
						// celement: outputStream.V(7, 0)
						{
							// carray: (aesl_tmp_2) => (aesl_tmp_1 - 1) @ (1)
							for (int i_0 = aesl_tmp_2; i_0 <= aesl_tmp_1 - 1; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : aesl_tmp_0[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : aesl_tmp_0[0]
								// output_left_conversion : aesl_tmp_0[i_0]
								// output_type_conversion : (outputStream_V_lv0_0_0_1[hls_map_index++]).to_uint64()
								if (&(aesl_tmp_0[0]) != NULL) // check the null address if the c port is array or others
								{
									aesl_tmp_0[i_0] = (outputStream_V_lv0_0_0_1[hls_map_index++]).to_uint64();
								}
							}
						}
					}
				}
			}
		}

		// push back output stream: "outputStream"
		for (int i = 0; i < aesl_tmp_1; i++)
		{
			outputStream.write(aesl_tmp_0[i]);
		}

		AESL_transaction_pc++;
	}
	else
	{
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "outputStream_V"
		char* tvin_outputStream_V = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_outputStream_V);
		char* tvout_outputStream_V = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_outputStream_V);
		char* wrapc_stream_size_out_outputStream_V = new char[50];
		aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_outputStream_V);
		char* wrapc_stream_egress_status_outputStream_V = new char[50];
		aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_outputStream_V);

		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// dump stream tvin: "outputStream"
		std::vector<unsigned char > aesl_tmp_0;
		int aesl_tmp_1 = 0;
		while (!outputStream.empty())
		{
			aesl_tmp_0.push_back(outputStream.read());
			aesl_tmp_1++;
		}

		// push back input stream: "outputStream"
		for (int i = 0; i < aesl_tmp_1; i++)
		{
			outputStream.write(aesl_tmp_0[i]);
		}

// [call_c_dut] ---------->

		AESL_ORIG_DUT_pattern_generator(outputStream);

		// pop output stream: "outputStream"
		int aesl_tmp_2 = aesl_tmp_1;
		aesl_tmp_1 = 0;
     aesl_tmp_0.clear();
		while (!outputStream.empty())
		{
			aesl_tmp_0.push_back(outputStream.read());
			aesl_tmp_1++;
		}

		// [[transaction]]
		sprintf(tvout_outputStream_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_outputStream_V, tvout_outputStream_V);

		sc_bv<8>* outputStream_V_tvout_wrapc_buffer = new sc_bv<8>[aesl_tmp_1 - aesl_tmp_2];

		// RTL Name: outputStream_V
		{
			// bitslice(7, 0)
			{
				int hls_map_index = 0;
				// celement: outputStream.V(7, 0)
				{
					// carray: (aesl_tmp_2) => (aesl_tmp_1 - 1) @ (1)
					for (int i_0 = aesl_tmp_2; i_0 <= aesl_tmp_1 - 1; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : aesl_tmp_0[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : aesl_tmp_0[0]
						// regulate_c_name       : outputStream_V
						// input_type_conversion : aesl_tmp_0[i_0]
						if (&(aesl_tmp_0[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<8> outputStream_V_tmp_mem;
							outputStream_V_tmp_mem = aesl_tmp_0[i_0];
							outputStream_V_tvout_wrapc_buffer[hls_map_index++].range(7, 0) = outputStream_V_tmp_mem.range(7, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < aesl_tmp_1 - aesl_tmp_2; i++)
		{
			sprintf(tvout_outputStream_V, "%s\n", (outputStream_V_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_outputStream_V, tvout_outputStream_V);
		}

		tcl_file.set_num(aesl_tmp_1 - aesl_tmp_2, &tcl_file.outputStream_V_depth);
		sprintf(tvout_outputStream_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_outputStream_V, tvout_outputStream_V);

		// release memory allocation
		delete [] outputStream_V_tvout_wrapc_buffer;

		// dump stream size
		sprintf(wrapc_stream_size_out_outputStream_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outputStream_V, wrapc_stream_size_out_outputStream_V);
		sprintf(wrapc_stream_size_out_outputStream_V, "%d\n", aesl_tmp_1 - aesl_tmp_2);
		aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outputStream_V, wrapc_stream_size_out_outputStream_V);
		sprintf(wrapc_stream_size_out_outputStream_V, "[[/transaction]] \n");
		aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outputStream_V, wrapc_stream_size_out_outputStream_V);

		// push back output stream: "outputStream"
		for (int i = 0; i < aesl_tmp_1; i++)
		{
			outputStream.write(aesl_tmp_0[i]);
		}

		// release memory allocation: "outputStream_V"
		delete [] tvout_outputStream_V;
		delete [] tvin_outputStream_V;
		delete [] wrapc_stream_size_out_outputStream_V;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

