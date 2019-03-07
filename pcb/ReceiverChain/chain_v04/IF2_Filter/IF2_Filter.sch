EESchema Schematic File Version 4
LIBS:IF2_Filter-cache
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
L Connector:Conn_Coaxial J1
U 1 1 5C80AA0E
P 4050 1600
F 0 "J1" H 3980 1838 50  0000 C CNN
F 1 "RF-IN" H 3980 1747 50  0000 C CNN
F 2 "" H 4050 1600 50  0001 C CNN
F 3 " ~" H 4050 1600 50  0001 C CNN
	1    4050 1600
	-1   0    0    -1  
$EndComp
$Comp
L chain:NFL21SP106X1C3D U10
U 1 1 5C8BDC3B
P 4500 1650
F 0 "U10" H 4500 1925 50  0000 C CNN
F 1 "NFL21SP106X1C3D" H 4500 1834 50  0000 C CNN
F 2 "" H 4450 1650 50  0001 C CNN
F 3 "" H 4450 1650 50  0001 C CNN
	1    4500 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR047
U 1 1 5C8BE0D7
P 4450 1900
F 0 "#PWR047" H 4450 1650 50  0001 C CNN
F 1 "GND" H 4455 1727 50  0000 C CNN
F 2 "" H 4450 1900 50  0001 C CNN
F 3 "" H 4450 1900 50  0001 C CNN
	1    4450 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR048
U 1 1 5C8BE4BE
P 4550 1900
F 0 "#PWR048" H 4550 1650 50  0001 C CNN
F 1 "GND" H 4555 1727 50  0000 C CNN
F 2 "" H 4550 1900 50  0001 C CNN
F 3 "" H 4550 1900 50  0001 C CNN
	1    4550 1900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J7
U 1 1 5C8BE635
P 5150 1600
F 0 "J7" H 5249 1576 50  0000 L CNN
F 1 "RF-OUT" H 5249 1485 50  0000 L CNN
F 2 "" H 5150 1600 50  0001 C CNN
F 3 " ~" H 5150 1600 50  0001 C CNN
	1    5150 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1600 4750 1600
$Comp
L power:GND #PWR049
U 1 1 5C8C33F5
P 5150 1800
F 0 "#PWR049" H 5150 1550 50  0001 C CNN
F 1 "GND" H 5155 1627 50  0000 C CNN
F 2 "" H 5150 1800 50  0001 C CNN
F 3 "" H 5150 1800 50  0001 C CNN
	1    5150 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5C9CC46F
P 4050 1800
F 0 "#PWR02" H 4050 1550 50  0001 C CNN
F 1 "GND" H 4055 1627 50  0000 C CNN
F 2 "" H 4050 1800 50  0001 C CNN
F 3 "" H 4050 1800 50  0001 C CNN
	1    4050 1800
	1    0    0    -1  
$EndComp
$EndSCHEMATC