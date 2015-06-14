
#include "Compiler.hpp"

Compiler & Compiler::getInstance() {
  static Compiler instance;

  return instance;
}

