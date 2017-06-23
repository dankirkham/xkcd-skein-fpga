f = open('read_mux.v', 'w')

cells = 256

for i in range(cells):
    if i == 0:
        f.write("if (address_i == 8'd%d) begin\n" % (i))
    else:
        f.write("end else if (address_i == 8'd%d) begin\n" % (i))

    f.write("  data_o = data_q[%d:%d];\n" % ((i + 1) * 16 - 1, i * 16))

    if i == cells - 1:
        f.write("end\n")

f.close()
