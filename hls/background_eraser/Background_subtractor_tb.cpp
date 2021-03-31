#include "Background_subtractor.h"
#include <stdio.h>

int main ()
{
	ap_uint<1> enable=1;
	volatile ap_uint<1> frame_done;

	// The first half is the new pixel, while the second half is the reference pixel
	ap_uint<16> stream_in[]={0x0F0F, 0xA0A0, 0x0101, 0x0ECA};
	volatile ap_uint<8> stream_out[FRAMESIZE];
	Background_subtractor (stream_in, enable, &frame_done, stream_out);
	printf ("I have processed a frame \n");
	return 0;
}
