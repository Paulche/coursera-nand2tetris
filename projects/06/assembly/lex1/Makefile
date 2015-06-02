# vim: set noexpandtab:

# Variable

# Release
# OPTIMIZE=-O3

# Debug
OPTIMIZE=-O0

all: build

build: rust-wc

check: src/wc.yy.c src/calc.tab.c
	cc -o check src/wc.yy.c src/calc.tab.c -ll
	

rust-wc: libwc.a rust-wc/src/main.rs rust-wc/src/context.rs rust-wc/Cargo.toml
	cd rust-wc; cargo build

libwc.a: build/wc.yy.o build/calc.tab.o
	ar rcs libwc.a build/wc.yy.o
	ar rcs libwc.a build/calc.tab.o
 
build/wc.yy.o: src/wc.yy.c 
	cc -c -o build/wc.yy.o ${OPTIMIZE} src/wc.yy.c

build/calc.tab.o: src/calc.tab.c 
	cc -c -o build/calc.tab.o ${OPTIMIZE} src/calc.tab.c

src/calc.tab.h src/calc.tab.c: src/calc.y
	bison -d src/calc.y -b src/calc

src/wc.yy.c: src/wc.lex 
	flex -o src/wc.yy.c src/wc.lex

clean: 
	rm -rf src/wc.yy.c
	cd rust-wc; cargo clean
	rm -rf libwc.a
	rm -rf build/*
	rm -rf src/calc.tab.h src/calc.tab.c
  
deps:
	cd rust-w
