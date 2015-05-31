# vim: set noexpandtab:

# Variable

# Release
# OPTIMIZE=-O3

# Debug
OPTIMIZE=-O0

all: build

build: rust-wc

rust-wc: libwc.a rust-wc/src/main.rs rust-wc/Cargo.toml
	cd rust-wc; cargo build

libwc.a: build/wc.yy.o
	ar rcs libwc.a build/wc.yy.o
 
build/wc.yy.o: src/wc.yy.c
	cc -c -o build/wc.yy.o ${OPTIMIZE} src/wc.yy.c

src/wc.yy.c: src/wc.lex 
	flex -o src/wc.yy.c src/wc.lex

clean: 
	rm -rf src/wc.yy.c
	cd rust-wc; cargo clean
	rm -rf libwc.a
	rm -rf build/*
  
deps:
	cd rust-w
