/*
 * Author : Federico Bertoli
 * email  : federico.bertoli@studio.unibo.it
 */

#include "read_sd_card.h"

static FATFS FS_instance;
static FIL fileL;
const TCHAR *Path = "0:/";
static FILINFO fno;
static DIR dir;
static int Buffer_size = 307200;

static BYTE BufferL[307200];

static long globalIndex = 0;
static int images_read_mono = 0;
static int images_read_dual = 0;

FRESULT result;

unsigned int BytesWr;

int mount_sd_card()
{
	// Mounting the sd_card

	result = f_mount(NULL, Path, 1);				/* Unmount the drive (used when the system resets but the pointer is still allocated */

	result = f_mount(&FS_instance, Path, 1);         /* Mount the default drive */

	if (result != 0)
	{
		xil_printf("Errore -1 : %i\r", result);
		return -1;
	}
	
	xil_printf("SD mounted successfully! %i\r", result);
	
	return 0;
}


int read_all_from_directory()
{
	if(!ENABLE_STEREO_STREAM )								// select the type of loading, 0 for mono channel, 1 for stereo channel
		return read_all_from_directory_mono();
	else
		return read_all_from_directory_dual();
}

int read_all_from_directory_mono()
{
	int res = 0;
	int i=0;
	int j=0;

	res = f_opendir(&dir, Path);     				/* Open the directory */
	if (res == FR_OK)
	{												// 800 because, for now, it's the max amount of pictures we can save before going out of our memory space.
		for (i=0; j<800 ; i++)						// "official" index is j, not i; that way the program can still look up into a folder full of 'wrong' files
		{
			res = f_readdir(&dir, &fno);			/* Read a directory item */

			if (res != FR_OK) 						/* error  */
				return -2;

			else if ( fno.fname[0]==0)				/* end of directory */
				break;

			else									/* It is a file */
			{
				//xil_printf("%s\r",fno.fname);		/* print file name top check on console. Test mode */
				if(strlen(fno.fname) > 4 && !strcmp(fno.fname + strlen(fno.fname) - 4, ".RAW"))		/* check if .RAW*/
					{
						read_from_sd_card_mono(fno.fname);	/* start writing the file into DDR */
						j++;
					}
			}
		}

		images_read_mono = j;					// setting the total amount of pictures read from the SD card,
	}											// so each time the application starts it can be dynamically determined
	else
		return -1;
	f_closedir(&dir);							// finally, closing the directory

	return 0;
}

int read_from_sd_card_mono(char *fileName)
{
	int i;

	result = f_open(&fileL, fileName, FA_READ);								// open the file with the received filename
	if (result != 0)
	{
		return -6;
	}
	xil_printf("File '%s' opened successfully!\r", fileName);

	// Read from file
	result = f_read(&fileL, (void*)BufferL, Buffer_size, &BytesWr);			// store all the contents into a buffer. Size is static,
	if (result != 0)														// because raw images have a 1:1 ratio of pixel and bytes
	{
		return -7;															// error
	}

	for (i = 0; i < Buffer_size; i++)
	{
		Xil_Out8((FRAME_BUFFER_BASE_ADDR_SD) + (globalIndex), BufferL[i]);	// write, byte per byte (8 bit at a time), the whole buffer into DDR.
		globalIndex++;
	}

	result = f_close(&fileL);											// Close file.
	if (result != 0)
	{
		return -8;
	}
	return 0;
}

int read_all_from_directory_dual()		/* supposing files will be ordered to be ALL RIGHTS (or LEFTS) with ALL EVEN (or ODD) indexes and viceversa*/
{										/* e.g. 1.RAW, 2.RAW, 3.RAW, 4.RAW. With this algorithm, 1 and 3 will be LEFT channeled, and 2 and 4 will be RIGHT channeled */
	int res = 0;
	int i=0;
	int j=0;
	char* tempFileName = "";
	int check = 0;					/* simple check : if a name has already been saved, it does send both to read_from_sd..., else, stores the name and goes on*/

	res = f_opendir(&dir, Path);     /* Open the directory */
	if (res == FR_OK)
	{
		for (i=0; j<400 ; i++)		// 400 because, for now, it's the max amount of (double) pictures we can save before going out of our memory space
		{
			res = f_readdir(&dir, &fno);			/* Read a directory item */

			if (res != FR_OK) 						/* error  */
				return -2;

			else if ( fno.fname[0]==0 )				/* end of directory */
				break;

			else									/* It is a file */
			{
				//xil_printf("%s\r",fno.fname);		/* print file name top check on console*/
				if(strlen(fno.fname) > 4 && !strcmp(fno.fname + strlen(fno.fname) - 4, ".RAW"))		/* check if .RAW*/
					{
						if(!check)
						{
							tempFileName = fno.fname;								/*temporarily store the file's name*/
							check++;												/*set check*/
						}
						else
						{
							read_from_sd_card_dual(tempFileName, fno.fname);		/*store 2 pictures in DDR*/
							j++;													/*increase relative pointer*/
							strcpy(tempFileName,"");								/*flushes the temporary variable value*/
							check=0;												/*reset check*/
						}
					}
			}
		}

		images_read_dual = j;				/* setting the total amount of pictures read from the SD card, so each time can be dynamically determined*/
	}
	else
		return -1;
	f_closedir(&dir);

	return 0;
}

int read_from_sd_card_dual(char *fileNameL, char *fileNameR)
{
	int i;

	FIL fileR;															// 2 new variables
	BYTE BufferR[307200];

	result = f_open(&fileL, fileNameL, FA_READ);						// open first file (supposing LEFT file)
	if (result != 0)
	{
		return -6;
	}
	xil_printf("File '%s' opened successfully!\r", fileNameL);

	result = f_open(&fileR, fileNameR, FA_READ);						// open second file (supposing LEFT file)
		if (result != 0)
		{
			return -6;
		}
		xil_printf("File '%s' opened successfully!\r", fileNameR);

	// Read from file_L
	result = f_read(&fileL, (void*)BufferL, Buffer_size, &BytesWr);		// store all the contents into a buffer (LEFT channel buffer) . Size is static,
	if (result != 0)													// because raw images have a 1:1 ratio of pixel and bytes
	{
		return -7;
	}
	//Read from file_R
	result = f_read(&fileR, (void*)BufferR, Buffer_size, &BytesWr);		// store all the contents into a buffer (RIGHT channel buffer) . Size is static,
	if (result != 0)													// because raw images have a 1:1 ratio of pixel and bytes
	{
		return -7;
	}

	for (i = 0; i < Buffer_size; i++)
	{
		Xil_Out8((FRAME_BUFFER_BASE_ADDR_SD) + (globalIndex), BufferL[i]);		/* write 1 byte from Left buffer */
		globalIndex++;
		Xil_Out8((FRAME_BUFFER_BASE_ADDR_SD) + (globalIndex), BufferR[i]);		/* write 1 byte from Right buffer */
		globalIndex++;
	}																			/* i advances 1 by 1, as we read 1 byte from each file*/
	//Close file.
	result = f_close(&fileL);
	if (result != 0)
	{
		return -8;
	}
	result = f_close(&fileR);
		if (result != 0)
		{
			return -8;
		}

	return 0;
}

int total_Images_Read_Mono()
{
	return images_read_mono;													// Static value who contains the total amount of (mono) pictures stored.
}

int total_Images_Read_Dual()
{
	return images_read_dual;													// Static value who contains the total amount of (stereo) pictures stored.
}

