#!.usr/bin/python
import Adafruit_BBIO.UART as UART
import serial

UART.setup("UART2")

ser = serial.Serial(port = "/dev/ttyO1", baurate=9600)

x = ser.read(1200)
print x

ser.close()
UART.cleanup()
