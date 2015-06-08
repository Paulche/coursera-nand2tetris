%{
#include "compiler.y.h"
%}

%%

"@"       { return AT; }
"="       { return EQUAL; }
"+"       { return PLUS; }
";"       { return SEMICOLON; }
"!"       { return EXCLAMATION_POINT; }
"&"       { return AMPERSAND; }
"|"       { return PIPE; }

"D"       { return D_REGISTER; }
"M"       { return M_REGISTER; }
"A"       { return A_REGISTER; }
"-"       { return MINUS; }

"1"       { yylval = atoi(yytext); return ONE; }
"0"       { yylval = atoi(yytext); return ZERO; }
[0-9]+    { yylval = atoi(yytext); return NUMBER; }

"JMP" { return JMP; }
"JLE" { return JLE; }
"JNE" { return JNE; }
"JLT" { return JLT; }
"JGE" { return JGE; }
"JEQ" { return JEQ; }
"JGT" { return JGT; }


\n        { return EOL; }
[ \t\r]   {  }
"//".*    {  }
.         { printf("Mystery character: %d\n", *yytext); }

%%

/* int main (int argc, char ** argv)  */
/* { */
/*   int token;  */
/*   yyin = fopen(argv[1], "r"); */
/*  */
/*   while ( (token = yylex())) { */
/*     printf("%d\n", token); */
/*   } */
/* } */



