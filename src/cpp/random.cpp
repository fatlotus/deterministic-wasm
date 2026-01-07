#include <cstdlib>
#include <iostream>

int main() {
  std::srand(0);
  std::cout << "Random numbers:" << std::endl;
  for (int i = 0; i < 5; ++i) {
    std::cout << std::rand() % 100 << std::endl;
  }
  return 0;
}
