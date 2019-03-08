EESchema Schematic File Version 4
LIBS:mixer-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L chain:LT5526 U1
U 1 1 5C80EA3E
P 3500 3850
F 0 "U1" H 3100 4300 50  0000 R CNN
F 1 "LT5526" H 3200 4200 50  0000 R CNN
F 2 "ISL6292-2CR4Z:QFN65P400X400X100-17N" H 3400 3850 50  0001 C CNN
F 3 "" H 3400 3850 50  0001 C CNN
	1    3500 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Small L2
U 1 1 5C80EE0B
P 2400 4000
F 0 "L2" V 2350 4000 50  0000 C CNN
F 1 "6.9n" V 2250 4000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2400 4000 50  0001 C CNN
F 3 "~" H 2400 4000 50  0001 C CNN
	1    2400 4000
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5C80F0C1
P 2400 3800
F 0 "C1" V 2171 3800 50  0000 C CNN
F 1 "4.4p" V 2262 3800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2400 3800 50  0001 C CNN
F 3 "~" H 2400 3800 50  0001 C CNN
	1    2400 3800
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5C80F14B
P 2650 4200
F 0 "C2" H 2558 4154 50  0000 R CNN
F 1 "4.4p" H 2558 4245 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2650 4200 50  0001 C CNN
F 3 "~" H 2650 4200 50  0001 C CNN
	1    2650 4200
	-1   0    0    1   
$EndComp
$Comp
L Device:L_Small L1
U 1 1 5C80F250
P 2100 4150
F 0 "L1" H 2060 4104 50  0000 R CNN
F 1 "18n" H 2060 4195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2100 4150 50  0001 C CNN
F 3 "~" H 2100 4150 50  0001 C CNN
	1    2100 4150
	-1   0    0    1   
$EndComp
$Comp
L Device:L_Small L3
U 1 1 5C80F2FF
P 2650 3600
F 0 "L3" H 2610 3554 50  0000 R CNN
F 1 "6.9n" H 2610 3645 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2650 3600 50  0001 C CNN
F 3 "~" H 2650 3600 50  0001 C CNN
	1    2650 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2500 3800 2650 3800
Wire Wire Line
	3000 3800 3000 3850
Wire Wire Line
	2500 4000 2650 4000
Wire Wire Line
	3000 4000 3000 3950
Wire Wire Line
	2650 4100 2650 4000
Connection ~ 2650 4000
Wire Wire Line
	2650 4000 3000 4000
Wire Wire Line
	2650 3800 2650 3700
Connection ~ 2650 3800
Wire Wire Line
	2650 3800 3000 3800
Wire Wire Line
	2300 4000 2200 4000
Wire Wire Line
	2200 4000 2200 3900
Wire Wire Line
	2200 3800 2300 3800
Wire Wire Line
	2100 3900 2200 3900
Connection ~ 2200 3900
Wire Wire Line
	2200 3900 2200 3800
Wire Wire Line
	2100 4050 2100 3900
$Comp
L power:+5V #PWR05
U 1 1 5C810EDA
P 3400 3050
F 0 "#PWR05" H 3400 2900 50  0001 C CNN
F 1 "+5V" H 3415 3223 50  0000 C CNN
F 2 "" H 3400 3050 50  0001 C CNN
F 3 "" H 3400 3050 50  0001 C CNN
	1    3400 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5C810F0E
P 3600 3250
F 0 "C4" H 3692 3296 50  0000 L CNN
F 1 "0.01p" H 3692 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3600 3250 50  0001 C CNN
F 3 "~" H 3600 3250 50  0001 C CNN
	1    3600 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5C812E4A
P 3950 3250
F 0 "C6" H 4042 3296 50  0000 L CNN
F 1 "2.2u" H 4042 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3950 3250 50  0001 C CNN
F 3 "~" H 3950 3250 50  0001 C CNN
	1    3950 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5C8134D5
P 3600 3350
F 0 "#PWR06" H 3600 3100 50  0001 C CNN
F 1 "GND" H 3605 3177 50  0000 C CNN
F 2 "" H 3600 3350 50  0001 C CNN
F 3 "" H 3600 3350 50  0001 C CNN
	1    3600 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5C813506
