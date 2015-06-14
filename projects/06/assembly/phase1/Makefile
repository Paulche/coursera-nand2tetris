# vim: set noexpandtab:

# Variable

# Release
# OPTIMIZE=-O3

# Debug
OPTIMIZE=-O0

.PHONY: clean test test1 test2 test3 test4

all: target/compiler

target/compiler: build/compiler.lex.cc build/compiler.y.cc src/main.cc include/main.h include/bison.h src/Compiler.cc
	$(CXX) ${OPTIMIZE} -D_POSIX_SOURCE -DYYDEBUG=1 -o target/compiler -I include build/compiler.y.cc build/compiler.lex.cc src/main.cc src/Compiler.cc -ll 

build/compiler.lex.cc: src/compiler.lex
	flex -o build/compiler.lex.cc src/compiler.lex

build/compiler.y.cc: src/compiler.ypp
	bison -t -o build/compiler.y.cc -d src/compiler.ypp

clean: 
	rm -rf target/*
	rm -rf build/*
	rm -rf tmp/*

test: test1 test2 test3 test4

test1: target/compiler
	target/compiler test/Add.asm tmp/Add.hack
	diff test/Add.hack tmp/Add.hack

test2: target/compiler
	target/compiler test/MaxL.asm tmp/MaxL.hack
	diff test/MaxL.hack tmp/MaxL.hack

test3: target/compiler
	target/compiler test/RectL.asm tmp/RectL.hack
	diff test/RectL.hack tmp/RectL.hack

test4: target/compiler
	target/compiler test/PongL.asm tmp/PongL.hack
	diff test/PongL.hack tmp/PongL.hack

