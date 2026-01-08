#include <dirent.h>
#include <iostream>
#include <string>
#include <vector>

int main() {
  std::cout << "--- ReadDir Test ---" << std::endl;

  DIR *dir;
  struct dirent *ent;

  dir = opendir(".");
  if (dir != NULL) {
    std::vector<std::string> files;
    while ((ent = readdir(dir)) != NULL) {
      files.push_back(std::string(ent->d_name));
    }
    closedir(dir);

    // WASI implementation should already sort, but let's just print them as
    // received to verify the order coming from fd_readdir.
    for (const auto &f : files) {
      std::cout << "Entry: " << f << std::endl;
    }

  } else {
    // could not open directory
    std::cout << "Failed to open directory" << std::endl;
    return 1;
  }

  return 0;
}
