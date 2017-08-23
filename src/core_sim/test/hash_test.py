from skein import SkeinGenerator, SkeinTypeValue

key = 0
tweak = 17
state = 20
nextstate = 37

expected_value = [
    0xd5ff68909ad07bb0,
    0x34139128d6af518b,
    0x59efa8feec314b40,
    0x96e163d52fb379f9,
    0xef219342d38d3a4d,
    0x89bb52cc13a90583,
    0xea3d1f2f23ed6545,
    0xe87b9aa7b2bc36d8,
    0xfad0aca8fecb0a21,
    0x52ef503d6d8c64f9,
    0x93cbebbd598dcef2,
    0x5c7f6f7dd26fa565,
    0x870c73f160426e7e,
    0xa1d752a58d01bcfd,
    0x19db6f6db300c113,
    0x994ca58ddec3d814
]

f = open("test/build/hash_test.asm", 'w')

sg = SkeinGenerator(f)

sg.select_core()
sg.initialize_key(key, key)
sg.initialize_plaintext(state, SkeinTypeValue.MESSAGE)

sg.encrypt(key, tweak, state, nextstate, SkeinTypeValue.MESSAGE)

key, nextstate = nextstate, key
sg.initialize_plaintext(state, SkeinTypeValue.OUTPUT)

sg.encrypt(key, tweak, state, nextstate, SkeinTypeValue.OUTPUT)

# Check result
for (i, val) in enumerate(expected_value):
    sg.check_word_64(nextstate + i, val)

f.close()
