%{
#include <stdint.h>
typedef struct _context {
  uint32_t chars;
  uint32_t words;
  uint32_t lines;
} context_t;

context_t * global_context;
%}

%%

[^ \t\n\r\f\v]+ { global_context->words++; global_context->chars += strlen(yytext); }
\n              { global_context->chars++; global_context->lines++; }
.               { global_context->chars++; }

%%
void wc_parse(char * path, context_t * context) 
{
  global_context = context;

  yyin = fopen(path,"r");

  yylex();
}

