#include <cstring>
#include <iostream>
#include <string>
#include <vector>

int main(int argc, char *argv[]) {
  if (argc < 1) {
    std::cerr << "Error: argc is less than 1" << std::endl;
    return 1;
  }

  if (strcmp(argv[0], "/main.wasm") != 0) {
    std::cerr << "Error: argv[0] is \"" << argv[0]
              << "\", expected \"/main.wasm\"" << std::endl;
    return 1;
  }

  std::cout << "Success: argv[0] is \"/main.wasm\"" << std::endl;
  return 0;
}
