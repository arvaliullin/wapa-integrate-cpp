
all: build

build:
	mkdir -p ./out
	em++ ./src/lib.cpp \
	-s WASM=1 \
	-s EXPORTED_FUNCTIONS="['_x2Integrate']" \
	-s EXPORTED_RUNTIME_METHODS=ccall \
	-s MODULARIZE -o ./out/lib_cpp.out.js

bench:
	bun cmd/bench/main.js ./out/lib_cpp.out.wasm ./configs/wapa.json

.PHONY: all build
