# project_summer2019

In this we have integrated both Telemetry IP & Telecommand IP.

This is an explanation for the working of the code.
The below 2 IPs are created in the block design and integrated with the processor.This block design is the simulated version of what will be implemented on the hardware(Zynq-7000)

The procedue for creating an IP is another big task which we found through internet.
The processor end part of the code is mostly done by the SDK part where in we need to incorporate the logic to be performed on the processor should be written in the blanks given in the generated code


Telecommand IP:(input 11 slave_registers & output is tc_out,tcclk_out) (works on rising edge of clock)
	
	In this IP we have used 11 slave registers of dataline 32. 
	These slave registers act as an input to the user logic. 
	The slave_register 0 act as control register whose LSB is used as the tc_start signal.
This signal is made high in the processor(SDK) when the remaining 10 slave_registers are filled with valid data given by the UI. 

In the PL end , we will be waiting for the tc_start signal to be high, when this signal becomes high we load the 32 bit data from slv_reg into 32bit piso register from where there is serial output.
this loading into piso happens every load signal which is made high every 32clockcycles.

The TC clock which is 3.125kHz is given as output only when tc_data is present along with it or else it will be grounded.

please note that the 3.125 kHz is generated provided the innput clock is 10MHz, this can be set inn clock_configuration in the Zynq-7000 block which is present as an IP during block_design generation.

 To change the clock frequency from 100 Mhz to 10MHz:
	1) please double click on the zynq-7000 ip block, a new window appears ,in the page navigator column present on the left side of the screen,please click on the clock configuration
		button.
	2)once the new window appears please select the PL Fabric Clocks dropdown
	3)please change the 100MHz to 10Mhz manually.
	
Files to be added and their reason in IP:
1)slv_reg : this is the top module which does most of the computation and all modules are instatiated here.
2)clk_div : this module is used to convert the 10MHz frequency to 3.125KHz which itself is the output and the tc_data is synchronous with.
3)d flip_flop: in order to add one clock delay so that there is no corruption of data in the while loading into the piso register.
4)piso: to convert 32 bit parallel data to serial output.


Telemetry IP:(input serial_out,tm_clock & output is 64 registers) (works on falling edge of clock)
	This IP we have serial_out & clock as an input, and 64 slave_registers as output. Out of 64 slave_registers the slave_register0 is used as a control register whose LSB is made high
	in the PL, on the condition that, when all slave registers are filled with valid data.

Firstly, the code checks for frame_sync ,(by commparing the 32 bit register data with 32bit predefined frame_sync),once this is satisfied then the state machine startsand will end by 
making the control register's LSB high.This is made low once next frame_sync comes

LOADING INTO SLAVE_REGISTERS:
	the slave_registers are loaded with data every 32 clock_cycles(as it is a 32 bit register).Every slave_registers has a dedicated state so there are 64 state.
	There is a temporary register which is loaded with data and this register is equated to 1 slaveregister based on the state.
The states are changed every rising edge of load signal. Load signal is made high(for 1 clock_cycle) every 32clock_cycles.

Modules and their need:
1)slv_reg_TM:this is the top module which instantiates sipo, the output from sipo(a 32 bit register) is assigned from slave_register1-slave_register63 for every load signal
2)sipo:the incoming serial data is stored in a register of size 32 bit.
3)d flip_flop: in order to add one clock delay so that there is no corruption of data in the while loading into the piso register.
