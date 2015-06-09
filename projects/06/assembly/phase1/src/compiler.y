%{
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#define ERROR_BUFFER_SIZE     1024
#define SET(offset)           ( data |= (1 << offset) )
#define CHECK_FILE(file)      if (file == NULL) { sprintf(error_buffer,"Program panic on %s:%d",__FILE__,__LINE__); perror(error_buffer); exit(1); }

void yyerror(char *s);
extern FILE * yyin;
uint16_t data = 0; 
FILE * out;
int yylex();
char error_buffer[ERROR_BUFFER_SIZE] = {0};


void dump();
void write();
%}

%token AT EQUAL PLUS
%token D_REGISTER M_REGISTER A_REGISTER
%token ONE ZERO MINUS NUMBER 
%token EOL
%token SEMICOLON EXCLAMATION_POINT AMPERSAND PIPE
%token JMP JLE JNE JLT JGE JEQ JGT 

%%
list: 
  | list exp EOL { data = 0; } 
  ;

exp: 
  | acode { write(); }
  | ccode { SET(15); SET(14); SET(13); write(); }
  ;

acode: AT address { data = $2; }
  ;

address: NUMBER
  | ZERO
  | ONE
  ;

ccode: dest EQUAL comp SEMICOLON jump
  | comp SEMICOLON jump
  | dest EQUAL comp
  ;

dest: M_REGISTER                          { SET(3); }
  | D_REGISTER                            { SET(4); }
  | M_REGISTER D_REGISTER                 { SET(3); SET(4); }
  | A_REGISTER                            { SET(5); }
  | A_REGISTER M_REGISTER                 { SET(5); SET(3); }
  | A_REGISTER D_REGISTER                 { SET(5); SET(4); }
  | A_REGISTER M_REGISTER D_REGISTER      { SET(5); SET(4); SET(3); }
  ;

comp: ZERO                              { SET(11); SET(9); SET(7); }
  | ONE                                 { SET(10); SET(9); SET(8); SET(7); SET(6); }
  | MINUS ONE                           { SET(11); SET(10); SET(9); SET(7); }
  | D_REGISTER                          {  SET(8); }
  | a_or_m                              { SET(11); SET(10); }
  | EXCLAMATION_POINT D_REGISTER        { SET(9); SET(6); }
  | EXCLAMATION_POINT a_or_m            { SET(11); SET(10); SET(6); }
  | MINUS D_REGISTER                    { SET(9); SET(8); SET(7); SET(6); }
  | MINUS a_or_m                        { SET(11); SET(7); SET(6); }
  | D_REGISTER PLUS ONE                 { SET(10); SET(9); SET(8); SET(7); SET(6); }
  | a_or_m PLUS ONE                     { SET(11); SET(10); SET(8); SET(7); SET(6); }
  | D_REGISTER MINUS ONE                { SET(9); SET(8); SET(7); }
  | a_or_m MINUS ONE                    { SET(11); SET(10); SET(7); }
  | D_REGISTER PLUS a_or_m              { SET(7); }
  | D_REGISTER MINUS a_or_m             { SET(10); SET(7); SET(6); }
  | a_or_m MINUS D_REGISTER             { SET(8); SET(7); SET(6); }
  | D_REGISTER AMPERSAND a_or_m         
  | D_REGISTER PIPE a_or_m              { SET(10); SET(8); SET(6); }
  ;

a_or_m: A_REGISTER 
  | M_REGISTER      { SET(12); }
  ;

jump: JMP     { SET(0); SET(1); SET(2);  }
  | JGT       { SET(0); }
  | JEQ       { SET(1); }
  | JGE       { SET(0); SET(1); }
  | JLT       { SET(2); }
  | JNE       { SET(2); SET(0); }
  | JLE       { SET(2); SET(1); }
  ;

%%
int main(int argc, char **argv)
{
  out = fopen(argv[2], "w+b");
  
  CHECK_FILE(out)

  yyin = fopen(argv[1], "r");

  CHECK_FILE(yyin)

  yyparse();
}

void write() 
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
