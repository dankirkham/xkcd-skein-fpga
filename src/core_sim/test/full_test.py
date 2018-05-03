# Full test will test hashing, counting, and comparing at the same time.

from skein import SkeinGenerator, SkeinTypeValue

key = 0
tweak = 17
state = 20
nextstate = 37
best_nonce = 54
best_bits_off = 56
new_nonce = 57

f = open("test/build/full_test.asm", 'w+')

sg = SkeinGenerator(f)

sg.select_core()
sg.initialize_best_bits_off(best_bits_off)

sg.initialize_key(key)
sg.initialize_plaintext(state, SkeinTypeValue.MESSAGE, new_nonce=new_nonce)
sg.hash(key, tweak, state, nextstate, new_nonce)
sg.count_bits_off(key)
sg.compare_bits_off(best_nonce, best_bits_off, new_nonce)
sg.check_word_64(best_bits_off, 517)

f.close()
