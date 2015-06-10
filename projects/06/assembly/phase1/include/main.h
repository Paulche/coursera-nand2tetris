#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#define ERROR_BUFFER_SIZE     1024
#define SET(offset)           ( data |= (1 << offset) )
#define CHECK_FILE(file)      if (file == NULL) { sprintf(error_buffer,"Program panic on %s:%d",__FILE__,__LINE__); perror(error_buffer); exit(1); }

#ifdef __cplusplus
extern "C" {
#endif

void yyerror(char *s);

uint16_t data; 
char error_buffer[ERROR_BUFFER_SIZE];

#ifdef __cplusplus
}
#endif

void dump();
void write();

