# vim: set noexpandtab:

# Variable

# Release
# OPTIMIZE=-O3

# Debug
OPTIMIZE=-O0

.PHONY: clean test test1 test2 

all: target/compiler

target/compiler: build/compiler.lex.c build/compiler.y.c
	cc ${OPTIMIZE} -D_POSIX_SOURCE -std=c99 -o target/compiler build/compiler.y.c build/compiler.lex.c -ll 

build/compiler.lex.c: src/compiler.lex
	flex -o build/compiler.lex.c src/compiler.lex

build/compiler.y.c: src/compiler.y
	bison  -o build/compiler.y.c -d src/compiler.y  

clean: 
	rm -rf target/*
	rm -rf build/*
	rm -rf tmp/*

test: test1 test2 

test1: target/compiler
	target/compiler test/Add.asm tmp/Add.hack
	diff test/Add.hack tmp/Add.hack

test2: target/compiler
	target/compiler test/MaxL.asm tmp/MaxL.hack
	diff test/MaxL.hack tmp/MaxL.hack


