#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>
// #include <stringstream>

#include "Vxkcd_skein_processor.h"
#include "verilated.h"

typedef struct {
  std::string filename;
  std::string line;
  uint64_t expected;
  uint64_t actual;
  std::string assertion;
} test_result_t;

std::string _int_to_hex(QData addr, int pad_len) {
  stringstream ss;
  ss << hex << addr;
  string s = ss.str();
  for (int n = s.length(); n < pad_len; n++)
    s.insert(0, "0");

  s.insert(0, "0x");

  return s;
}

bool _assert(std::string assertion, bool condition) {
  cout << assertion << ": ";
  if (condition) {
    cout << "\033[1;35mPass!\033[0m" << endl;
    return true;
  } else {
    cout << "\033[1;31mFail!\033[0m" << endl;
    return false;
  }
}

uint64_t _parse_hex_integer_string(std::string s) {
  uint64_t x;
  std::stringstream ss;
  ss << std::hex << s;
  ss >> x;

  return x;
}

uint64_t _parse_decimal_integer_string(std::string s) {
  return stoull(s);
}

uint64_t _parse_integer_string(std::string s) {
  if (s.substr(0, 2) == "0x") {
    return _parse_hex_integer_string(s.substr(2, s.length() - 2));
  } else {
    return _parse_decimal_integer_string(s);
  }
}

void _parse_input_directive(std::string comment, QData* output) {
  if (comment.substr(0, 12) == "CoreSimInput")
    *output = _parse_integer_string(comment.substr(13, comment.length() - 13));
}

bool _parse_assert_directive(std::string comment, test_result_t* tr) {
  if (comment.substr(0, 13) != "CoreSimAssert")
    return false;

  std::string params = comment.substr(14, comment.length() - 14);

  int space_pos = params.find(' ');

  if (space_pos == std::string::npos) {
    tr->expected = _parse_integer_string(params);
    tr->assertion = "";
  } else {
    tr->expected = _parse_integer_string(params.substr(0, space_pos));
    tr->assertion = params.substr(space_pos + 1, params.length() - space_pos);
  }

  return true;
}

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);

  int failures = 0;
  int assertions = 0;
  std::vector<test_result_t> results;

  for (int file_index = 1; file_index < argc; file_index++) {
    Vxkcd_skein_processor* top = new Vxkcd_skein_processor;
    top->clk_i = 0;

    ifstream ml_file;
    ml_file.open(argv[file_index]);

    int line_counter = 0;
    for(string line; getline(ml_file, line); )
    {
      line_counter++;

        string instruction = line;
        string comment;

        for (int i = 0; i < line.length(); i++) {
          if ((line[i] == '/') && (line[i+1] == '/')) {
            if (i > 0)
              instruction = line.substr(0, i - 1);

            if (line.length() > i) {
              comment = line.substr(i + 3, line.length() - (i + 2));
            }

            break;
          }
        }

        // _parse_input_directive(comment, &top->input_i);
        //
        // test_result_t tr;
        // if (_parse_assert_directive(comment, &tr)) {
        //   assertions++;
        //   if (!_assert(_int_to_hex(tr.expected, 4) + " == " + _int_to_hex(top->output_o, 4), tr.expected == top->output_o)) {
        //     failures++;
        //
        //     tr.actual = top->output_o;
        //     tr.filename = argv[file_index];
        //     tr.line = std::to_string(line_counter);
        //
        //     results.push_back(tr);
        //   }
        // }

        if (instruction.length() >= 5) {
          unsigned int x;
          std::stringstream ss;
          ss << std::hex << instruction.substr(0, 6);
          ss >> x;

          top->instruction_i = x;

          top->clk_i = 1;
          top->eval();
          top->clk_i = 0;
          top->eval();

          // cout << "Instruction: " << _int_to_hex(x, 5)
          //      << "; Output: " << _int_to_hex(top->output_o, 4);
          //
          // if (comment.length() > 0) {
          //   cout << "; Comment = " << comment << endl;
          // } else {
          //   cout << endl;
          // }
          //
          // cout << "  RAM Address: " << _int_to_hex(top->ram_address_o, 2)
          //      << "; RAM Output: " << _int_to_hex(top->ram_output_o, 4)
          //      << "; RAM Input: " << _int_to_hex(top->ram_input_o, 4)
          //      << "; RAM Write: " << _int_to_hex(top->ram_write_o, 1)
          //      << endl;
        }
    }

    delete top;
    ml_file.close();
  }

  if (results.size() > 0) {
    cout << endl << endl;
    cout << "----------------------------------------" << endl;
    cout << "Failures:" << endl;
    cout << "----------------------------------------" << endl;

    for (int i = 0; i < results.size(); i++) {
      cout << to_string(i + 1) << ". " << results[i].filename << ":"
           << results[i].line << ": " << endl;

      if (results[i].assertion.length() > 0)
        cout << "  \"" << results[i].assertion << '"' << endl;

      cout << "  Expected " << _int_to_hex(results[i].actual, 4)
           << " to be " << _int_to_hex(results[i].expected, 4) << endl;
    }

    cout << endl << endl;
  }

  cout << "Tests finished with " << to_string(failures) << " failures out of " << to_string(assertions) << " assertions." << endl;

  ofstream output_file;
  output_file.open((std::string)argv[0] + ".txt");
  output_file << (std::string)argv[0] << ": " << std::to_string(assertions) << " assertions; " << std::to_string(assertions - failures) << " passed; " << std::to_string(failures) << " failed.\n";
  output_file.close();

  exit(0);
}
