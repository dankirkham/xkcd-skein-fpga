from skein import SkeinGenerator

state_a = 0
state_b = 16

d = 2
j = 1
x0 = 0x7cf426fd60eab5b3
x1 = 0xe94a5b59a1742100
expected_y0 = 0x663e8257025ed6b3
expected_y1 = 0xf29b37cd151cc6bd

f = open("test/build/mix_test.asm", 'w+')

sg = SkeinGenerator(f)

sg.select_core()

f.write("// CoreSimInput {}\n".format(x0))
f.write("Constant 0\n")
f.write("Save {}\n".format(state_a + (2 * j)))
f.write("// CoreSimInput {}\n".format(x1))
f.write("Constant 0\n")
f.write("Save {}\n".format(state_a + (2 * j) + 1))

sg.calculate_mix(d, j, state_a, state_b)

sg.check_word_64(state_b + (2 * j), expected_y0)
sg.check_word_64(state_b + (2 * j) + 1, expected_y1)

f.close()
