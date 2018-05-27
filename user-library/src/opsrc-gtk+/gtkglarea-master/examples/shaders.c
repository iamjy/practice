/******************************************************************************
 * Copyright (C) 1999 Chris Abernethy <chris65536@home.com>                   *
 *           (c) 2007 Éric Beets (Uniways-Innovatys) <ericbeets@free.fr>      *
 *                                                                            *
 * This program is free software; you can redistribute it and/or              *
 * modify it under the terms of the GNU General Public License                *
 * as published by the Free Software Foundation; either version 2             *
 * of the License, or (at your option) any later version.                     *
 *                                                                            *
 * This program is distributed in the hope that it will be useful,            *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of             *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              *
 * GNU General Public License for more details.                               *
 *                                                                            *
 * You should have received a copy of the GNU General Public License          *
 * along with this program; if not, write to the Free Software                *
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307,     *
 * USA.                                                                       *
 *                                                                            *
 ******************************************************************************
 *
 * This program creates a window with a GglaArea widget using a Vertex
 * Shader and a Fragment shader. It should display a coloured texture. A
 * grayscale result means the shaders are not supported.
 *
 ************/

#ifndef GL_GLEXT_PROTOTYPES
#    define GL_GLEXT_PROTOTYPES 1
#endif

#include <epoxy/gl.h>
#include <gtk/gtk.h>
#include <gtkgl/gtkglarea.h>

#include <stdlib.h>
#include <string.h>


void       create_shader         (void);
void       create_texture_2D     (void);
GtkWidget* create_glarea         (void);
gint       glarea_draw           (GtkWidget*, cairo_t*, gpointer);
gint       glarea_draw_scene     (void);
gint       glarea_reshape        (GtkWidget*, GdkEventConfigure*);
gint       glarea_init           (GtkWidget*);
gint       glarea_destroy        (GtkWidget*);
int        main                  (int, char**);

#define texture_width   64
#define texture_height  64
static GLubyte texture[texture_height][texture_width][3];

/* Vertex Shader                                */
/*   compute the color from the vertex position */

static char const *vertex_shader_str =
  "varying vec4 color;\n"
  "void main()\n"
  "{\n"
  "  gl_TexCoord[0] = gl_MultiTexCoord0;\n"
  "  float r = float(gl_Vertex.x + 100.0) / 100.0;\n"
  "  float g = float(gl_Vertex.y + 100.0) / 100.0;\n"
  "  color = vec4(1.0 - r, 1.0 - g, 0.0, 1.0);\n"
  "  gl_Position = gl_ProjectionMatrix * gl_ModelViewMatrix * gl_Vertex;\n"
  "}\n";

/* Fragment Shader                              */
/*   coordinates texture repeat on X and Y      */
/*   invert coordinates texture (on repetition) */

static char const *fragment_shader_str =
  "varying vec4 color;\n"
  "uniform sampler2D tex;\n"
  "void main()\n"
  "{\n"
  "  vec2 coord, fact;\n"
  "  fact = vec2(1.0, 1.0);\n"
  "  if(gl_TexCoord[0].x > 0.5)\n"
  "    fact.x = -1.0;\n"
  "  if(gl_TexCoord[0].y > 0.5)\n"
  "    fact.y = -1.0;\n"
  "  coord.x = fact.x * gl_TexCoord[0].x * 2.0;\n"
  "  coord.y = fact.y * gl_TexCoord[0].y * 2.0;\n"
  "  gl_FragColor = texture2D(tex, coord) + color;\n"
  "}\n";

/**************************************************/
/*                                                */
/* Function: create_texture_2D (void)             */
/*                                                */
/* This function creates a procedural 2d texture. */
/*                                                */
/**************************************************/

void create_texture_2D (void) {

  int x, y;

  g_print("Creating 2D texture\n");

  for(y = 0; y < texture_height; y++) {
    for(x = 0; x < texture_width; x++) {
      texture[y][x][0] = (x * y) % 255;
      texture[y][x][1] = (x * y) % 255;
      texture[y][x][2] = (x * y) % 255;
    }
  }
}

/********************************************************/
/*                                                      */
/* Function : check_extension(void)                     */
/*                                                      */
/* This function checks for a given GL extension        */
/*                                                      */
/********************************************************/

int check_extension(char const *name)
{
  const char *glExtensions = (const char *)glGetString(GL_EXTENSIONS);
  return (strstr(glExtensions, name) != NULL);
}

/*******************************************************/
/*                                                     */
/* Function: shader_status(int)                        */
/*                                                     */
/* This function checks the shader status and show     */
/* the compilation log                                 */
/*                                                     */
/*******************************************************/

