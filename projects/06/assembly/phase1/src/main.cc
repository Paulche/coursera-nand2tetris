
#include "main.h"
#include "bison.h"

extern FILE * yyin;

FILE * out;

uint16_t data = 0; 
char error_buffer[ERROR_BUFFER_SIZE] = {0};

int main(int argc, char ** argv)
{
  out = fopen(argv[2], "w+b");
  
  CHECK_FILE(out)

  yyin = fopen(argv[1], "r");

  CHECK_FILE(yyin)

  yyparse();
}

void write_w() 
{
  for (int offset = 15; offset >= 0; offset--) {
    if (data & (1 << offset)) {
      fprintf(out,"1");
    } else {
      fprintf(out,"0");
    }
  }
  
  fprintf(out,"\n");
}

void yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}

void dump()
{
  int padding = 4;

  for (int offset = 15; offset >= 0; offset--) {
    padding--;

    if (data & (1 << offset)) {
      printf("1");
    } else {
      printf("0");
    }

    if (!padding) {
      printf(" ");
      padding = 4;
    }
  }
  
  printf("\n");
}

