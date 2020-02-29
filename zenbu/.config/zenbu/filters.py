import struct

# Hex to X

def nohash(hex):
  return hex.lstrip('#')

def to_rgb(hex):
  return struct.unpack('BBB', nohash(hex).decode('hex'))

def to_hex(hex):
  return "0x{}".format(nohash(hex))
