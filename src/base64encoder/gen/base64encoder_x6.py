f = open("base64encoder_x6.txt", "w")

for i in range(8):
    f.write("base64encoder base64encoder{} (\n".format(i))
    f.write("  .input_i(input_i[{}:{}]),\n".format(6*i + 5, 6*i))
    f.write("  .output_o(output_o[{}:{}])\n".format(8*i + 7, 8*i))
    f.write(");\n\n")

f.close()
