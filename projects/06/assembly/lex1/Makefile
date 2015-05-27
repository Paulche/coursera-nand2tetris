# vim: set noexpandtab:

# Variable

# Release
# OPTIMIZE=-O3

# Debug
OPTIMIZE=-O0

all: build

build: wc 

wc: src/wc.yy.c
	cc -o wc -ll ${OPTIMIZE} src/wc.yy.c

src/wc.yy.c: src/wc.lex 
	flex -o src/wc.yy.c src/wc.lex

clean: 
	rm -rf src/wc.yy.c
	rm -rf wc
  
