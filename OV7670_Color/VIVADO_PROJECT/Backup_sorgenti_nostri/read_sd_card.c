/*
 * Author : Federico Bertoli
 * email  : federico.bertoli@studio.unibo.it
 */

#include "read_sd_card.h"

static FATFS FS_instance;
static FIL file;
const TCHAR *Path = "0:/";
static char FileName[32] = "0:/text.txt";
static FILINFO fno;
static DIR dir;

static BYTE Buffer[307200];
int Buffer_size = 307200;

u32 BaseAddress = 0x08000000;
static long globalIndex = 0;


FRESULT result;

static char *File;
unsigned int BytesWr;

int mount_sd_card()
{
	// Mounting the sd_card

	result = f_mount(NULL, Path, 1);

	xil_printf("Sample 1 : %i\r", result);

	result = f_mount(&FS_instance, Path, 1);         /* Mount the default drive */

	if (result != 0)
	{
		xil_printf("Errore -1 : %i\r", result);
		return -1;
	}
	
	xil_printf("SD mounted successfully! %i\r", result);
	
	/*	Test1 di Zobel
	 *
	result = f_open(&file, FileName, FA_CREATE_ALWAYS | FA_WRITE | FA_READ);
	if (result != 0)
	{
		xil_printf("Errore -2 : %i\r", result);
		return -2;
	}
	xil_printf("File created successfully!\r");
	*/
	
	return 0;
}

int write_to_sd_card_Test()
{
	int i;

	// Read from ddr bytes
	//Il numero di cicli � indicativo!
	// In questo caso viene letta
	// un'immagine 640 x 480 = 307200!

	for (i = 0; i < 50 ; i++)
	{
		xil_printf("%i ", Xil_In8((BaseAddress) + (i)));
	}
	xil_printf("File read from ddr successfully!\r");


	// Open file for writing
	File = (char *)FileName;

	result = f_open(&file, "TESTIMAGE.PNG", FA_CREATE_ALWAYS | FA_WRITE | FA_READ);

	if (result != 0)
	{
		xil_printf("Non riesco ad aprire il File\r");
		return -3;
	}
	xil_printf("File opened successfully!\r");

	// Write to file
	result = f_write(&file, (const void*)Buffer, Buffer_size, &BytesWr);
	if (result != 0)
	{
		xil_printf("Non riesco a scrivere sul File\r");
		return -4;
	}
	xil_printf("File wrote successfully!\r");
	// Close file.

	result = f_close(&file);
	if (result != 0)
	{
		xil_printf("Non riesco a chiudere il File\r");
		return -5;
	}
	xil_printf("File closed successfully!\r");

	return 0;
}

int read_from_sd_card_Test()
{
	int i;

	// Open file for reading
	File = (char *)FileName;

	result = f_open(&file, File, FA_READ);
	if (result != 0)
	{
		return -6;
	}
	
	xil_printf("File opened successfully!\r");
	
	// Read from file
	result = f_read(&file, (void*)Buffer, Buffer_size, &BytesWr);
	if (result != 0)
	{
		return -7;
	}
	xil_printf("File read successfully!\r");

	// Write on ddr bytes read from sd card
	// Il numero di cicli � indicativo!
	// In questo caso viene scritta
	// un'immagine 640 x 480 = 307200!

	for (i = 0; i < Buffer_size; i++)
	{
		Xil_Out8((BaseAddress) + (i), Buffer[i]);
	}
	xil_printf("File wrote to ddr successfully!\r");

	//Close file.
	result = f_close(&file);
	if (result != 0)
	{
		return -8;
	}
	
	xil_printf("File closed successfully!\r");
	return 0;
}

int read_from_sd_card(char *fileName)
{
	int i;

	result = f_open(&file, fileName, FA_READ);
	if (result != 0)
	{
		return -6;
	}

	xil_printf("File '%s' opened successfully!\r", fileName);

	// Read from file
	result = f_read(&file, (void*)Buffer, Buffer_size, &BytesWr);
	if (result != 0)
	{
		return -7;
	}
	xil_printf("File read successfully! Read %d bytes \r", BytesWr);

	// Write on ddr bytes read from sd card
	// Il numero di cicli � indicativo!
	// In questo caso viene scritta
	// un'immagine 640 x 480 = 307200!

	for (i = 0; i < Buffer_size; i++)
	{
		Xil_Out8((BaseAddress) + (globalIndex), Buffer[i]);
		globalIndex++;

		/*
		if(i<50)
			xil_printf("%i ", Buffer[i]);
		*/
	}
	xil_printf("File wrote to ddr successfully! - globalIndex : %ld\r", globalIndex );

	//Close file.
	result = f_close(&file);
	if (result != 0)
	{
		return -8;
	}

	xil_printf("File closed successfully!\r");

	return 0;
}

int read_from_sd_card_Test2()
{
	int j,i;
	u32 sampleAddress = 0x00FF0000;
	int res = 0;

	xil_printf("1\r");

	res = f_opendir(&dir, Path);
		if (res == FR_OK)
		{

			xil_printf("2\r");

			for (;;)
			{
				res = f_readdir(&dir, &fno);			/* Read a directory item */

				xil_printf("3\r");

				if (res != FR_OK) 						/* error  */
					return -2;

				else if ( fno.fname[0]==0)				/* end of directory */
					break;

				else									/* It is a file */
				{
					xil_printf("%s\r",fno.fname);		/* print file name top check on console*/

														/* check if .RAW*/
					if(strlen(fno.fname) > 4 && !strcmp(fno.fname + strlen(fno.fname) - 4, ".RAW"))
						{
							break;
						}
				}
			}
		}

	result = f_open(&file, fno.fname, FA_READ);
	if (result != 0)
	{
		return -6;
	}

	xil_printf("File '%s' opened successfully!\r", fno.fname);

	// Read from file
	result = f_read(&file, (void*)Buffer, Buffer_size, &BytesWr);
	if (result != 0)
	{
		return -7;
	}
	xil_printf("File read successfully! Read %d bytes \r", BytesWr);

	// Write on ddr bytes read from sd card
	// Il numero di cicli � indicativo!
	// In questo caso viene scritta
	// un'immagine 640 x 480 = 307200!


	for(j =0 ; j<850; j++)
	{
		for (i = 0; i < Buffer_size; i++)
		{
			Xil_Out8((sampleAddress) + (globalIndex), Buffer[i]);
			globalIndex++;

			/*
			if(i<50)
				xil_printf("%i ", Buffer[i]);
			*/
		}
		xil_printf("File wrote to ddr successfully! - j : %d\r", j );
	}
	//Close file.
	result = f_close(&file);
	if (result != 0)
	{
		return -8;
	}

	xil_printf("File closed successfully!\r");

	return 0;
}

int read_all_from_directory()
{
	int res = 0;

	res = f_opendir(&dir, Path);     /* Open the directory */
	if (res == FR_OK)
	{
		for (;;)
		{
			res = f_readdir(&dir, &fno);			/* Read a directory item */

			if (res != FR_OK) 						/* error  */
				return -2;

			else if ( fno.fname[0]==0)				/* end of directory */
				break;

			else									/* It is a file */
			{
				xil_printf("%s\r",fno.fname);		/* print file name top check on console*/

													/* check if .JPG*/
				if(strlen(fno.fname) > 4 && !strcmp(fno.fname + strlen(fno.fname) - 4, ".RAW"))
					read_from_sd_card(fno.fname);
			}
		}
	}
	else
		return -1;
	f_closedir(&dir);

	return 0;
}

