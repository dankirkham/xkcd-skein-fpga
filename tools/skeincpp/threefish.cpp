#include "threefish.h"

void Threefish::Extend (const int count, uint64_t words[])
{
  words[count] = 0x1BD11BDAA9FC1A22;

  for (int i = 0; i < count; i++)
    words[count] = words[count] ^ words[i];
}

void Threefish::GenerateSubkeys (const uint64_t key[],
				 const uint64_t tweak[],
				 uint64_t subkeys[])
{
  for (int s = 0; s < 21; s++)
    {
      for (int i = 0; i <= 12; i++)
	subkeys[s*16 + i] = key[(s + i) % 17];
      subkeys[s*16 + 13] = key[(s + 13) % 17] + tweak[s % 3];
      subkeys[s*16 + 14] = key[(s + 14) % 17] + tweak[(s + 1) % 3];
      subkeys[s*16 + 15] = key[(s + 15) % 17] + s;
    }
}

int Threefish::RotationConstant (const int j, const int d)
{
  switch (d % 8)
    {
    case 0:
      switch (j)
	{
	case 0:
	  return 24;
	case 1:
	  return 13;
	case 2:
	  return 8;
	case 3:
	  return 47;
	case 4:
	  return 8;
	case 5:
	  return 17;
	case 6:
	  return 22;
	case 7:
	  return 37;
	}
    case 1:
      switch (j)
	{
	case 0:
	  return 38;
	case 1:
	  return 19;
	case 2:
	  return 10;
	case 3:
	  return 55;
	case 4:
	  return 49;
	case 5:
	  return 18;
	case 6:
	  return 23;
	case 7:
	  return 52;
	}
    case 2:
      switch (j)
	{
	case 0:
	  return 33;
	case 1:
	  return 4;
	case 2:
	  return 51;
	case 3:
	  return 13;
	case 4:
	  return 34;
	case 5:
	  return 41;
	case 6:
	  return 59;
	case 7:
	  return 17;
	}
    case 3:
      switch (j)
	{
	case 0:
	  return 5;
	case 1:
	  return 20;
	case 2:
	  return 48;
	case 3:
	  return 41;
	case 4:
	  return 47;
	case 5:
	  return 28;
	case 6:
	  return 16;
	case 7:
	  return 25;
	}
    case 4:
      switch (j)
	{
	case 0:
	  return 41;
	case 1:
	  return 9;
	case 2:
	  return 37;
	case 3:
	  return 31;
	case 4:
	  return 12;
	case 5:
	  return 47;
	case 6:
	  return 44;
	case 7:
	  return 30;
	}
    case 5:
      switch (j)
	{
	case 0:
	  return 16;
	case 1:
	  return 34;
	case 2:
	  return 56;
	case 3:
	  return 51;
	case 4:
	  return 4;
	case 5:
	  return 53;
	case 6:
	  return 42;
	case 7:
	  return 41;
	}
    case 6:
      switch (j)
	{
	case 0:
	  return 31;
	case 1:
	  return 44;
	case 2:
	  return 47;
	case 3:
	  return 46;
	case 4:
	  return 19;
	case 5:
	  return 42;
	case 6:
	  return 44;
	case 7:
	  return 25;
	}
    case 7:
      switch (j)
	{
	case 0:
	  return 9;
	case 1:
	  return 48;
	case 2:
	  return 35;
	case 3:
	  return 52;
	case 4:
	  return 23;
	case 5:
	  return 31;
	case 6:
	  return 37;
	case 7:
	  return 20;
	}
    }
}

void Threefish::Mix (const int j,
		     const int d,
		     const uint64_t& x0,
		     const uint64_t& x1,
		     uint64_t& y0,
		     uint64_t& y1)
{
  y0 = x0 + x1;
  uint64_t x1l = x1 << RotationConstant(j, d);
  uint64_t x1r = x1 >> (64 - RotationConstant(j, d));
  uint64_t x1o = x1l | x1r;
  y1 = x1o ^ y0;
}

void Threefish::Permute (const uint64_t input[],
			 uint64_t output[])
{
  output[0] = input[0];
  output[1] = input[9];
  output[2] = input[2];
  output[3] = input[13];
  output[4] = input[6];
  output[5] = input[11];
  output[6] = input[4];
  output[7] = input[15];
  output[8] = input[10];
  output[9] = input[7];
  output[10] = input[12];
  output[11] = input[3];
  output[12] = input[14];
  output[13] = input[5];
  output[14] = input[8];
  output[15] = input[1];
}

void Threefish::Encrypt (uint64_t key[],
			 uint64_t tweak[],
			 uint64_t plaintext[],
			 uint64_t ciphertext[])
{
  Extend(16, key);

  tweak[2] = tweak[0] ^ tweak[1];

  // Generate subkeys
  // subkey array size is 21 * 16 = 336;
  uint64_t subkeys[336];
  GenerateSubkeys(key, tweak, subkeys);

  // Initialize encryption state
  uint64_t state[16];
  for (int i = 0; i < 16; i++)
    state[i] = plaintext[i];

  uint64_t nextState[16];

  // Compute 80 rounds
  for (int d = 0; d < 80; d++)
    {
      // Add subkey
      if (d % 4 == 0)
	{
	  for (int i = 0; i < 16; i++)
	    {
	      nextState[i] = state[i] + subkeys[(d / 4) * 16 + i];
	    }
	}
      else
	// Copying is not fast!
	for (int i = 0; i < 16; i++)
	  {
	    nextState[i] = state[i];
	  }

      // Call mix function
      for (int j = 0; j < 8; j++)
	Mix(j,
	    d,
	    nextState[2*j],
	    nextState[2*j+1],
	    state[2*j],
	    state[2*j+1]);

      // Call permute function
      Permute(state, nextState);

      // Lazy copy
      for (int i = 0; i < 16; i++)
	{
	  state[i] = nextState[i];
	}

    }


  // Print subkeys
  // cout << "Subkeys: " << endl;
  // for (int s = 0; s < 21; s++)
  //   {
  //     cout << s << endl;
  //     for (int i = 0; i < 16; i++)
	// {
	//   stringstream ss;
	//   ss << hex << subkeys[s*16 + i];
	//   string s = ss.str();
	//   for (int n = s.length(); n < 16; n++)
	//     cout << '0';
	//   cout << s;
	//   cout << endl;
	// }
  //     cout << endl;
  //   }
  // cout << endl;


  //cout << "Ciphertext: " << endl;
  for (int i = 0; i < 16; i++)
    ciphertext[i] = (state[i] + subkeys[16*20 + i]) ^ plaintext[i];
}

Threefish::Threefish ()
{
  //
}
