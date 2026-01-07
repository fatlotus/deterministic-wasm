#include <fstream>
#include <iostream>
#include <string>
#include <vector>

int main() {
  std::cout << "--- VFS Test ---" << std::endl;

  const char *files_to_test[] = {"/test.txt", "test.txt", "./test.txt"};

  for (const char *path : files_to_test) {
    std::cout << "Testing path: " << path << std::endl;
    std::ifstream file(path);
    if (file.is_open()) {
      std::string line;
      if (std::getline(file, line)) {
        std::cout << "Successfully read: " << line << std::endl;
      } else {
        std::cout << "File is empty or could not read line." << std::endl;
      }
      file.close();
    } else {
      std::cout << "Failed to open " << path << std::endl;
    }
  }

  return 0;
}
