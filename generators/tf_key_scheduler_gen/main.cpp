#include <iostream>

using namespace std;

int main()
{
  for (int s = 0; s < 21; s++)
    {
      if (s == 0)
	cout << "if (key == 0) begin" << endl;
      else
	cout << "end else if (key == " << s << ") begin" << endl;

      for (int i = 0; i <= 12; i++)
	{
	  cout << "subkey[" << (i+1)*64-1 << ":" << i*64 << "] = key["
	       << ((s + i) % 17 + 1)*64-1 << ":" << ((s + i) % 17 )*64
	       << "];" << endl;
	}

      // i = 13
      cout << "subkey[" << 14*64-1 << ":" << 13*64 << "] = key["
	   << ((s + 13) % 17 + 1)*64-1 << ":" << ((s + 13) % 17 )*64
	   << "] + tweak[" << (s % 3 + 1) * 64 - 1 << ":" << (s % 3) * 64
	   << "];" << endl;

      // i = 14
      cout << "subkey[" << 15*64-1 << ":" << 14*64 << "] = key["
	   << ((s + 14) % 17 + 1)*64-1 << ":" << ((s + 14) % 17 )*64
	   << "] + tweak[" << ((s + 1) % 3 + 1) * 64 - 1 << ":" << ((s+1) % 3) * 64
	   << "];" << endl;

      // i = 15
      cout << "subkey[" << 16*64-1 << ":" << 15*64 << "] = key["
	   << ((s + 15) % 17 + 1)*64-1 << ":" << ((s + 15) % 17 )*64
	   << "] + " << s << ";" << endl;
    }

  cout << "end" << endl;

  return 0;
}
