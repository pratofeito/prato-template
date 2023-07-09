file := game

# OS specific
ifeq ($(OS),Windows_NT)
	BUILD_ARG = -G "MinGW Makefiles"
	B_RELEASE = --config Release
	MOVE_CMD  = move
	FILE_EXT  = .exe
else
	BUILD_ARG = -DCMAKE_BUILD_TYPE=Release
	MOVE_CMD  = mv
endif

.phony: run, install

install:
	cmake -S . -B build $(BUILD_ARG)
	cmake --build build $(B_RELEASE)
	@$(MOVE_CMD) build/application build/$(file)$(FILE_EXT)
	@$(MOVE_CMD) build/$(file) ./

run: install
	./$(file)
