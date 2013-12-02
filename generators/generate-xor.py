import sys

sys.stdout.write("extension_d = ")

for i in range(15, 0, -1):
    print "block_cipher_key [" + str((i+1)*64-1) + ":" + str(i*64) + "] ^"
