f = open('hash_comparator_snippet.txt', 'w')

for i in range(0, 1024):
    f.write("hash_xor_i[%d] + " % i)

f.close()
