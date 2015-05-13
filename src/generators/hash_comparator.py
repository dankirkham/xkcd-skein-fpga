f = open('hash_comparator_snippet.txt', 'w')

powers_of_2 = [2, 4, 8, 16, 32, 64, 128, 256, 512]

for i in range(0, 1024):
    for power in powers_of_2:
        if i % power == 0:
            f.write("(")

    f.write("hash_xor_i[%d]" % i)

    for power in powers_of_2:
        if (i % power) == (power - 1):
            f.write(")")

    if i != 1023:
        f.write("+")

f.close()
