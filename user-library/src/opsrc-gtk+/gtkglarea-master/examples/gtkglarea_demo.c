/******************************************************************************
 * Copyright (C) 1999 Chris Abernethy <chris65536@home.com>                   *
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
 * This is a short, heavily commented demo program designed to help
 * get you started using the GglaArea widget in your gtk programs.
 *
 * The program creates a window with a GglaArea widget and a quit button.
 * Some commonly used callbacks are registered, but nothing is drawn into
 * the window.
 *
 * Please email me with any corrections, additions, or clarifications!
 *
 * Created    11.14.1999
 * Modified   11.14.1999
 *
 * Compile command:
 *
 * gcc gtkglarea_demo.c `gtk-config --libs --cflags` -lMesaGL -lgtkgl
 *
 ************/

#include <glib.h>		/* For G_OS_WIN32 */

#ifdef G_OS_WIN32
#include <windows.h>
#endif

#include <epoxy/gl.h>
#include <gtk/gtk.h>
#include <gtkgl/gtkglarea.h>

GtkWidget* create_glarea         (void);
gint       glarea_button_release (GtkWidget*, GdkEventButton*);
gint       glarea_button_press   (GtkWidget*, GdkEventButton*);
gint       glarea_motion_notify  (GtkWidget*, GdkEventMotion*);
gint       glarea_draw           (GtkWidget*, cairo_t*, gpointer);
gint       glarea_reshape        (GtkWidget*, GdkEventConfigure*);
gint       glarea_init           (GtkWidget*);
gint       glarea_destroy        (GtkWidget*);
int        main                  (int, char**);

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

  /* Choose the attributes that we would like for our visual. */
  /* These attributes are passed to glXChooseVisual by the    */
  /* gdk (see ggla_choose_visual in gdkgl.c from the        */
  /* GtkGlarea distro).                                       */
  /*                                                          */
  /*                                                          */
  /* From the glXChooseVisual manpage:                        */
  /*                                                          */
  /* glXChooseVisual returns a pointer to an XVisualInfo      */
  /* structure describing the visual that best meets a        */
  /* minimum specification.                                   */
  /*                                                          */
  /* Check out the manpage for a complete list of attributes  */
  /* and their descriptions.                                  */

  int attrlist[] = {
    GGLA_RGBA,
    GGLA_DOUBLEBUFFER,
    GGLA_DEPTH_SIZE, 1,
    GGLA_NONE
  };

  /* First things first! Make sure that OpenGL is supported   */
  /* before trying to do OpenGL stuff!                        */

  if(ggla_query() == FALSE) {
    g_print("OpenGL not supported!\n");
    return NULL;
  }

  /* Now, create the GglaArea using the attribute list that  */
  /* we defined above.                                        */

  if ((glarea = ggla_area_new(attrlist)) == NULL) {
    g_print("Error creating GglaArea!\n");
    return NULL;
  }

  /* Indicate which events we are interested in receiving in  */
  /* in the window allocated to our glarea widget.            */
  /*                                                          */
  /* Check out gdk/gdktypes.h in your include directory for a */
  /* complete list of event masks that you can use.           */

  gtk_widget_set_events(GTK_WIDGET(glarea),
                        GDK_EXPOSURE_MASK|
                        GDK_BUTTON_PRESS_MASK|
			GDK_BUTTON_RELEASE_MASK|
			GDK_POINTER_MOTION_MASK|
                        GDK_POINTER_MOTION_HINT_MASK);

  /* Here we register the callbacks for the specific events   */
  /* we are interested in handling. Event handling is beyond  */
  /* the scope of this demo, but a good place to start for    */
  /* learning about this is the gtk web pages at www.gtk.org  */
  /*                                                          */
  /* The following callback registration code registers       */
  /* callbacks for some of the more common things that you    */
  /* might want to do with an OpenGL window.                  */

  /* button_release_event - The user has released one of the  */
  /*                        mouse buttons in the window.      */

  g_signal_connect (G_OBJECT(glarea), "button-release-event",
                    G_CALLBACK(glarea_button_release), NULL);

  /* button_press_event - The user has pressed one of the     */
  /*                      mouse buttons in the window.        */

  g_signal_connect (G_OBJECT(glarea), "button-press-event",
                    G_CALLBACK(glarea_button_press), NULL);

  /* motion_notify_event - The mouse is moving in the window. */

  g_signal_connect (G_OBJECT(glarea), "motion-notify-event",
                    G_CALLBACK(glarea_motion_notify), NULL);

  /* draw - The window was exposed and the contents           */
  /*        need to be redrawn.                               */

  g_signal_connect (G_OBJECT(glarea), "draw",
                    G_CALLBACK(glarea_draw), NULL);

  /* configure_event - The window has been resized. You will  */
  /*                   probably want to call your reshape     */
  /*                   function here.                         */

  g_signal_connect (G_OBJECT(glarea), "configure-event",
                    G_CALLBACK(glarea_reshape), NULL);

  /* realize - The window has been created, this is where you */
  /*           can hook up your initialization routines.      */

  g_signal_connect (G_OBJECT(glarea), "realize",
                    G_CALLBACK(glarea_init), NULL);

  /* destroy - The window has received a destroy event, this  */
  /*           is where you should do any cleanup that needs  */
  /*           to happen, such as de-allocating data objects  */
  /*           that you have added to your GglaArea.         */

  g_signal_connect (G_OBJECT(glarea), "destroy",
                    G_CALLBACK (glarea_destroy), NULL);

  gtk_widget_set_size_request(GTK_WIDGET(glarea), 256, 256);

  return (glarea);

}

