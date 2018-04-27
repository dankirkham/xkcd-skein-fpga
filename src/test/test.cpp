#include "test.h"
#include <iostream>
#include <fstream>
#include <string>

int tests = 0;
int failures = 0;

void _assert(std::string assertation, bool condition) {
  tests++;
  std::cout << assertation << ": ";
  if (condition) {
    std::cout << "\033[1;35mPass!\033[0m" << std::endl;
  } else {
    std::cout << "\033[1;31mFail!\033[0m" << std::endl;
    failures++;
  }
}

void _report(std::string name) {
  std::ofstream output_file;
  output_file.open(name + ".txt");
  output_file << name << ": " << std::to_string(tests) << " assertions; " << std::to_string(tests - failures) << " passed; " << std::to_string(failures) << " failed.\n";
  output_file.close();
}
