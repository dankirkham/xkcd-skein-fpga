from skein import skein1024


xkcd_words = [
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


def hash_to_integer_array(hash):
    hash_words = []

    for i in range(16):
        hash_word = int.from_bytes(
            hash[i * 8:i * 8 + 8], byteorder='little', signed=False
        )

        hash_words.append(hash_word)

    return hash_words


def find_hash(nonce, core_id):
    h = skein1024()
    h.update(nonce.to_bytes(16, "little"))
    h.update(core_id.to_bytes(3, "little"))

    return h.digest()


def find_bits_off(hash):
    hash_words = hash_to_integer_array(hash)

    bits_off = 0

    for hash_word, xkcd_word in zip(hash_words, xkcd_words):
        xor = hash_word ^ xkcd_word

        bits_off += bin(xor).count("1")

    return bits_off
