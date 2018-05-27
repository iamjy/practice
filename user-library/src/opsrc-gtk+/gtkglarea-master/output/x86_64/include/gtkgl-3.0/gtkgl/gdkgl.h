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

#ifndef __GGLA_CONTEXT_H__
#define __GGLA_CONTEXT_H__

#include <glib.h>

#ifdef G_OS_WIN32
 /* The GL/gl.h on Windows requires you to include <windows.h>
  * anyway, so we might as well include it here.
  */
 #include <windows.h>
#endif

#include <gdk/gdk.h>

G_BEGIN_DECLS

/*
 * These definitions are duplicated from GL/glx.h that comes with Mesa.
 * I don't want every program to include GL/glx.h because GglaArea
 * supports lecacy systems like Windows. You can still use GLX_xxxx
 * attributes with these, but then you lose portability.
 */
enum _GGLA_CONFIGS {
	GGLA_NONE		= 0,
	GGLA_USE_GL		= 1,
	GGLA_BUFFER_SIZE	= 2,
	GGLA_LEVEL		= 3,
	GGLA_RGBA		= 4,
	GGLA_DOUBLEBUFFER	= 5,
	GGLA_STEREO		= 6,
	GGLA_AUX_BUFFERS	= 7,
	GGLA_RED_SIZE		= 8,
	GGLA_GREEN_SIZE		= 9,
	GGLA_BLUE_SIZE		= 10,
	GGLA_ALPHA_SIZE		= 11,
	GGLA_DEPTH_SIZE		= 12,
	GGLA_STENCIL_SIZE	= 13,
	GGLA_ACCUM_RED_SIZE	= 14,
	GGLA_ACCUM_GREEN_SIZE	= 15,
	GGLA_ACCUM_BLUE_SIZE	= 16,
	GGLA_ACCUM_ALPHA_SIZE	= 17,

	/* GLX_EXT_visual_info extension */
	GGLA_X_VISUAL_TYPE_EXT			= 0x22,
	GGLA_TRANSPARENT_TYPE_EXT		= 0x23,
	GGLA_TRANSPARENT_INDEX_VALUE_EXT	= 0x24,
	GGLA_TRANSPARENT_RED_VALUE_EXT		= 0x25,
	GGLA_TRANSPARENT_GREEN_VALUE_EXT	= 0x26,
	GGLA_TRANSPARENT_BLUE_VALUE_EXT		= 0x27,
	GGLA_TRANSPARENT_ALPHA_VALUE_EXT	= 0x28
};


#define GGLA_TYPE_CONTEXT            (ggla_context_get_type())
#define GGLA_CONTEXT(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), GGLA_TYPE_CONTEXT, GglaContext))
#define GGLA_CONTEXT_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST (klass, GGLA_TYPE_CONTEXT, GglaContextClass))
#define GGLA_IS_CONTEXT(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GGLA_TYPE_CONTEXT))
#define GGLA_IS_CONTEXT_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), GGLA_TYPE_CONTEXT))
#define GGLA_CONTEXT_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS ((obj), GGLA_TYPE_CONTEXT, GglaContext))

typedef struct _GglaContext GglaContext;


gint             ggla_query                             (void);
gchar           *ggla_get_info                          (void);

GdkVisual       *ggla_choose_visual                     (int         *attrlist);
int              ggla_get_config                        (GdkVisual   *visual,
                                                         int          attrib);

GType            ggla_context_get_type                  (void);
GglaContext     *ggla_context_new                       (GdkVisual   *visual);
GglaContext     *ggla_context_share_new                 (GdkVisual   *visual,
                                                         GglaContext *sharelist,
                                                         gint         direct);
GglaContext     *ggla_context_attrlist_share_new        (int         *attrlist,
                                                         GglaContext *sharelist,
                                                         gint         direct);

gint             ggla_make_current                      (GdkWindow   *gdkwindow,
                                                         GglaContext *context);
void             ggla_swap_buffers                      (GdkWindow   *gdkwindow);


void             ggla_wait_gdk                          (void);
void             ggla_wait_gl                           (void);


G_END_DECLS

#endif /* __GGLA_CONTEXT_H__ */

