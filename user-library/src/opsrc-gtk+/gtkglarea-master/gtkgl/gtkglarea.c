/*
 * Copyright (C) 1997-1998 Janne Löf <jlof@mail.student.oulu.fi>
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

#include "config.h"

#include <stdarg.h>

#include "gdkgl.h"
#include "gtkglarea.h"

static void ggla_area_finalize       (GObject      *object);

G_DEFINE_TYPE (GglaArea, ggla_area, GTK_TYPE_DRAWING_AREA);

static void
ggla_area_class_init (GglaAreaClass *klass)
{
  GObjectClass *object_class;

  object_class = (GObjectClass*) klass;

  object_class->finalize = ggla_area_finalize;
}


static void
ggla_area_init (GglaArea *gl_area)
{
  gl_area->glcontext = NULL;
  gtk_widget_set_double_buffered(GTK_WIDGET(gl_area), FALSE);
}



GtkWidget*
ggla_area_new_vargs(GglaArea *share, ...)
{
  GtkWidget *glarea;
  va_list ap;
  int i;
  gint *attrlist;

  va_start(ap, share);
  i=1;
  while (va_arg(ap, int) != GGLA_NONE) /* get number of arguments */
    i++;
  va_end(ap);

  attrlist = g_new(int,i);

  va_start(ap,share);
  i=0;
  while ( (attrlist[i] = va_arg(ap, int)) != GGLA_NONE) /* copy args to list */
    i++;
  va_end(ap);

  glarea = ggla_area_share_new(attrlist, share);

  g_free(attrlist);

  return glarea;
}

GtkWidget*
ggla_area_new (int *attrlist)
{
  return ggla_area_share_new(attrlist, NULL);
}

GtkWidget*
ggla_area_share_new (int *attrlist, GglaArea *share)
{
  GglaContext *glcontext;
  GglaArea *gl_area;
#if defined GDK_WINDOWING_X11
  GdkVisual *visual;
#endif

  g_return_val_if_fail(share == NULL || GGLA_IS_WIDGET(share), NULL);

#if defined GDK_WINDOWING_X11
  visual = ggla_choose_visual(attrlist);
  if (visual == NULL)
    return NULL;

  glcontext = ggla_context_share_new(visual, share ? share->glcontext : NULL, TRUE);
#else
  glcontext = ggla_context_attrlist_share_new(attrlist, share ? share->glcontext : NULL, TRUE);
#endif
  if (glcontext == NULL)
    return NULL;

  gl_area = g_object_new(GGLA_TYPE_WIDGET, NULL);
  gl_area->glcontext = glcontext;

  return GTK_WIDGET(gl_area);
}


static void
ggla_area_finalize(GObject *object)
{
  GglaArea *gl_area = GGLA_AREA(object);

  if (gl_area->glcontext)
    g_object_unref(gl_area->glcontext);
  gl_area->glcontext = NULL;

  G_OBJECT_CLASS (ggla_area_parent_class)->finalize (object);
}


gint ggla_area_make_current(GglaArea *gl_area)
{
  g_return_val_if_fail(gl_area != NULL, FALSE);
  g_return_val_if_fail(GGLA_IS_WIDGET (gl_area), FALSE);
  GtkWidget *widget = GTK_WIDGET (gl_area);
  g_return_val_if_fail(gtk_widget_get_realized(widget), FALSE);

  return ggla_make_current(gtk_widget_get_window (widget),
                          gl_area->glcontext);
}

void ggla_area_swap_buffers(GglaArea *gl_area)
{
  g_return_if_fail(gl_area != NULL);
  g_return_if_fail(GGLA_IS_WIDGET(gl_area));
  GtkWidget *widget = GTK_WIDGET (gl_area);
  g_return_if_fail(gtk_widget_get_realized(widget));

  ggla_swap_buffers(gtk_widget_get_window (widget));
}