P 3950 3350
F 0 "#PWR08" H 3950 3100 50  0001 C CNN
F 1 "GND" H 3955 3177 50  0000 C CNN
F 2 "" H 3950 3350 50  0001 C CNN
F 3 "" H 3950 3350 50  0001 C CNN
	1    3950 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3500 3500 3450
Wire Wire Line
	3500 3450 3400 3450
Connection ~ 3400 3450
Wire Wire Line
	3400 3450 3400 3500
Wire Wire Line
	3400 3450 3300 3450
Wire Wire Line
	3300 3450 3300 3500
$Comp
L power:GND #PWR03
U 1 1 5C816487
P 2650 4300
F 0 "#PWR03" H 2650 4050 50  0001 C CNN
F 1 "GND" H 2655 4127 50  0000 C CNN
F 2 "" H 2650 4300 50  0001 C CNN
F 3 "" H 2650 4300 50  0001 C CNN
	1    2650 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5C8164B8
P 2100 4250
F 0 "#PWR01" H 2100 4000 50  0001 C CNN
F 1 "GND" H 2105 4077 50  0000 C CNN
F 2 "" H 2100 4250 50  0001 C CNN
F 3 "" H 2100 4250 50  0001 C CNN
	1    2100 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5C8164E9
P 2600 3400
F 0 "#PWR02" H 2600 3150 50  0001 C CNN
F 1 "GND" V 2605 3272 50  0000 R CNN
F 2 "" H 2600 3400 50  0001 C CNN
F 3 "" H 2600 3400 50  0001 C CNN
	1    2600 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	2650 3500 2650 3400
Wire Wire Line
	2650 3400 2600 3400
$Comp
L Device:C_Small C8
U 1 1 5C8182DE
P 4550 3950
F 0 "C8" V 4400 3950 50  0000 C CNN
F 1 "11p" V 4300 3950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4550 3950 50  0001 C CNN
F 3 "~" H 4550 3950 50  0001 C CNN
	1    4550 3950
	0    -1   -1   0   
$EndComp
$Comp
L Device:L_Small L5
U 1 1 5C8184C4
P 4550 3750
F 0 "L5" V 4735 3750 50  0000 C CNN
F 1 "320n" V 4644 3750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4550 3750 50  0001 C CNN
F 3 "~" H 4550 3750 50  0001 C CNN
	1    4550 3750
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5C81869A
P 4200 3700
F 0 "C7" V 3971 3700 50  0000 C CNN
F 1 "11p" V 4062 3700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4200 3700 50  0001 C CNN
F 3 "~" H 4200 3700 50  0001 C CNN
	1    4200 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	3400 3050 3400 3100
Wire Wire Line
	4100 3700 4000 3700
Wire Wire Line
	3400 3100 3600 3100
Wire Wire Line
	3950 3100 3950 3150
Connection ~ 3400 3100
Wire Wire Line
	3400 3100 3400 3450
Wire Wire Line
	3600 3150 3600 3100
Connection ~ 3600 3100
Wire Wire Line
	3600 3100 3950 3100
$Comp
L Device:L_Small L4
U 1 1 5C81A3AA
P 4200 4100
F 0 "L4" H 4247 4146 50  0000 L CNN
F 1 "320n" H 4247 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4200 4100 50  0001 C CNN
F 3 "~" H 4200 4100 50  0001 C CNN
	1    4200 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Small L6
U 1 1 5C81A945
P 4850 4100
F 0 "L6" H 4897 4146 50  0000 L CNN
F 1 "320n" H 4897 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4850 4100 50  0001 C CNN
F 3 "~" H 4850 4100 50  0001 C CNN
	1    4850 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 5C81AA56
P 5050 3850
F 0 "C10" V 4821 3850 50  0000 C CNN
F 1 "0.1u" V 4912 3850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5050 3850 50  0001 C CNN
F 3 "~" H 5050 3850 50  0001 C CNN
	1    5050 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 3950 4750 3950
