/*
 * Copyright (C) 1998 Janne Löf <jlof@mail.student.oulu.fi>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the Free
 * Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

#include <math.h>
#include <gtk/gtk.h>
#include <gtkgl/gtkglarea.h>
#include <epoxy/gl.h>

gint init(GtkWidget *widget)
{
  /* OpenGL functions can be called only if make_current returns true */
  if (ggla_area_make_current(GGLA_AREA(widget)))
    {
      GtkAllocation allocation;
      gtk_widget_get_allocation (widget, &allocation);
      glViewport(0, 0, allocation.width, allocation.height);
      glMatrixMode(GL_PROJECTION);
      glLoadIdentity();
      glOrtho(0,100, 100,0, -1,1);
      glMatrixMode(GL_MODELVIEW);
      glLoadIdentity();
    }
  return TRUE;
}


/* When widget is exposed it's contents are redrawn. */
gboolean draw (GtkWidget *widget, cairo_t *cr, gpointer data)
{
  /* OpenGL functions can be called only if make_current returns true */
  if (ggla_area_make_current(GGLA_AREA(widget)))
    {

      /* Draw simple triangle */
      glClearColor(0,0,0,1);
      glClear(GL_COLOR_BUFFER_BIT);
      glColor3f(1,1,1);
      glBegin(GL_TRIANGLES);
      glVertex2f(10,10);
      glVertex2f(10,90);
      glVertex2f(90,90);
      glEnd();

      /* Swap backbuffer to front */
      ggla_area_swap_buffers(GGLA_AREA(widget));

    }

  return TRUE;
}

/* When glarea widget size changes, viewport size is set to match the new size */
gint reshape(GtkWidget *widget, GdkEventConfigure *event)
{
  /* OpenGL functions can be called only if make_current returns true */
  if (ggla_area_make_current(GGLA_AREA(widget)))
    {
      GtkAllocation allocation;
      gtk_widget_get_allocation (widget, &allocation);
      glViewport(0, 0, allocation.width, allocation.height);
    }
  return TRUE;
}


int main(int argc, char **argv)
{
  GtkWidget *window,*glarea;
  gchar *info_str;

  /* Attribute list for gtkglarea widget. Specifies a
     list of Boolean attributes and enum/integer
     attribute/value pairs. The last attribute must be
     GGLA_NONE. See glXChooseVisual manpage for further
     explanation.
  */
  int attrlist[] = {
    GGLA_RGBA,
    GGLA_RED_SIZE,1,
    GGLA_GREEN_SIZE,1,
    GGLA_BLUE_SIZE,1,
    GGLA_DOUBLEBUFFER,
    GGLA_NONE
  };

  /* initialize gtk */
  gtk_init(&argc, &argv);

  /* Check if OpenGL is supported. */
  if (ggla_query() == FALSE) {
    g_print("OpenGL not supported\n");
    return 0;
  }


  /* Create new top level window. */
  window = gtk_window_new( GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title(GTK_WINDOW(window), "Simple");
  gtk_container_set_border_width(GTK_CONTAINER(window), 10);

  /* Quit form main if got delete event */
  g_signal_connect(G_OBJECT(window), "delete-event",
                   G_CALLBACK(gtk_main_quit), NULL);


  /* Create new OpenGL widget. */
  glarea = GTK_WIDGET(ggla_area_new(attrlist));
  /* Events for widget must be set before X Window is created */
  gtk_widget_set_events(GTK_WIDGET(glarea),
			GDK_EXPOSURE_MASK|
			GDK_BUTTON_PRESS_MASK);

  /* Connect signal handlers */
  /* Redraw image when exposed. */
  g_signal_connect(G_OBJECT(glarea), "draw",
                   G_CALLBACK(draw), NULL);
  /* When window is resized viewport needs to be resized also. */
  g_signal_connect(G_OBJECT(glarea), "configure-event",
                   G_CALLBACK(reshape), NULL);
  /* Do initialization when widget has been realized. */
  g_signal_connect(G_OBJECT(glarea), "realize",
                   G_CALLBACK(init), NULL);

  /* set minimum size */
  gtk_widget_set_size_request(GTK_WIDGET(glarea), 100,100);

  /* put glarea into window and show it all */
  gtk_container_add(GTK_CONTAINER(window),GTK_WIDGET(glarea));
  gtk_widget_show(GTK_WIDGET(glarea));
  gtk_widget_show(GTK_WIDGET(window));

  /* vendor dependent version info string */
  info_str = ggla_get_info();
  g_print(info_str);
  g_free(info_str);

  gtk_main();

  return 0;
}
