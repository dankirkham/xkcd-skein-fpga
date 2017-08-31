# Constants ROM
Constants ROM for storing constants used by the Hasher Core. These constants are
all loaded using the `Constant <Address>` assembly language instruction.

| Address    | Value              | Description                                         |
| ---------- | ------------------ | --------------------------------------------------- |
| 0x00       | 0                  | Subkey Counter 0; also for plaintext initialization |
| 0x01       | 1                  | Subkey Counter 1                                    |
| 0x02       | 2                  | Subkey Counter 2                                    |
| 0x03       | 3                  | Subkey Counter 3                                    |
| 0x04       | 4                  | Subkey Counter 4                                    |
| 0x05       | 5                  | Subkey Counter 5                                    |
| 0x06       | 6                  | Subkey Counter 6                                    |
| 0x07       | 7                  | Subkey Counter 7                                    |
| 0x08       | 8                  | Subkey Counter 8; also Output Tweak; Word 0         |
| 0x09       | 9                  | Subkey Counter 9                                    |
| 0x0A       | 10                 | Subkey Counter 10                                   |
| 0x0B       | 11                 | Subkey Counter 11                                   |
| 0x0C       | 12                 | Subkey Counter 12                                   |
| 0x0D       | 13                 | Subkey Counter 13                                   |
| 0x0E       | 14                 | Subkey Counter 14                                   |
| 0x0F       | 15                 | Subkey Counter 15                                   |
| 0x10       | 16                 | Subkey Counter 16                                   |
| 0x11       | 17                 | Subkey Counter 17                                   |
| 0x12       | 18                 | Subkey Counter 18                                   |
| 0x13       | 19                 | Subkey Counter 19; also Message Tweak; Word 0       |
| 0x14       | 20                 | Subkey Counter 20                                   |
| 0x15       | 21                 | Subkey Counter 21                                   |
| 0x16       | 0xF000000000000000 | Message Tweak; Word 1                               |
| 0x17       | 0xFF00000000000000 | Output Tweak; Word 1                                |
| 0x18       | 0x1BD11BDAA9FC1A22 | Key Extend Word                                     |
| 0x19       | 0xD593DA0741E72355 | Skein IV Key; Word 0                                |
| 0x1A       | 0x15B5E511AC73E00C | Skein IV Key; Word 1                                |
| 0x1B       | 0x5180E5AEBAF2C4F0 | Skein IV Key; Word 2                                |
| 0x1C       | 0x03BD41D3FCBCAFAF | Skein IV Key; Word 3                                |
| 0x1D       | 0x1CAEC6FD1983A898 | Skein IV Key; Word 4                                |
| 0x1E       | 0x6E510B8BCDD0589F | Skein IV Key; Word 5                                |
| 0x1F       | 0x77E2BDFDC6394ADA | Skein IV Key; Word 6                                |
| 0x20       | 0xC11E1DB524DCB0A3 | Skein IV Key; Word 7                                |
| 0x21       | 0xD6D14AF9C6329AB5 | Skein IV Key; Word 8                                |
| 0x22       | 0x6A9B0BFC6EB67E0D | Skein IV Key; Word 9                                |
| 0x23       | 0x9243C60DCCFF1332 | Skein IV Key; Word 10                               |
| 0x24       | 0x1A1F1DDE743F02D4 | Skein IV Key; Word 11                               |
| 0x25       | 0x0996753C10ED0BB8 | Skein IV Key; Word 12                               |
| 0x26       | 0x6572DD22F2B4969A | Skein IV Key; Word 13                               |
| 0x27       | 0x61FD3062D00A579A | Skein IV Key; Word 14                               |
| 0x28       | 0x1DE0536E8682E539 | Skein IV Key; Word 15                               |
| 0x29       | 0x5b4da95f5fa08280 | XKCD Target; Word 0                                 |
| 0x2A       | 0xfc9879df44f418c8 | XKCD Target; Word 1                                 |
| 0x2B       | 0xf9f12ba424b7757d | XKCD Target; Word 2                                 |
| 0x2C       | 0xe02bbdfbae0d4c4f | XKCD Target; Word 3                                 |
| 0x2D       | 0xdf9317c80cc5fe04 | XKCD Target; Word 4                                 |
| 0x2E       | 0xc6429073466cf297 | XKCD Target; Word 5                                 |
| 0x2F       | 0x06b8c25999ddd2f6 | XKCD Target; Word 6                                 |
| 0x30       | 0x540d4475cc977b87 | XKCD Target; Word 7                                 |
| 0x31       | 0xf4757be023f19b8f | XKCD Target; Word 8                                 |
| 0x32       | 0x4035d7722886b788 | XKCD Target; Word 9                                 |
| 0x33       | 0x69826de916a79cf9 | XKCD Target; Word 10                                |
| 0x34       | 0xc94cc79cd4347d24 | XKCD Target; Word 11                                |
| 0x35       | 0xb567aa3e2390a573 | XKCD Target; Word 12                                |
| 0x36       | 0xa373a48a5e676640 | XKCD Target; Word 13                                |
| 0x37       | 0xc79cc70197e1c5e7 | XKCD Target; Word 14                                |
| 0x38       | 0xf902fb53ca1858b6 | XKCD Target; Word 15                                |
| 0x39       | 1023               | best_bits_off initial value (max value possible)    |

## Useful Aliases
| Address | Alias                       |
| ------- | --------------------------- |
| 0x08    | OUTPUT_TWEAK_0              |
| 0x17    | OUTPUT_TWEAK_1              |
| 0x13    | MESSAGE_TWEAK_0             |
| 0x16    | MESSAGE_TWEAK_1             |
| 0x18    | KEY_EXTEND                  |
| 0x19    | SKEIN_IV                    |
| 0x29    | XKCD                        |
| 0x39    | BEST_BITS_OFF_MAX           |
