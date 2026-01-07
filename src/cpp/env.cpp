#include <cstdlib>
#include <iostream>

int main() {
  const char *user = std::getenv("USER");
  if (user) {
    std::cout << "USER=" << user << std::endl;
  } else {
    std::cout << "USER not set" << std::endl;
  }
  return 0;
}
