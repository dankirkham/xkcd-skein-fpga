f = open('read_mux8.v', 'w')

cells = 512

for i in range(cells):
    if i == 0:
        f.write("if (address_2_i == 9'd%d) begin\n" % (i))
    else:
        f.write("end else if (address_2_i == 9'd%d) begin\n" % (i))

    f.write("  data_2_o = data_q[%d:%d];\n" % ((i + 1) * 8 - 1, i * 8))

    if i == cells - 1:
        f.write("end\n")

f.close()
