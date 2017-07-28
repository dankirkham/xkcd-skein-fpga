import argparse
import logging
import serial

def write_ram(serial_port, address, data):
    message = b'\x9A'
    message += address.to_bytes(1, byteorder='little') # Address byte
    message += b'\x01' # Write byte
    message += data.to_bytes(2, byteorder='little') # Two Data bytes

    logging.debug("Writing {} ({}) to RAM at Address {} ({})".format(data, hex(data), address, hex(address)))
    serial_port.write(message)

def read_ram(serial_port, address):
    message = b'\x9A'
    message += address.to_bytes(1, byteorder='little') # Address byte
    message += b'\x00' # Read byte

    serial_port.write(message)

    header_byte = serial_port.read(1)
    header = int.from_bytes(header_byte, byteorder='little')
    if header == 0x9A:
        logging.debug("Received correct header byte.")
    else:
        logging.error("Received incorrect header byte {} ({})".format(header, hex(header)))

    logging.debug("Reading from RAM at Address {} ({})".format(address, hex(address)))
    data_bytes = serial_port.read(2)
    data = int.from_bytes(data_bytes, byteorder='little')
    logging.debug("Read {} ({}) from RAM at Address {} ({})".format(data, hex(data), address, hex(address)))

    return data

parser = argparse.ArgumentParser()
parser.add_argument("port", help="The port you would like to use to talk to the FPGA. Usually looks like COM3 on Windows, /dev/ttyUSB1 on Linux, and /dev/cu.usbmodem143111 on MacOS.")
args = parser.parse_args()

logging.basicConfig(level=logging.DEBUG)

logging.debug("Opening serial port.")
serial_port = serial.Serial(args.port)
logging.debug("Opened serial port {}.".format(serial_port.name))

logging.info("Writing RAM")
for address in range(256):
    write_ram(serial_port, address, address * 256 + (256 - address))

fail = False
for address in range(256):
    data = read_ram(serial_port, address)
    expected = address * 256 + (256 - address)

    if data != expected:
        logging.error('Bad data read at address {}. Read {} but expected {}.'.format(address, data, expected))
        fail = True

if fail:
    logging.info("FAILURE")
else:
    logging.info("SUCCESS")

logging.debug("Closing {}".format(serial_port.name))
serial_port.close()
