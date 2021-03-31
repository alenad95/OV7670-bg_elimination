// Header file to be included in the cpp file. 

#include "ap_int.h"
#include <stdlib.h>
//#include "hls_stream.h"
//using namespace hls;

//#define THRESHOLD 1
#define WIDTH 640
#define HEIGHT 480
#define FRAMESIZE WIDTH*HEIGHT

typedef ap_uint<8> byte;

void  Background_subtractor (byte stream_new[FRAMESIZE], byte stream_ref[FRAMESIZE], volatile bool *enable, byte *threshold, volatile bool *pixel_done, byte stream_out[FRAMESIZE]);
