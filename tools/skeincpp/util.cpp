#include <iostream>
#include <sstream>
#include "util.h"

using namespace std;

void print_hex(uint64_t *addr, int len) {
  for (int i = 0; i < len; i++) {
    stringstream ss;
    ss << hex << *addr;
    string s = ss.str();
    for (int n = s.length(); n < 16; n++)
      cout << '0';
    cout << s << endl;

    addr++;
  }
}
