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


#ifndef __GGLA_AREA_H__
#define __GGLA_AREA_H__

#include <gdk/gdk.h>
#include <gtkgl/gdkgl.h>
#include <gtk/gtk.h>


G_BEGIN_DECLS

#define GGLA_TYPE_WIDGET            (ggla_area_get_type())
#define GGLA_AREA(obj)              (G_TYPE_CHECK_INSTANCE_CAST ((obj), GGLA_TYPE_WIDGET, GglaArea))
#define GGLA_AREA_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST (klass, GGLA_TYPE_WIDGET, GglaAreaClass))
#define GGLA_IS_WIDGET(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GGLA_TYPE_WIDGET))
#define GGLA_IS_WIDGET_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), GGLA_TYPE_WIDGET))
#define GGLA_AREA_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), GGLA_TYPE_WIDGET, GglaArea))


typedef struct _GglaArea       GglaArea;
typedef struct _GglaAreaClass  GglaAreaClass;


struct _GglaArea
{
  GtkDrawingArea  darea;
  GglaContext *glcontext;
};

struct _GglaAreaClass
{
  GtkDrawingAreaClass parent_class;
};

GType      ggla_area_get_type     (void);
GtkWidget* ggla_area_new          (int        *attrList);
GtkWidget* ggla_area_share_new    (int        *attrList,
                                   GglaArea *share);
GtkWidget* ggla_area_new_vargs    (GglaArea *share,
				   ...);


gint       ggla_area_make_current (GglaArea *glarea);

void       ggla_area_swap_buffers (GglaArea *glarea);


G_END_DECLS

#endif /* __GGLA_AREA_H__ */
