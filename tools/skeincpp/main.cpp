#include "threefish.h"
#include "util.h"

int main ()
{
  uint64_t target[16];
  uint64_t key[17];
  uint64_t tweak[3];
  uint64_t plaintext[16];
  uint64_t ciphertext[16];
  uint64_t outputtext[16];
  Threefish tf;

  // xkcd target
  target[15] = 0x5b4da95f5fa08280;
  target[14] = 0xfc9879df44f418c8;
  target[13] = 0xf9f12ba424b7757d;
  target[12] = 0xe02bbdfbae0d4c4f;
  target[11] = 0xdf9317c80cc5fe04;
  target[10] = 0xc6429073466cf297;
  target[9] = 0x06b8c25999ddd2f6;
  target[8] = 0x540d4475cc977b87;
  target[7] = 0xf4757be023f19b8f;
  target[6] = 0x4035d7722886b788;
  target[5] = 0x69826de916a79cf9;
  target[4] = 0xc94cc79cd4347d24;
  target[3] = 0xb567aa3e2390a573;
  target[2] = 0xa373a48a5e676640;
  target[1] = 0xc79cc70197e1c5e7;
  target[0] = 0xf902fb53ca1858b6;

  // Skein-1024-1024 Initial value from skein_iv.h
  key[0] = 0XD593DA0741E72355;
  key[1] = 0X15B5E511AC73E00C;
  key[2] = 0X5180E5AEBAF2C4F0;
  key[3] = 0X03BD41D3FCBCAFAF;
  key[4] = 0X1CAEC6FD1983A898;
  key[5] = 0X6E510B8BCDD0589F;
  key[6] = 0x77E2BDFDC6394ADA;
  key[7] = 0xC11E1DB524DCB0A3;
  key[8] = 0xD6D14AF9C6329AB5;
  key[9] = 0x6A9B0BFC6EB67E0D;
  key[10] = 0x9243C60DCCFF1332;
  key[11] = 0x1A1F1DDE743F02D4;
  key[12] = 0x0996753C10ED0BB8;
  key[13] = 0x6572DD22F2B4969A;
  key[14] = 0x61FD3062D00A579A;
  key[15] = 0x1DE0536E8682E539;

  tweak[0] = 19; // 64 byte plaintext used
  tweak[1] = 0xF000000000000000; // First = 1, Final = 1, and Type = Message

  // Plaintext
  // A = Nonce, B = Core ID
  plaintext[0] = 0x4141414141414141;
  plaintext[1] = 0x4141414141414141;
  plaintext[2] = 0x0000000000424242;
  for (int i = 3; i < 16; i++)
    plaintext[i] = 0;

  // msg pass
  tf.Encrypt(key, tweak, plaintext, ciphertext);

  for (int i = 0; i < 16; i++)
    key[i] = ciphertext[i];

  tweak[0] = 8;
  tweak[1] = 0xFF00000000000000; // First = 1, Final = 1, and Type = Output

  for (int i = 0; i < 16; i++)
    plaintext[i] = 0;

  tf.Encrypt(key, tweak, plaintext, ciphertext);

  print_hex(ciphertext, 16);

  return 0;
}
