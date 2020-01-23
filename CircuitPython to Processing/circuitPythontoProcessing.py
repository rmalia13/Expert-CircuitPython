import time
import board
import busio
from analogio import AnalogIn

potentiometer = AnalogIn(board.A1)
uart = busio.UART(board.TX, board.RX, baudrate=9600)

while True:
    myPotValue = int(potentiometer.value/256)
    uart.write(bytes([myPotValue]))
    print(bytes([myPotValue]))
    time.sleep(0.25)