Wire Wire Line
	4750 3950 4750 3850
Wire Wire Line
	4750 3850 4850 3850
Wire Wire Line
	4650 3750 4750 3750
Wire Wire Line
	4750 3750 4750 3850
Connection ~ 4750 3850
Wire Wire Line
	4850 4000 4850 3850
Connection ~ 4850 3850
Wire Wire Line
	4850 3850 4950 3850
$Comp
L Device:C_Small C9
U 1 1 5C81F353
P 4550 4500
F 0 "C9" H 4458 4454 50  0000 R CNN
F 1 "2.2u" H 4458 4545 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4550 4500 50  0001 C CNN
F 3 "~" H 4550 4500 50  0001 C CNN
	1    4550 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4200 4200 4200 4300
Wire Wire Line
	4200 4300 4550 4300
Wire Wire Line
	4850 4200 4850 4300
Wire Wire Line
	4850 4300 4550 4300
Connection ~ 4550 4300
Wire Wire Line
	4550 4300 4550 4400
Wire Wire Line
	4300 3700 4300 3750
Wire Wire Line
	4300 3750 4450 3750
Wire Wire Line
	4300 3750 4300 3800
Wire Wire Line
	4300 3800 3950 3800
Connection ~ 4300 3750
Wire Wire Line
	4450 3950 4300 3950
Wire Wire Line
	4300 3950 4300 3900
Wire Wire Line
	4300 3900 4200 3900
Wire Wire Line
	4200 3900 4200 4000
Connection ~ 4200 3900
Wire Wire Line
	4200 3900 3950 3900
$Comp
L power:GND #PWR010
U 1 1 5C826C5D
P 4550 4600
F 0 "#PWR010" H 4550 4350 50  0001 C CNN
F 1 "GND" H 4555 4427 50  0000 C CNN
F 2 "" H 4550 4600 50  0001 C CNN
F 3 "" H 4550 4600 50  0001 C CNN
	1    4550 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5C826C9C
P 3600 4450
F 0 "C5" H 3508 4404 50  0000 R CNN
F 1 "100p" H 3508 4495 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3600 4450 50  0001 C CNN
F 3 "~" H 3600 4450 50  0001 C CNN
	1    3600 4450
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5C826FA2
P 3300 4450
F 0 "C3" H 3208 4404 50  0000 R CNN
F 1 "100p" H 3208 4495 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3300 4450 50  0001 C CNN
F 3 "~" H 3300 4450 50  0001 C CNN
	1    3300 4450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3300 4350 3400 4350
Wire Wire Line
	3400 4350 3400 4300
Wire Wire Line
	3500 4300 3500 4350
Wire Wire Line
	3500 4350 3600 4350
$Comp
L power:GND #PWR04
U 1 1 5C829766
P 3300 4550
F 0 "#PWR04" H 3300 4300 50  0001 C CNN
F 1 "GND" H 3305 4377 50  0000 C CNN
F 2 "" H 3300 4550 50  0001 C CNN
F 3 "" H 3300 4550 50  0001 C CNN
	1    3300 4550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J2
U 1 1 5C830A61
P 3600 4950
F 0 "J2" V 3483 5051 50  0000 L CNN
F 1 "LO1" V 3574 5051 50  0000 L CNN
F 2 "footprints:SMA-EDGE-16" H 3600 4950 50  0001 C CNN
F 3 " ~" H 3600 4950 50  0001 C CNN
	1    3600 4950
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5C830CDA
P 3900 5000
F 0 "#PWR07" H 3900 4750 50  0001 C CNN
F 1 "GND" H 3905 4827 50  0000 C CNN
F 2 "" H 3900 5000 50  0001 C CNN
F 3 "" H 3900 5000 50  0001 C CNN
	1    3900 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 5000 3900 4950
Wire Wire Line
	3900 4950 3800 4950
Wire Wire Line
	3600 4750 3600 4550
