/* The enable input is set to 1 if a button is pressed (or if the sensor sends an interrupt). In this case, the background is eliminated from the
acquired image, otherwise, the reference image is sent to the output.
The intention is to obtain an output image where only the face of the person is shown and the background is completely white.*/
#include "Background_subtractor.h"

void  Background_subtractor (byte stream_new[FRAMESIZE], byte stream_ref[FRAMESIZE], volatile bool *enable, byte *threshold, volatile bool *pixel_done, byte stream_out[FRAMESIZE])
{
	#pragma HLS INTERFACE ap_none port=threshold
	#pragma HLS INTERFACE ap_none port=enable
	#pragma HLS INTERFACE axis port=stream_new
	#pragma HLS INTERFACE axis port=stream_ref
	#pragma HLS INTERFACE axis port=stream_out
	#pragma HLS INTERFACE ap_none port=pixel_done
	
	byte pixel_new, pixel_ref;
	int diff;
	int i, cont, j;
	bool int_done=false;


	for(j=0; j<HEIGHT; j++)
		for(i=0; i<WIDTH; i++)
		{

			pixel_new = stream_new[j*WIDTH+i];
			pixel_ref = stream_ref[j*WIDTH+i];

			if (*enable)
				{
					diff=(int)(pixel_new-pixel_ref);
					if (abs(diff)<(*threshold))
					{
						stream_out[j*WIDTH+i] = 0xff;
					}
					else
					{
						stream_out[j*WIDTH+i] = stream_new[j*WIDTH+i];
					}
				}
			else
			{
				stream_out[j*WIDTH+i] = stream_new[j*WIDTH+i];
			}

			/* This flag tells us that a single pixel has been processed. */

			int_done = !int_done;
			*pixel_done=int_done;

		}
	return;
}
