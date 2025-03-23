all: bench

build:
	mkdir -p ./out
	em++ ./src/lib.cpp \
	-s WASM=1 \
	-s EXPORTED_FUNCTIONS="['_x2Integrate']" \
	-s EXPORTED_RUNTIME_METHODS=ccall \
	-s MODULARIZE -o ./out/lib_cpp.out.js

bench: build
	bun cmd/bench/main.js ./out/lib_cpp.out.wasm ./configs/wapa.json

pkg: build
	@echo "Выполняется сборка пакета... (pkg)"
	mkdir -p out
	cp configs/wapa.json out/wapa.json
	zip -r pkg.zip out/*

clean:
	@echo "Очистка сгенерированных файлов... (clean)"
	rm -rf out pkg.zip

.PHONY: all build pkg clean