void shader_status(int shader_id)
{
   /* Compilation Test */

   int status;
   glGetShaderiv(shader_id, GL_COMPILE_STATUS, &status);

   /* Display log compilation */

   if (!status)
   {
     int infologLength, charsWritten;
     GLchar *infoLog;
     glGetShaderiv(shader_id, GL_INFO_LOG_LENGTH, &infologLength);
     infoLog = malloc(sizeof(GLchar) * infologLength);
     glGetShaderInfoLog(shader_id, infologLength, &charsWritten, infoLog);
     g_print(infoLog);
     free(infoLog);
   }
}

/*******************************************************/
/*                                                     */
/* Function: create_shader(void)                       */
/*                                                     */
/* This function creates a Vertex and Fragment Shader, */
/* compile the Program Shader and use it.              */
/*                                                     */
/*******************************************************/

void create_shader (void) {

  int vertex_shader, fragment_shader, prog;

  g_print("Creating shaders\n");

  /* Create Shaders (vertex and fragment) */

  vertex_shader = glCreateShader(GL_VERTEX_SHADER);
  fragment_shader = glCreateShader(GL_FRAGMENT_SHADER);

  /* Source Shader */

  glShaderSource(vertex_shader, 1, &vertex_shader_str, NULL);
  glShaderSource(fragment_shader, 1, &fragment_shader_str, NULL);

  /* Shader source compilation */

  glCompileShader(vertex_shader);
  glCompileShader(fragment_shader);

  /* Create Program */

  prog = glCreateProgram();

  /* Add the shader to the program */

  glAttachShader(prog, vertex_shader);
  glAttachShader(prog, fragment_shader);

  /* Link the shader */

  glLinkProgram(prog);

  /* Check the program */

  glValidateProgram(prog);

  /* Check shaders */

  shader_status(vertex_shader);
  shader_status(fragment_shader);

  /* Activate shaders */
  glUseProgram(prog);
}

/*****************************************************************************/
/*                                                                           */
/* Function: create_glarea (void)                                            */
/*                                                                           */
/* This function performs the necessary operations to construct a GtkGlarea  */
/* widget. These operations include creating the widget, setting the size    */
/* of the widget, and registering callbacks for the widget.                  */
/*                                                                           */
/* This is a good place to add function calls for any GtkGlarea              */
/* initialization that you need to do.                                       */
/*                                                                           */
/*****************************************************************************/

GtkWidget* create_glarea (void) {

  GtkWidget* glarea;

  int attrlist[] = {
    GGLA_RGBA,
    GGLA_DOUBLEBUFFER,
    GGLA_DEPTH_SIZE, 1,
    GGLA_NONE
  };

  if(ggla_query() == FALSE) {
    g_print("OpenGL not supported!\n");
    return NULL;
  }

  if ((glarea = ggla_area_new(attrlist)) == NULL) {
    g_print("Error creating GglaArea!\n");
    return NULL;
  }

  gtk_widget_set_events(GTK_WIDGET(glarea), GDK_EXPOSURE_MASK);

  g_signal_connect (G_OBJECT(glarea), "draw",
                    G_CALLBACK(glarea_draw), NULL);

  g_signal_connect (G_OBJECT(glarea), "configure-event",
                    G_CALLBACK(glarea_reshape), NULL);

  g_signal_connect (G_OBJECT(glarea), "realize",
                    G_CALLBACK(glarea_init), NULL);

  g_signal_connect (G_OBJECT(glarea), "destroy",
                    G_CALLBACK(glarea_destroy), NULL);

  gtk_widget_set_size_request(GTK_WIDGET(glarea), 256, 256);

  return (glarea);

}

/*******************************************************/
/*                                                     */
/* Function: glarea_draw_scene(void)                   */
/*                                                     */
/* This function draws a simple textured quad          */
/*                                                     */
/*******************************************************/

gint glarea_draw_scene (void) {

  /* Draw a simple Quad */
  glBegin(GL_QUADS);
    glTexCoord2f(0.0, 0.0); glVertex3f(-100,-100,0);
    glTexCoord2f(0.0, 1.0); glVertex3f(-100, 100,0);
    glTexCoord2f(1.0, 1.0); glVertex3f( 100, 100,0);
    glTexCoord2f(1.0, 0.0); glVertex3f( 100,-100,0);
  glEnd();

  return(TRUE);
}

/*****************************************************************************/
/*                                                                           */
/* Function: glarea_draw (GtkWidget *widget, cairo_t *cr, gpointer user_data)*/
/*                                                                           */
/* This is the function that should render your scene to the GglaArea. It   */
/* can be used as a callback to the 'draw' signal.                           */
/*                                                                           */
/*****************************************************************************/

gboolean glarea_draw (GtkWidget *widget, cairo_t *cr, gpointer user_data) {

  if (ggla_area_make_current(GGLA_AREA(widget))) {

    glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glarea_draw_scene();
    ggla_area_swap_buffers (GGLA_AREA(widget));

  }

  return (TRUE);

}

