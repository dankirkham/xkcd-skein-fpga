from skein import SkeinGenerator

state_ptr = 0
next_state_ptr = 16

expected_value = [
    0, 9, 2, 13, 6, 11, 4, 15, 10, 7, 12, 3, 14, 5, 8, 1
]

f = open("test/build/permute_test.asm", 'w')

sg = SkeinGenerator(f)

sg.select_core()

# Initialize array
for i in range(0, 16):
    f.write("// CoreSimInput {}\n".format(i))
    f.write("Constant 0\n")
    f.write("Save {}\n".format(i))

# Perform permutation
sg.calculate_permute(state_ptr, next_state_ptr)

# Check
for (position, value) in enumerate(expected_value):
    sg.check_word_64(position + next_state_ptr, value)

f.close()
