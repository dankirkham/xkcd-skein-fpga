#include "test.h"
#include <iostream>
#include <fstream>
#include <string>

Test::Test(std::string name) {
  tests = 0;
  failures = 0;
  module_name = name;
}

bool Test::check(std::string assertation, bool condition) {
  tests++;
  std::cout << assertation << ": ";

  if (condition) {
    std::cout << "\033[1;35mPass!\033[0m" << std::endl;

    return true;
  } else {
    std::cout << "\033[1;31mFail!\033[0m" << std::endl;
    failures++;

    return false;
  }
}

void Test::report() {
  std::ofstream output_file;

  output_file.open(module_name + ".txt");

  output_file << module_name
              << ": "
              << std::to_string(tests)
              << " assertions; "
              << std::to_string(tests - failures)
              << " passed; "
              << std::to_string(failures)
              << " failed.\n";

  output_file.close();
}
