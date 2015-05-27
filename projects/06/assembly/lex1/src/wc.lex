%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%

[^ \t\n\r\f\v]+ { words++; chars += strlen(yytext); }
\n              { chars++; lines++; }
.               { chars++; }

%%
FILE * yyin; 

int main(int argc, char ** argv)
{
  if (argc < 2) 
  {
    fprintf (stdout, "Usage: %s filename\n", argv[0]);
    return 0;
  }

  yyin = fopen(argv[1],"r");

  yylex();

  printf("Lines: %8d\nWords: %8d\nChars: %8d\n",lines, words, chars);

}
