f = open('write_mux.v', 'w')

cells = 256

for i in range(cells):
    if i == 0:
        f.write("if (address_i == 8'd%d) begin\n" % (i))
    else:
        f.write("end else if (address_i == 8'd%d) begin\n" % (i))

    if i != 0:
        f.write("  data_d[%d:0] = data_q[%d:0];\n" % (
            i * 16 - 1,
            i * 16 - 1
        ))

    f.write("  data_d[%d:%d] = data_i;\n" % ((i + 1) * 16 - 1, i * 16))

    if i != cells - 1:
        f.write("  data_d[%d:%d] = data_q[%d:%d];\n" % (
            cells * 16 - 1,
            (i + 1) * 16,
            cells * 16 - 1,
            (i + 1) * 16
        ))

    if i == cells - 1:
        f.write("end\n")

    # if i == cells - 1:
    #     f.write("end else begin\n")
    #     f.write("  data_d[%d:0] = data_q[%d:0];\n" % (cells * 16 - 1, cells * 16 - 1))
    #     f.write("end\n")

f.close()
