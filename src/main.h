#pragma once

#include <stdio.h>
#include <stdbool.h>
#include "glad.h"
#include <GLFW/glfw3.h>

void framebuffer_size_callback(GLFWwindow* window, int width, int height);

void processInput(GLFWwindow *window);

int run();