/*****************************************************************************/
/*                                                                           */
/* Function: glarea_button_release (GtkWidget*, GdkEventButton*)             */
/*                                                                           */
/* This function handles button-release events for the GglaArea into which  */
/* we are drawing.                                                           */
/*                                                                           */
/*****************************************************************************/

gint glarea_button_release (GtkWidget* widget, GdkEventButton* event) {

  int x = event->x;
  int y = event->y;

  if (event->button == 1) {

    /* Mouse button 1 was released */
    g_print ("Button 1 release (%d, %d)\n", x, y);

    return TRUE;

  }

  if (event->button == 2) {

    /* Mouse button 2 was released */
    g_print ("Button 2 release (%d, %d)\n", x, y);

    return TRUE;

  }

  return FALSE;

}

/*****************************************************************************/
/*                                                                           */
/* Function: glarea_button_press (GtkWidget*, GdkEventButton*)               */
/*                                                                           */
/* This function handles button-press events for the GglaArea into which we */
/* are drawing.                                                              */
/*                                                                           */
/*****************************************************************************/

gint glarea_button_press (GtkWidget* widget, GdkEventButton* event) {

  int x = event->x;
  int y = event->y;

  if (event->button == 1) {

    /* Mouse button 1 was engaged */
    g_print ("Button 1 press   (%d, %d)\n", x, y);

    return TRUE;
  }

  if (event->button == 2) {

    /* Mouse button 2 was engaged */
    g_print ("Button 2 press   (%d, %d)\n", x, y);

    return TRUE;

  }

  return FALSE;

}

/*****************************************************************************/
/*                                                                           */
/* Function: glarea_motion_notify (GtkWidget*, GdkEventMotion*)              */
/*                                                                           */
/* This function handles motion events for the GglaArea into which we are   */
/* drawing                                                                   */
/*                                                                           */
/*****************************************************************************/

gint glarea_motion_notify (GtkWidget* widget, GdkEventMotion* event) {

  int x;
  int y;

  GdkModifierType state;

  if (event->is_hint) {
    GdkWindow *window = gdk_event_get_window ((GdkEvent *)event);
    GdkDevice *device = gdk_event_get_device ((GdkEvent *)event);
    gdk_window_get_device_position (window, device, &x, &y, &state);
  } else {
    x = event->x;
    y = event->y;
    state = event->state;
  }

  if (state & GDK_BUTTON1_MASK) {

    /* Mouse button 1 is engaged */
    g_print ("Button 1 motion  (%d, %d)\n", x, y);

  }

  if (state & GDK_BUTTON2_MASK) {

    /* Mouse button 2 is engaged */
    g_print ("Button 2 motion  (%d, %d)\n", x, y);

  }

  return TRUE;

}

/*****************************************************************************/
/*                                                                           */
/* Function: glarea_draw (GtkWidget*, cairo_t *cr, gpointer user_data)       */
/*                                                                           */
/* This is the function that should render your scene to the GglaArea. It   */
/* can be used as a callback to the 'draw' signal.                           */
/*                                                                           */
/*****************************************************************************/

gboolean glarea_draw (GtkWidget* widget, cairo_t *cr, gpointer user_data) {

  g_print ("Draw Signal\n");

  /* ggla_area_make_current MUST be called before rendering */
  /* into the GglaArea.                                      */

  if (ggla_area_make_current(GGLA_AREA(widget))) {

    /* Clear the drawing color buffer and depth buffers */
    /* before drawing.                                  */

    glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    /*                                */
    /* Insert your drawing code here. */
    /*                                */

    /* Swap the back and front buffers. Using doublebuffers */
    /* is definitely recommended! Take a look at the red    */
    /* book if you don't already have an understanding of   */
    /* single vs. double buffered windows.                  */

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

  g_print ("Reshape Event\n");

  /* ggla_area_make_current MUST be called before rendering */
  /* into the GglaArea.                                      */

  if (ggla_area_make_current (GGLA_AREA(widget))) {

    /* This is an example 2D reshape function. Writing reshape */
    /* functions is beyond the scope of this demo. Check the   */
    /* red book or the www.opengl.org for more information on  */
    /* how to write reshape code to suit your needs.           */

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

  g_print ("Realize Event\n");

  /* ggla_area_make_current MUST be called before rendering */
  /* into the GglaArea.                                      */

  if (ggla_area_make_current (GGLA_AREA(widget))) {

    /* Insert your OpenGL initialization code here */

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

  g_print ("GTK GL Area Destroy Event\n");

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
  GtkWidget* box_main;
  GtkWidget* glarea;

  gtk_init (&argc, &argv);

  /* Main widget container */

  box_main = gtk_box_new (GTK_ORIENTATION_VERTICAL, 10);

  /* GTK GL Area */

  glarea = create_glarea ();

  /* Quit button */

  button_quit = gtk_button_new_with_label ("Quit");

  g_signal_connect (G_OBJECT(button_quit), "clicked",
                    G_CALLBACK(gtk_main_quit), NULL);

  /* Main window */

  window = gtk_window_new (GTK_WINDOW_TOPLEVEL);

  gtk_window_set_title (GTK_WINDOW(window), "GglaArea Demo");

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

  gtk_box_pack_start (GTK_BOX(box_main), glarea,      FALSE, TRUE, 0);
  gtk_box_pack_start (GTK_BOX(box_main), button_quit, FALSE, TRUE, 0);
  gtk_container_add (GTK_CONTAINER(window), box_main);

  gtk_widget_show (glarea);
  gtk_widget_show (button_quit);
  gtk_widget_show (box_main);
  gtk_widget_show (window);

  gtk_main ();

  return (0);

}
