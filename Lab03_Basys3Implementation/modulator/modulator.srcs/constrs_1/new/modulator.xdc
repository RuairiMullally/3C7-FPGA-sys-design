set_property PACKAGE_PIN T22 [get_ports pwm_out]
set_property IOSTANDARD LVCMOS33 [get_ports pwm_out]
set_property IOSTANDARD LVCMOS33 [get_ports clk_p]
set_property PACKAGE_PIN Y9 [get_ports clk_p]
set_property IOSTANDARD LVCMOS25 [get_ports sw0]
set_property PACKAGE_PIN F22 [get_ports sw0]
create_clock -period 10.000 -name clk_p -waveform {0.000 5.000} [get_ports clk_p]

