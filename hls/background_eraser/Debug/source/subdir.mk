################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Background_subtractor.cpp 

OBJS += \
./source/Background_subtractor.o 

CPP_DEPS += \
./source/Background_subtractor.d 


# Each subdirectory must supply rules for building sources it contributes
source/Background_subtractor.o: D:/SmartCamera-master/SmartCamera-master/HLS_COMMON/Background_subtractor/Background_subtractor.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -ID:/Vivado/Vivado/2019.1/include/ap_sysc -ID:/SmartCamera-master/SmartCamera-master/HLS_COMMON -ID:/Vivado/Vivado/2019.1/win64/tools/systemc/include -ID:/Vivado/Vivado/2019.1/include -ID:/Vivado/Vivado/2019.1/include/etc -ID:/Vivado/Vivado/2019.1/win64/tools/auto_cc/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


