/*
 * ddr_to_axis_reader.h
 *
 *  Created on: Feb 2, 2017
 *      Author: Mattia Bernasconi
 *        Mail: mattia@studiobernasconi.com
 */

#ifndef DDR_TO_AXIS_READER_H_
#define DDR_TO_AXIS_READER_H_

#include "platform_config.h"

XDdr_to_axis_reader reader;
XDdr_to_axis_reader reader_ref;

int init_ddr_to_axis_reader(void);
int configue_ddr_to_axis_reader(void);

int init_ddr_to_axis_reader_ref(void);
int configue_ddr_to_axis_reader_ref(void);

#endif /* DDR_TO_AXIS_READER_H_ */