$Comp
L Connector:Conn_Coaxial J3
U 1 1 5C8BE635
P 5600 3850
F 0 "J3" H 5699 3826 50  0000 L CNN
F 1 "RF-OUT" H 5699 3735 50  0000 L CNN
F 2 "footprints:SMA-EDGE-16" H 5600 3850 50  0001 C CNN
F 3 " ~" H 5600 3850 50  0001 C CNN
	1    5600 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5C8C33F5
P 5600 4050
F 0 "#PWR011" H 5600 3800 50  0001 C CNN
F 1 "GND" H 5605 3877 50  0000 C CNN
F 2 "" H 5600 4050 50  0001 C CNN
F 3 "" H 5600 4050 50  0001 C CNN
	1    5600 4050
	1    0    0    -1  
$EndComp
$Comp
L chain:LP3985IM5-5.0 U2
U 1 1 5C8C4CF9
P 8250 3250
F 0 "U2" H 8225 3575 50  0000 C CNN
F 1 "LP3985IM5-5.0" H 8225 3484 50  0000 C CNN
F 2 "LP3985IM5-5.0:SOT95P300X120-5N" H 8200 3250 50  0001 C CNN
F 3 "" H 8200 3250 50  0001 C CNN
	1    8250 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 5C8C7BA2
P 8550 3550
F 0 "C12" H 8800 3500 50  0000 R CNN
F 1 "0.01u" H 8850 3600 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8550 3550 50  0001 C CNN
F 3 "~" H 8550 3550 50  0001 C CNN
	1    8550 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C13
U 1 1 5C8C7C8A
P 8700 3250
F 0 "C13" H 8608 3204 50  0000 R CNN
F 1 "2.2u" H 8608 3295 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8700 3250 50  0001 C CNN
F 3 "~" H 8700 3250 50  0001 C CNN
	1    8700 3250
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C11
U 1 1 5C8C7D34
P 7550 3350
F 0 "C11" H 7642 3396 50  0000 L CNN
F 1 "2.2u" H 7642 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7550 3350 50  0001 C CNN
F 3 "~" H 7550 3350 50  0001 C CNN
	1    7550 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3250 7550 3150
Wire Wire Line
	7950 3350 7800 3350
Wire Wire Line
	7800 3350 7800 3150
Connection ~ 7800 3150
Wire Wire Line
	7800 3150 7950 3150
$Comp
L power:GND #PWR014
U 1 1 5C8DC1A4
P 7900 3450
F 0 "#PWR014" H 7900 3200 50  0001 C CNN
F 1 "GND" H 7905 3277 50  0000 C CNN
F 2 "" H 7900 3450 50  0001 C CNN
F 3 "" H 7900 3450 50  0001 C CNN
	1    7900 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3250 7900 3250
Wire Wire Line
	7900 3250 7900 3450
$Comp
L power:GND #PWR015
U 1 1 5C8E1E10
P 8550 3650
F 0 "#PWR015" H 8550 3400 50  0001 C CNN
F 1 "GND" H 8555 3477 50  0000 C CNN
F 2 "" H 8550 3650 50  0001 C CNN
F 3 "" H 8550 3650 50  0001 C CNN
	1    8550 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5C8E1E8F
P 8700 3350
F 0 "#PWR017" H 8700 3100 50  0001 C CNN
F 1 "GND" H 8705 3177 50  0000 C CNN
F 2 "" H 8700 3350 50  0001 C CNN
F 3 "" H 8700 3350 50  0001 C CNN
	1    8700 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 3150 8700 3150
Wire Wire Line
	8500 3350 8550 3350
Wire Wire Line
	8550 3350 8550 3450
$Comp
L power:GND #PWR013
U 1 1 5C8EDC3E
P 7550 3450
F 0 "#PWR013" H 7550 3200 50  0001 C CNN
F 1 "GND" H 7555 3277 50  0000 C CNN
F 2 "" H 7550 3450 50  0001 C CNN
F 3 "" H 7550 3450 50  0001 C CNN
	1    7550 3450
	1    0    0    -1  
$EndComp
Text GLabel 7800 2950 1    50   Input ~ 0
VDD
Wire Wire Line
	7550 3150 7800 3150
