#include <iostream>

using namespace std;

int RotationConstant (const int j, const int d)
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

int main ()
{
  cout << "generate" << endl;
  cout << "case (D)" << endl;
  
  for (int d = 0; d < 8; d++)
    {
      cout << d << ":" << endl;
      cout << "case (J)" << endl;
      for (int j = 0; j < 8; j++)
	{
	  int rc = RotationConstant(j, d);
	  cout << j << ":" << endl;
	  cout << "always @(*) begin" << endl;
	  cout << "rotate[63:" << rc << "] = in[" << 63 - rc << ":0];" << endl;
	  cout << "rotate[" << rc - 1 << ":0] = in[63:" << 64 - rc << "];" << endl;
	  cout << "end" << endl;
	}
      cout << "endcase // case (J)" << endl;
    }
  cout << "endcase // case (D)" << endl;
  cout << "endgenerate" << endl;

  return 0;
}
