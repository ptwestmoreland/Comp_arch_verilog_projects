##LEDs, DIGITAL OUTPUTS OF ANALOG TO DIGITAL CONVERTER
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { LEDS[0] }]; #IO_L23P_T3_35 Sch=led[0]
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { LEDS[1] }]; #IO_L23N_T3_35 Sch=led[1]
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { LEDS[2] }]; #IO_0_35 Sch=led[2] 


##Header JC  USED TO ACCEPT LEVEL SHIFTED COMPARATOR ARRAY OUTPUTS, LSB(DATA[0] IS SET TO LOGIC 1 BY DEFAULT                                                                                                             
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33     } [get_ports { data[0] }]; #IO_L10P_T1_34 Sch=jc_p[1]   			 
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33     } [get_ports { data[1] }]; #IO_L10N_T1_34 Sch=jc_n[1]		     
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33     } [get_ports { data[2] }]; #IO_L1P_T0_34 Sch=jc_p[2]              
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33     } [get_ports { data[3] }]; #IO_L1N_T0_34 Sch=jc_n[2]              

##Header JD 
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33     } [get_ports { data[4] }]; #IO_L11P_T1_SRCC_34 Sch=jd_p[3]            
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33     } [get_ports { data[5] }]; #IO_L11N_T1_SRCC_34 Sch=jd_n[3]            
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33     } [get_ports { data[6] }]; #IO_L21P_T3_DQS_34 Sch=jd_p[4]             
set_property -dict { PACKAGE_PIN V18   IOSTANDARD LVCMOS33     } [get_ports { data[7] }]; #IO_L21N_T3_DQS_34 Sch=jd_n