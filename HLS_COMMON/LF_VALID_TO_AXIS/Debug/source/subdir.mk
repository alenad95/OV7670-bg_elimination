################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../LF_valid_to_AXIS.cpp 

OBJS += \
./source/LF_valid_to_AXIS.o 

CPP_DEPS += \
./source/LF_valid_to_AXIS.d 


# Each subdirectory must supply rules for building sources it contributes
source/LF_valid_to_AXIS.o: C:/Test_5_Tesi/HLS_COMMON/LF_VALID_TO_AXIS/LF_valid_to_AXIS.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -IF:/Vivado_old/Vivado_HLS/2016.2/include/etc -IF:/Vivado_old/Vivado_HLS/2016.2/include -IF:/Vivado_old/Vivado_HLS/2016.2/include/ap_sysc -IF:/Vivado_old/Vivado_HLS/2016.2/win64/tools/systemc/include -IF:/Vivado_old/Vivado_HLS/2016.2/win64/tools/auto_cc/include -IC:/Test_5_Tesi/HLS_COMMON -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