/*****************************************************************************/
/*                                                                           */
/* Function: glarea_reshape (GtkWidget*, GdkEventConfigure*)                 */
/*                                                                           */
/* This function performs the operations needed to maintain the viewing area */
/* of the GglaArea. This should be called whenever the size of the area     */
/* is changed.                                                               */
/*                                                                           */
/*****************************************************************************/

gint glarea_reshape (GtkWidget* widget, GdkEventConfigure* event) {

  GtkAllocation allocation;
  gtk_widget_get_allocation (widget, &allocation);
  int w = allocation.width;
  int h = allocation.height;

  if (ggla_area_make_current (GGLA_AREA(widget))) {

    glViewport (0, 0, w, h);
    glMatrixMode (GL_PROJECTION);
    glLoadIdentity ();
    glOrtho (-(w>>1), (w>>1), -(h>>1), h>>1, -1, 1);
    glMatrixMode (GL_MODELVIEW);

  }

  return (TRUE);

}

/*****************************************************************************/
/*                                                                           */
/* Function: glarea_init (GtkWidget*)                                        */
/*                                                                           */
/* This function is a callback for the realization of the GglaArea widtget. */
/* You should do any OpenGL initialization here.                             */
/*                                                                           */
/*****************************************************************************/

gint glarea_init (GtkWidget* widget) {

  if (ggla_area_make_current (GGLA_AREA(widget))) {

    /* Procedural texture creation */

    create_texture_2D ();

    /* Check, Create and Activate shaders */

    if(!check_extension("GL_ARB_fragment_shader"))
      fprintf(stderr, "Warning: GL_ARB_fragment_shader extension not present\n");
    else if(!check_extension("GL_ARB_vertex_shader"))
      fprintf(stderr, "Warning: GL_ARB_vertex_shader extension not present\n");
    else
      create_shader();

    /* Activate and parameterization texture context */

    glEnable(GL_TEXTURE_2D);

    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, texture_width, texture_height, 0, GL_RGB, GL_UNSIGNED_BYTE, texture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
  }

  return TRUE;

}

/*****************************************************************************/
/*                                                                           */
/* Function: glarea_destroy (GtkWidget*)                                     */
/*                                                                           */
/* This function is a callback for the main GglaArea. It deletes should     */
/* delete any data structures stored in the GglaArea.                       */
/*                                                                           */
/*****************************************************************************/

gint glarea_destroy (GtkWidget* widget) {

  g_print ("GTK GL Area destroy event\n");

  /* Insert any required cleanup */
  /* code here.                  */

  return TRUE;

}

/*****************************************************************************/
/*                                                                           */
/* Function: main (int, char**)                                              */
/*                                                                           */
/* The main function sets up our GUI and calls the functions needed to       */
/* create our GglaArea.                                                     */
/*                                                                           */
/*****************************************************************************/

int main (int argc, char** argv) {

  GtkWidget* window;
  GtkWidget* button_quit;
  GtkWidget* message;
  GtkWidget* box_main;
  GtkWidget* glarea;

  gtk_init (&argc, &argv);

  /* Main widget container */

  box_main = gtk_box_new (GTK_ORIENTATION_VERTICAL, 10);

  /* GTK GL Area */

  glarea = create_glarea ();

  /* Information message */

  message = gtk_label_new ("If the above drawing consists only of\n"
                           "shades of grey, your hardware or your\n"
                           "drivers do not support fragment shaders.");

  /* Quit button */

  button_quit = gtk_button_new_with_label ("Quit");

  g_signal_connect (G_OBJECT(button_quit), "clicked",
                    G_CALLBACK(gtk_main_quit), NULL);

  /* Main window */

  window = gtk_window_new (GTK_WINDOW_TOPLEVEL);

  gtk_window_set_title (GTK_WINDOW(window), "GglaArea Shader Demo");

  g_signal_connect (G_OBJECT(window), "delete-event",
                    G_CALLBACK(gtk_main_quit), NULL);

  g_signal_connect (G_OBJECT (window), "destroy",
                    G_CALLBACK(gtk_main_quit), NULL);

  gtk_container_set_border_width (GTK_CONTAINER(window), 10);

  /* Pack everything into the main box, add the main box to */
  /* the top-level window, and 'show' all of the widgets.   */
  /* The window is 'shown' last so that when the user sees  */
  /* it, it's contents are already there. Otherwise they    */
  /* might see each widget come up.                         */

  gtk_box_pack_start (GTK_BOX(box_main), glarea,      TRUE,  TRUE, 0);
  gtk_box_pack_start (GTK_BOX(box_main), message,     FALSE, TRUE, 0);
  gtk_box_pack_start (GTK_BOX(box_main), button_quit, FALSE, TRUE, 0);
  gtk_container_add (GTK_CONTAINER(window), box_main);

  gtk_widget_show (glarea);
  gtk_widget_show (message);
  gtk_widget_show (button_quit);
  gtk_widget_show (box_main);
  gtk_widget_show (window);

  gtk_main ();

  return (0);

}
