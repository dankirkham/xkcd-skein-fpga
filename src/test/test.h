#ifndef __TEST_H__
#define __TEST_H__

#include <string>

class Test {
private:
  int tests;
  int failures;
  std::string module_name;

public:
  Test(std::string module_name);
  void check(std::string assertation, bool condition);
  void report();
};


#endif
