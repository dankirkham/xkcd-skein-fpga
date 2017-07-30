# Load Base64 LUT from fie
with open("base64lut.txt") as f:
    symbols = [x.strip() for x in f.readlines()]

f = open("base64encoder.txt", "w")

for i in range(64):
    f.write('6\'d{}: output_o = "{}";\n'.format(i, symbols[i]))

f.close()
