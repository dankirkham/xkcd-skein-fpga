def toBinary(n):
    return ''.join(str(1 & int(n) >> i) for i in range(64)[::-1])

def toWord(n):
    if n == 1:
        return "one"
    elif n == 2:
        return "two"
    elif n == 3:
        return "three"
    elif n == 4:
        return "four"
    elif n == 5:
        return "five"
    elif n == 6:
        return "six"
    elif n == 7:
        return "seven"
    elif n == 8:
        return "eight"
    elif n == 9:
        return "nine"
    elif n == 10:
        return "ten"
    elif n == 11:
        return "eleven"
    elif n == 12:
        return "twelve"
    elif n == 13:
        return "thirteen"
    elif n == 14:
        return "fourteen"
    elif n == 15:
        return "fifteen"
    elif n == 16:
        return "sixteen"
    elif n == 17:
        return "seventeen"
    elif n == 18:
        return "eightteen"
    elif n == 19:
        return "nineteen"
    elif n == 20:
        return "twenty"

powers_of_2 = [2, 4, 8, 16, 32, 64, 128, 256, 512]

stage = 3
input_bits_total = (stage + 1) * 2
input_bits = input_bits_total / 2
output_bits = stage + 2
iterations = powers_of_2[output_bits - 3] + 1

f = open("hash_bits_off_lut_stage%i.v" % stage, 'w')

f.write("module hash_bits_off_lut_stage%i (\n" % stage)
f.write("\tinput [%i:0] %s_bits_i,\n" % (input_bits * 2 - 1, toWord(input_bits * 2)))
f.write("\toutput reg [%i:0] %s_bits_o\n" % (output_bits - 1, toWord(output_bits)))
f.write(");\n\n")
f.write("always @(*) begin\n")
f.write("\tcase (%s_bits_i)\n" % toWord(input_bits * 2))

for i in range(0, iterations):
    for j in range(0, iterations):
        if (i == (iterations - 1) and j == (iterations - 1)):
            f.write("\t\tdefault: %s_bits_o = %i'd%i;\n" % (toWord(output_bits), output_bits, i+j))
        else:
            f.write("\t\t%i'b%s%s: %s_bits_o = %i'd%i;\n" % (input_bits*2, toBinary(i)[-input_bits:], toBinary(j)[-input_bits:], toWord(output_bits), output_bits, i+j))

f.write("\tendcase\n")
f.write("end\n\n")
f.write("endmodule\n")

f.close()
