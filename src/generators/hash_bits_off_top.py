iterations = 1024 / 4
powers_of_2 = [2, 4, 8, 16, 32, 64]

f = open("hash_bits_off_top.v", 'w')

f.write("module hash_bits_off_top (\n")
f.write("\tinput [1023:0] hash_xor_i,\n")
f.write("\toutput [9:0] hash_bits_off_o\n")
f.write(");\n\n")
f.write("wire [767:0] stage1_output;\n")
f.write("wire [511:0] stage2_output;\n")
f.write("wire [319:0] stage3_output;\n\n")

for i in range(0,iterations):
    f.write("hash_bits_off_lut_stage1 hash_bits_off_lut_stage1_%i (\n" % i)
    f.write("\t.four_bits_i(hash_xor_i[%i:%i]),\n" % (((i+1)*4)-1, i*4))
    f.write("\t.three_bits_o(stage1_output[%i:%i])\n" % (((i+1)*3)-1, i*3))
    f.write(");\n\n")

for i in range(0,iterations / 2):
    f.write("hash_bits_off_lut_stage2 hash_bits_off_lut_stage2_%i (\n" % i)
    f.write("\t.six_bits_i(stage1_output[%i:%i]),\n" % (((i+1)*6)-1, i*6))
    f.write("\t.four_bits_o(stage2_output[%i:%i])\n" % (((i+1)*4)-1, i*4))
    f.write(");\n\n")

for i in range(0,iterations / 4):
    f.write("hash_bits_off_lut_stage3 hash_bits_off_lut_stage3_%i (\n" % i)
    f.write("\t.eight_bits_i(stage2_output[%i:%i]),\n" % (((i+1)*8)-1, i*8))
    f.write("\t.five_bits_o(stage3_output[%i:%i])\n" % (((i+1)*5)-1, i*5))
    f.write(");\n\n")

f.write("assign hash_bits_off_o = ")
for i in range(0, 64):
    for power in powers_of_2:
        if i % power == 0:
            f.write("(")

    f.write("stage3_output[%i:%i]" % (((i+1)*5)-1, i*5))

    for power in powers_of_2:
        if (i % power) == (power - 1):
            f.write(")")

    if i != 63:
        f.write("+")

f.write(";\n\n")
f.write("endmodule\n")

f.close()
