f = open('test/build/bit_counter_test.asm', 'w')

f.write("// CoreSimInput 4342338\n")
f.write("SelectCore // Select the core\n\n")

words = [
    0x5b4da95f5fa08280,
    0xfc9879df44f418c8,
    0xf9f12ba424b7757d,
    0xe02bbdfbae0d4c4f,
    0xdf9317c80cc5fe04,
    0xc6429073466cf297,
    0x06b8c25999ddd2f6,
    0x540d4475cc977b87,
    0xf4757be023f19b8f,
    0x4035d7722886b788,
    0x69826de916a79cf9,
    0xc94cc79cd4347d24,
    0xb567aa3e2390a573,
    0xa373a48a5e676640,
    0xc79cc70197e1c5e7,
    0xf902fb53ca1858b6
]

expected_count = 0
for word in words:
    expected_count += bin(word).count("1")

# Place large value in Comparator Register so Bit Counter Register will pass
# through.
f.write("// CoreSimInput 1023\n")
f.write("Constant 0\n")
f.write("Save 1\n")
f.write("Load 1 Secondary\n")
f.write("SaveComparator // SaveComparator\n\n")

# Zero BitCounter Register
f.write("// CoreSimInput 0\n")
f.write("Constant 0\n")
f.write("SaveBitCounter // SaveBitCounter\n\n")

# Count all the bits
for word in words:
    f.write("// CoreSimInput {}\n".format(word))
    f.write("Constant 0\n")
    f.write("Count\n\n")

# SaveBitsOff, Rotate, and Assert
f.write("SaveBitsOff 0 // SaveBitsOff\n")
f.write("Load 0 Primary\n")
f.write("RotateLeft 48 0\n")
f.write("Read 0\n")
f.write("// CoreSimAssert {}\n".format(expected_count))

f.close()