Wire Wire Line
	7800 3150 7800 2950
$Comp
L power:+5V #PWR09
U 1 1 5C92E493
P 4850 4300
F 0 "#PWR09" H 4850 4150 50  0001 C CNN
F 1 "+5V" V 4865 4428 50  0000 L CNN
F 2 "" H 4850 4300 50  0001 C CNN
F 3 "" H 4850 4300 50  0001 C CNN
	1    4850 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 3900 2100 3900
Connection ~ 2100 3900
$Comp
L power:+5V #PWR016
U 1 1 5C947C02
P 8700 3000
F 0 "#PWR016" H 8700 2850 50  0001 C CNN
F 1 "+5V" H 8715 3173 50  0000 C CNN
F 2 "" H 8700 3000 50  0001 C CNN
F 3 "" H 8700 3000 50  0001 C CNN
	1    8700 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3150 8700 3000
Connection ~ 8700 3150
$Comp
L Connector:Conn_Coaxial J1
U 1 1 5C825D23
P 1550 3900
F 0 "J1" H 1649 3876 50  0000 L CNN
F 1 "RF-IN" H 1649 3785 50  0000 L CNN
F 2 "footprints:SMA-EDGE-16" H 1550 3900 50  0001 C CNN
F 3 " ~" H 1550 3900 50  0001 C CNN
	1    1550 3900
	-1   0    0    -1  
$EndComp
Text GLabel 6800 4850 3    50   Input ~ 0
VDD
$Comp
L Connector:Conn_01x01_Female J4
U 1 1 5C829AAA
P 6800 4500
F 0 "J4" V 6740 4412 50  0000 R CNN
F 1 "VDD" V 6649 4412 50  0000 R CNN
F 2 "Connector_Wire:SolderWirePad_1x01_Drill0.8mm" H 6800 4500 50  0001 C CNN
F 3 "~" H 6800 4500 50  0001 C CNN
	1    6800 4500
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J5
U 1 1 5C829C13
P 7200 4500
F 0 "J5" V 7140 4412 50  0000 R CNN
F 1 "GND" V 7049 4412 50  0000 R CNN
F 2 "Connector_Wire:SolderWirePad_1x01_Drill0.8mm" H 7200 4500 50  0001 C CNN
F 3 "~" H 7200 4500 50  0001 C CNN
	1    7200 4500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5C829C67
P 7200 4850
F 0 "#PWR012" H 7200 4600 50  0001 C CNN
F 1 "GND" H 7205 4677 50  0000 C CNN
F 2 "" H 7200 4850 50  0001 C CNN
F 3 "" H 7200 4850 50  0001 C CNN
	1    7200 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 4850 7200 4700
Wire Wire Line
	6800 4850 6800 4700
Wire Wire Line
	5150 3850 5400 3850
$Comp
L power:GND #PWR0101
U 1 1 5C81EC8F
P 1550 4150
F 0 "#PWR0101" H 1550 3900 50  0001 C CNN
F 1 "GND" H 1555 3977 50  0000 C CNN
F 2 "" H 1550 4150 50  0001 C CNN
F 3 "" H 1550 4150 50  0001 C CNN
	1    1550 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4150 1550 4100
Connection ~ 4850 4300
$Comp
L power:GND #PWR0102
U 1 1 5C820B91
P 4000 4200
F 0 "#PWR0102" H 4000 3950 50  0001 C CNN
F 1 "GND" H 4005 4027 50  0000 C CNN
F 2 "" H 4000 4200 50  0001 C CNN
F 3 "" H 4000 4200 50  0001 C CNN
	1    4000 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3700 4000 4000
Connection ~ 4000 3700
Wire Wire Line
	4000 3700 3950 3700
Wire Wire Line
	3950 4100 4000 4100
Connection ~ 4000 4100
Wire Wire Line
	4000 4100 4000 4200
Wire Wire Line
	3950 4000 4000 4000
Connection ~ 4000 4000
Wire Wire Line
	4000 4000 4000 4100
$EndSCHEMATC
