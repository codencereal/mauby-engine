BUILD_DIR := build
PROJECT_NAME := maubyengine


.PHONY: all clean configure debug release run

all: configure debug

configure:
	@mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && cmake ..

debug:
	cd $(BUILD_DIR) && cmake -DCMAKE_BUILD_TYPE=Debug . && cmake --build .

release:
	cd $(BUILD_DIR) && cmake -DCMAKE_BUILD_TYPE=Release . && cmake --build .

run:
	./$(BUILD_DIR)/Linux64/Debug/demo

clean:
	rm -rf $(BUILD_DIR)

