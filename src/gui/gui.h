#ifndef GUI_H
#define GUI_H

#ifdef __cplusplus
extern "C" {
#endif

#include <GLFW/glfw3.h>

// Initialize the GUI
void init_gui(GLFWwindow* window);

// Render the GUI
void render_gui();

// Shutdown the GUI
void shutdown_gui();

#ifdef __cplusplus
}
#endif

#endif // GUI_H