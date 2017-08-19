from skein import SkeinGenerator, SkeinTypeValue

base_key_pointer = 0
base_tweak_pointer = 17
base_subkey_pointer = 20

expected_value = [
    0xd593da0741e72355,
    0x15b5e511ac73e00c,
    0x5180e5aebaf2c4f0,
    0x03bd41d3fcbcafaf,
    0x1caec6fd1983a898,
    0x6e510b8bcdd0589f,
    0x77e2bdfdc6394ada,
    0xc11e1db524dcb0a3,
    0xd6d14af9c6329ab5,
    0x6a9b0bfc6eb67e0d,
    0x9243c60dccff1332,
    0x1a1f1dde743f02d4,
    0x0996753c10ed0bb8,
    0x6572dd22f2b496ad,
    0x51fd3062d00a579a,
    0x1de0536e8682e539
]

f = open("test/build/subkey_test.asm", 'w')

sg = SkeinGenerator(f)

sg.select_core()
sg.initialize_key(base_key_pointer, base_key_pointer)
sg.initialize_tweak(base_tweak_pointer, base_tweak_pointer,
                    SkeinTypeValue.MESSAGE)
sg.calculate_key_extend(base_key_pointer)
sg.calculate_tweak_extend(base_tweak_pointer)

s = 0
for i in range(0, 16):
    sg.calculate_subkey_word(s, i, base_key_pointer, base_tweak_pointer)
    f.write("Save {}\n".format(base_subkey_pointer))
    sg.check_word_64(base_subkey_pointer, expected_value[i])

f.close()
