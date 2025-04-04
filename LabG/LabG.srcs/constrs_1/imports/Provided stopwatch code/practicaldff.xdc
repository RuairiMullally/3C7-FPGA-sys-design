## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
## Switches
set_property PACKAGE_PIN V17 [get_ports {go}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {go}]
set_property PACKAGE_PIN V16 [get_ports {clr}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {clr}]
set_property PACKAGE_PIN W16 [get_ports {up}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {up}]

	
	
##7 segment display - Cathode pins
set_property PACKAGE_PIN V7 [get_ports {sseg[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[7]}]
set_property PACKAGE_PIN W7 [get_ports {sseg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[6]}]
set_property PACKAGE_PIN W6 [get_ports {sseg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[5]}]
set_property PACKAGE_PIN U8 [get_ports {sseg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[4]}]
set_property PACKAGE_PIN V8 [get_ports {sseg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[3]}]
set_property PACKAGE_PIN U5 [get_ports {sseg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[2]}]
set_property PACKAGE_PIN V5 [get_ports {sseg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[1]}]
set_property PACKAGE_PIN U7 [get_ports {sseg[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[0]}]



#Anode Selects
set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]



##Buttons
#set_property PACKAGE_PIN U18 [get_ports button_input[4]]						
#	set_property IOSTANDARD LVCMOS33 [get_ports button_input[4]]
#set_property PACKAGE_PIN T18 [get_ports button_input[0]]						
#	set_property IOSTANDARD LVCMOS33 [get_ports button_input[0]]
#set_property PACKAGE_PIN W19 [get_ports button_input[1]]						
#	set_property IOSTANDARD LVCMOS33 [get_ports button_input[1]]
#set_property PACKAGE_PIN T17 [get_ports button_input[3]]						
#	set_property IOSTANDARD LVCMOS33 [get_ports button_input[3]]
#set_property PACKAGE_PIN U17 [get_ports button_input[2]]						
#	set_property IOSTANDARD LVCMOS33 [get_ports button_input[2]]
 



