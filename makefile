# Define the build directory
BUILD_DIR := build

# Define the project name
PROJECT_NAME := maubyengine

# Targets
.PHONY: all clean configure build run

all: configure build

configure:
	@mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && cmake ..

build:
	cd $(BUILD_DIR) && cmake --build .

run:
	./$(BUILD_DIR)/demo

clean:
	rm -rf $(BUILD_DIR)

