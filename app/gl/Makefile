# Build source file
build_src:
	emcc ./src/main.c --emrun -s WASM=1 -s USE_GLFW=3 -s USE_WEBGL2=1 -o ./build/main.html;

# Clean
.PHONY: clean
clean:
	rm ./build/*