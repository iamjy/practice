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


/* Zktor is a word that does not mean anything and is difficult to pronounce. */
/* I apologize for horrible coding. */


#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <glib.h>
#include <gtk/gtk.h>
#include <gdk/gdk.h>
#include <gdk/gdkkeysyms.h>
#include <gtkgl/gtkglarea.h>
#include <epoxy/gl.h>

#ifndef M_PI
#define M_PI 3.14
#endif


#if 0
#define FULLSCREEN_MESA_3DFX /* uncomment this to get 3DFX acceleration */
#endif

#ifdef FULLSCREEN_MESA_3DFX
#include <GL/xmesa.h>
#endif



typedef struct {
  int   state; /* zero state means dead */
  float timer;
  float pos_x,pos_y;
  float vel_x,vel_y;
  float dir;
  float radius;
} Entity;

/* game state */

GTimer *gtimer = NULL;

double game_time;
double game_tick;
int draw_fast = 0;

int wave_cnt;
double wave_time;
double vortex_time;

int control_speed;
int control_spin;
int control_fire;

int score = 0;
int highscore = 0;

Entity player;
Entity enemy[10];
Entity vortex[10];
Entity p_bullet[20];
Entity e_bullet[20];
Entity particle[60];

GLuint fontbase = 0;


float rnd()
{
  return (1.0*rand()/(RAND_MAX+1.0));
}
int collision(const Entity *a, const Entity *b)
{
  if (a->state && b->state) {
    float dx = a->pos_x  - b->pos_x;
    float dy = a->pos_y  - b->pos_y;
    float r  = a->radius + b->radius;
    if (dx*dx+dy*dy < r*r)
      return TRUE;
  }
  return FALSE;
}

void gCircle(float radius, int points)
{
  float a,step = 360.0/points;
  for (a = 0; a < 360.0; a += step) {
    float dx = -sin(a*M_PI/180);
    float dy =  cos(a*M_PI/180);
    glVertex2f(dx*radius,dy*radius);
  }
}


void game_init()
{
  int i;

  if (!gtimer)
    gtimer = g_timer_new();
  g_timer_reset(gtimer);

  game_time = g_timer_elapsed(gtimer, NULL);
  game_tick  = 1.0 / 60;

  wave_cnt = 0;
  wave_time = game_time + 5; /* give 5 secs before start of waves */
  vortex_time = game_time + 3; /* give 3 secs before 1st vortex */


  control_speed = 0;
  control_spin  = 0;
  control_fire  = 0;

  score = 0;

  player.state = 1;
  player.timer = game_time;
  player.pos_x = 0;
  player.pos_y = 0;
  player.vel_x = 0;
  player.vel_y = 0;
  player.dir   = 0;
  player.radius= 5;


  for (i=0; i<sizeof(enemy)/sizeof(Entity); i++)
    enemy[i].state = 0;

  for (i=0; i<sizeof(vortex)/sizeof(Entity); i++)
    vortex[i].state = 0;

  for (i=0; i<sizeof(p_bullet)/sizeof(Entity); i++)
    p_bullet[i].state = 0;

  for (i=0; i<sizeof(e_bullet)/sizeof(Entity); i++)
    e_bullet[i].state = 0;
}
void game_play()
{
  int i;
  double time_now,tick_now;

  /* timing */
  time_now = g_timer_elapsed(gtimer, NULL);
  tick_now = time_now - game_time;
  if (tick_now < 0.001) tick_now = 0.001;
  if (tick_now > 0.2  ) tick_now = 0.2;
  game_tick = (tick_now + 4*game_tick)/5; /* average */
  game_time = time_now;


  /* is it time for next wave? */
  if (player.state && wave_time <= game_time) {
    wave_time = game_time + 20; /* 20 second waves */
    wave_cnt++;
    for (i=0; i<wave_cnt; i++) {
      int j;
      for (j=0; j<sizeof(enemy)/sizeof(Entity); j++) {
	if (!enemy[j].state) {
	  enemy[j].radius = 50;
	  do {
	    enemy[j].pos_x = rnd()*200 - 100;
	    enemy[j].pos_y = rnd()*200 - 100;
	  } while (collision(&enemy[j], &player));
	  enemy[j].state = 1;
	  enemy[j].timer = game_time;
	  enemy[j].vel_x = 0;
	  enemy[j].vel_y = 0;
	  enemy[j].dir = 360*rnd()-180;
	  enemy[j].radius = 5;
	  break;
	}
      }
    }
  }



  /* player */
  if (player.state) {
    float dx,dy;

    /* turn to direction given by spin control */
    player.dir   += 180 * control_spin  * game_tick;
    while (player.dir > 180) player.dir -= 360;
    while (player.dir <-180) player.dir += 360;
    /* unit direction vector */
    dx = -sin(player.dir*(M_PI/180));
    dy =  cos(player.dir*(M_PI/180));
    /* accelerate if speed control is pressed */
    player.vel_x += 50 * control_speed * dx * game_tick;
    player.vel_y += 50 * control_speed * dy * game_tick;
    /* move */
    player.pos_x += player.vel_x * game_tick;
    player.pos_y += player.vel_y * game_tick;
    /* collision to border */
    if (player.pos_x < -100) {
      player.pos_x = -100;
      player.vel_x = 0;
    }
    if (player.pos_x > 100) {
      player.pos_x = 100;
      player.vel_x = 0;
    }
    if (player.pos_y < -100) {
      player.pos_y = -100;
      player.vel_y = 0;
    }
    if (player.pos_y > 100) {
      player.pos_y = 100;
      player.vel_y = 0;
    }
    /* if fire is pressed and 0.2 secs has elapsed since last bullet fired */
    if (control_fire && (game_time - player.timer) > 0.2  ) {
      for (i=0; i<sizeof(p_bullet)/sizeof(Entity); i++) {
	if (!p_bullet[i].state) {
	  player.timer = game_time;
	  p_bullet[i].state = 1;
	  p_bullet[i].timer = game_time;
	  p_bullet[i].pos_x = player.pos_x + player.radius*dx;
	  p_bullet[i].pos_y = player.pos_y + player.radius*dy;
	  p_bullet[i].vel_x = player.vel_x + dx*100;
	  p_bullet[i].vel_y = player.vel_y + dy*100;
	  p_bullet[i].dir   = player.dir;
	  p_bullet[i].radius= .5;
	  break;
	}
      }
    }

    /* if speed control is pressed create more particles */
    if (control_speed) {
      for (i=0; i<sizeof(particle)/sizeof(Entity); i++) {
	if (!particle[i].state) {
	  float spread = rnd()*15 - 7.5;
	  particle[i].state = 1;
	  particle[i].timer = game_time + rnd()*.8 + .2;
	  particle[i].pos_x = player.pos_x - player.radius*dx;
	  particle[i].pos_y = player.pos_y - player.radius*dy;
	  particle[i].vel_x = player.vel_x - dx*25 - dy * spread;
	  particle[i].vel_y = player.vel_y - dy*25 + dx * spread;
	  particle[i].dir   = player.dir;
	  particle[i].radius= .1;
	  break;
	}
      }
    }


  } else {
    /* enemies continue to chase player position even if player is dead
       - make it center of screen if player is dead */
    player.pos_x = 0;
    player.pos_y = 0;
  }


  /* enemy */
  for (i=0; i<sizeof(enemy)/sizeof(Entity); i++) {
    if (enemy[i].state) {
      float x,y,dx,dy,a;
      int j;

      /* distance to player */
      x = player.pos_x - enemy[i].pos_x;
      y = player.pos_y - enemy[i].pos_y;
      /* calculate signed angle to player */
      a = enemy[i].dir + atan2(x,y) * 180/M_PI;
      while (a > 180) a-=360;
      while (a <-180) a+=360;
      /* turn towards player */
      if (a < -3) {
	enemy[i].dir += 90 * game_tick;
	while (enemy[i].dir > 180) enemy[i].dir -= 360;
      }
      if (a > 3) {
	enemy[i].dir -= 90 * game_tick;
	while (enemy[i].dir <-180) enemy[i].dir += 360;
      }
      /* unit direction vector */
      dx = -sin(enemy[i].dir*(M_PI/180));
      dy =  cos(enemy[i].dir*(M_PI/180));
      /* accelerate if player is ahead */
      if (fabs(a) < 10) {
	enemy[i].vel_x += 20*dx * game_tick;
	enemy[i].vel_y += 20*dy * game_tick;
      }
      /* move */
      enemy[i].pos_x += enemy[i].vel_x * game_tick;
      enemy[i].pos_y += enemy[i].vel_y * game_tick;
      /* collision to border */
      if (enemy[i].pos_x < -100) {
	enemy[i].pos_x = -100;
	enemy[i].vel_x = 0;
      }
      if (enemy[i].pos_x > 100) {
	enemy[i].pos_x = 100;
	enemy[i].vel_x = 0;
      }
      if (enemy[i].pos_y < -100) {
	enemy[i].pos_y = -100;
	enemy[i].vel_y = 0;
      }
      if (enemy[i].pos_y > 100) {
	enemy[i].pos_y = 100;
	enemy[i].vel_y = 0;
      }
      /* fire if player is alive and ahead */
      if (player.state && (fabs(a) < 20) && (game_time - enemy[i].timer) > .6) {
	for (j=0; j<sizeof(e_bullet)/sizeof(Entity); j++) {
	  if (!e_bullet[j].state) {
	    enemy[i].timer = game_time;
	    e_bullet[j].state = 1;
	    e_bullet[j].timer = game_time;
	    e_bullet[j].pos_x = enemy[i].pos_x + enemy[i].radius*dx;
	    e_bullet[j].pos_y = enemy[i].pos_y + enemy[i].radius*dy;
	    e_bullet[j].vel_x = enemy[i].vel_x + dx*60;
	    e_bullet[j].vel_y = enemy[i].vel_y + dy*60;
	    e_bullet[j].dir   = enemy[i].dir;
	    e_bullet[j].radius= .5;
	    break;
	  }
	}
      }
    }
  }


  /* vortex */
  for (i=0; i<sizeof(vortex)/sizeof(Entity); i++) {
    if (vortex[i].state) {
      int j;
      /* kill this vortex, time is up */
      if (vortex[i].timer < game_time) {
	vortex[i].state = 0;
	continue;
      }
      /* move */
      vortex[i].dir   += 60  * game_tick;
      vortex[i].pos_x += vortex[i].vel_x * game_tick;
      vortex[i].pos_y += vortex[i].vel_y * game_tick;
      /* collision to border */
      if (vortex[i].pos_x < -100) {
	vortex[i].pos_x = -200 - vortex[i].pos_x;
	vortex[i].vel_x = -vortex[i].vel_x;
      }
      if (vortex[i].pos_x > 100) {
	vortex[i].pos_x = 200 - vortex[i].pos_x;
	vortex[i].vel_x = -vortex[i].vel_x;
      }
      if (vortex[i].pos_y < -100) {
	vortex[i].pos_y = -200 - vortex[i].pos_y;
	vortex[i].vel_y = -vortex[i].vel_y;
      }
      if (vortex[i].pos_y > 100) {
	vortex[i].pos_y =  200 - vortex[i].pos_y;
	vortex[i].vel_y = -vortex[i].vel_y;
      }

      /* shake player */
      if (collision(&vortex[i], &player)) {
	player.vel_x += (rnd()*500 - 250) * game_tick;
	player.vel_y += (rnd()*500 - 250) * game_tick;
	player.dir   += (rnd()*180 -  90) * game_tick;
      }
      /* shake enemy */
      for (j=0; j<sizeof(enemy)/sizeof(Entity); j++) {
	if (collision(&vortex[i], &enemy[j])) {
	  enemy[j].vel_x += (rnd()*500 - 250) * game_tick;
	  enemy[j].vel_y += (rnd()*500 - 250) * game_tick;
	  enemy[i].dir   += (rnd()*180 -  90) * game_tick;
	}
      }

    } else if (vortex_time < game_time) {
      vortex_time = game_time + rnd()*10 + 5;
      do {
	vortex[i].pos_x  = 200*rnd()-100;
	vortex[i].pos_y  = 200*rnd()-100;
	vortex[i].radius = rnd()*10 + 10;
      } while (collision(&vortex[i], &player));
      vortex[i].state = 1;
      vortex[i].timer = game_time + rnd()*15 + 5;
      do vortex[i].vel_x = rnd()*30 - 15; while (fabs(vortex[i].vel_x) < 10);
      do vortex[i].vel_y = rnd()*30 - 15; while (fabs(vortex[i].vel_y) < 10);
      vortex[i].dir = 0;
    }
  }


  /* p_bullet */
  for (i=0; i<sizeof(p_bullet)/sizeof(Entity); i++) {
    if (p_bullet[i].state) {
      int j;
      /* move */
      p_bullet[i].pos_x += p_bullet[i].vel_x * game_tick;
      p_bullet[i].pos_y += p_bullet[i].vel_y * game_tick;
      /* collision to border kills bullet */
      if (p_bullet[i].pos_x < -115 ||
	  p_bullet[i].pos_x >  115 ||
	  p_bullet[i].pos_y < -115 ||
	  p_bullet[i].pos_y >  115) {
	p_bullet[i].state = 0;
      }
      /* collision to enemy. kills bullet and kills enemy */
      /* and adds 100 to score */
      for (j=0; j<sizeof(enemy)/sizeof(Entity); j++) {
	if (collision(&p_bullet[i],&enemy[j])) {
	  score += 100;
	  if (score > highscore) highscore = score;
	  p_bullet[i].state = 0;
	  enemy[j].state = 0;
	}
      }
      /* collision to vortex shakes bullet */
      for (j=0; j<sizeof(vortex)/sizeof(Entity); j++) {
	if (collision(&p_bullet[i], &vortex[j])) {
	  p_bullet[i].vel_x += (rnd()*600 - 300) * game_tick;
	  p_bullet[i].vel_y += (rnd()*600 - 300) * game_tick;
	  p_bullet[i].dir = rnd()*360-180;
	}
      }
    }
  }

  /* e_bullet */
  for (i=0; i<sizeof(e_bullet)/sizeof(Entity); i++) {
    if (e_bullet[i].state) {
      int j;
      /* move */
      e_bullet[i].pos_x += e_bullet[i].vel_x * game_tick;
      e_bullet[i].pos_y += e_bullet[i].vel_y * game_tick;
      /* collision to border kills bullet */
      if (e_bullet[i].pos_x < -115 ||
	  e_bullet[i].pos_x >  115 ||
	  e_bullet[i].pos_y < -115 ||
	  e_bullet[i].pos_y >  115)
	e_bullet[i].state = 0;
      /* collision to player kills bullet and kills player */
      if (collision(&e_bullet[i], &player)) {
	e_bullet[i].state = 0;
	player.state = 0;
      }
      /* collision to vortex shakes bullet */
      for (j=0; j<sizeof(vortex)/sizeof(Entity); j++) {
	if (collision(&p_bullet[i], &vortex[j])) {
	  e_bullet[i].vel_x += (rnd()*600 - 300) * game_tick;
	  e_bullet[i].vel_y += (rnd()*600 - 300) * game_tick;
	  e_bullet[i].dir = rnd()*360-180;
	}
      }
    }
  }

  /* particle */
  for (i=0; i<sizeof(particle)/sizeof(Entity); i++) {
    if (particle[i].state) {
      /* time elapsed, kill particle */
      if (particle[i].timer < game_time) {
	particle[i].state = 0;
	continue;
      }
      /* move */
      particle[i].pos_x += particle[i].vel_x * game_tick;
      particle[i].pos_y += particle[i].vel_y * game_tick;
    }
  }

}

void game_render()
{
  int i;

  /* drawmode */
  if (draw_fast) {
    glDisable(GL_LINE_SMOOTH);
    glDisable(GL_POINT_SMOOTH);
    glDisable(GL_BLEND);
  } else {
    glEnable(GL_LINE_SMOOTH);
    glEnable(GL_POINT_SMOOTH);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
  }


  /* view */
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  glOrtho(-115,115,-115,115,-1,1);
  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();

  /* clear background */
  glClearColor(0,0,0,1);
  glClear(GL_COLOR_BUFFER_BIT);

  /* frame around image */
  glColor3f(1,1,0);
  glBegin(GL_LINE_LOOP);
  glVertex2f(-110, 110);
  glVertex2f( 110, 110);
  glVertex2f( 110,-110);
  glVertex2f(-110,-110);
  glEnd();

  glColor3f(1,0,0);
  glBegin(GL_LINE_LOOP);
  glVertex2f(-105, 105);
  glVertex2f( 105, 105);
  glVertex2f( 105,-105);
  glVertex2f(-105,-105);
  glEnd();

  glColor3f(0,0,1);
  glBegin(GL_LINE_LOOP);
  glVertex2f(-100, 100);
  glVertex2f( 100, 100);
  glVertex2f( 100,-100);
  glVertex2f(-100,-100);
  glEnd();


  /* player */
  if (player.state) {
    glPushMatrix();
    glTranslatef(player.pos_x, player.pos_y, 0);
    glRotatef(player.dir, 0,0,1);

    glColor3f(.5,.5,1);
    glBegin(GL_LINE_LOOP);
    glVertex2f(-4,-4);
    glVertex2f( 0, 5);
    glVertex2f( 4,-4);
    glEnd();

    glColor3f(1,1,1);
    glBegin(GL_LINE_STRIP);
    glVertex2f(-2,-5);
    glVertex2f(-4,-2);
    glVertex2f(-2, 2);
    glVertex2f( 2, 2);
    glVertex2f( 4,-2);
    glVertex2f( 2,-5);
    glEnd();

    glPopMatrix();
  }

  /* enemy */
  for (i=0; i<sizeof(enemy)/sizeof(Entity); i++) {
    if (enemy[i].state) {
      glPushMatrix();
      glTranslatef(enemy[i].pos_x, enemy[i].pos_y, 0);

      glRotatef(enemy[i].dir, 0,0,1);

      glColor3f(1,0,0);
      glBegin(GL_LINE_STRIP);
      glVertex2f(-3,-4);
      glVertex2f(-5, 0);
      glVertex2f( 0, 5);
      glVertex2f( 5, 0);
      glVertex2f( 3,-4);
      glEnd();
      glColor3f(1,1,0);
      glBegin(GL_LINE_LOOP);
      glVertex2f( 0, 5);
      glVertex2f( 3,-4);
      glVertex2f(-3,-4);
      glEnd();

      glPopMatrix();
    }
  }

  /* vortex */
  for (i=0; i<sizeof(vortex)/sizeof(Entity); i++) {
    if (vortex[i].state) {

      glPushMatrix();
      glTranslatef(vortex[i].pos_x, vortex[i].pos_y, 0);
      glRotatef(vortex[i].dir, 0,0,1);

      glColor3f(0,.5,1);
      glBegin(GL_LINE_LOOP);
      gCircle(vortex[i].radius,6);
      glEnd();

      glColor3f(0,0,1);
      glBegin(GL_LINE_LOOP);
      gCircle(vortex[i].radius*.7, 6);
      glEnd();

      glColor3f(0,0,.5);
      glBegin(GL_LINE_LOOP);
      gCircle(vortex[i].radius*.4, 6);
      glEnd();

      glPopMatrix();
    }
  }

  /* p_bullet */
  for (i=0; i<sizeof(p_bullet)/sizeof(Entity); i++) {
    if (p_bullet[i].state) {
      glPushMatrix();
      glTranslatef(p_bullet[i].pos_x, p_bullet[i].pos_y, 0);
      glRotatef(p_bullet[i].dir, 0,0,1);

      glColor3f(1,1,1);
      glBegin(GL_LINES);
      glVertex2f(0, 1);
      glVertex2f(0,-1);
      glEnd();

      glPopMatrix();
    }
  }

  /* e_bullet */
  for (i=0; i<sizeof(e_bullet)/sizeof(Entity); i++) {
    if (e_bullet[i].state) {
      glPushMatrix();
      glTranslatef(e_bullet[i].pos_x, e_bullet[i].pos_y, 0);
      glRotatef(e_bullet[i].dir, 0,0,1);

      glColor3f(1,1,0);
      glBegin(GL_LINES);
      glVertex2f(0, 1);
      glVertex2f(0,-1);
      glEnd();

      glPopMatrix();
    }
  }

  /* particles */
  glColor3f(.5,.7,1);
  glBegin(GL_POINTS);
  for (i=0; i<sizeof(particle)/sizeof(Entity); i++) {
    if (particle[i].state)
      glVertex2f(particle[i].pos_x, particle[i].pos_y);
  }
  glEnd();

  /* textual info */
  if (fontbase) {
    char s[200];
    g_snprintf(s, sizeof(s), "wave %d score %d highscore %d", wave_cnt, score, highscore);

    glColor3f(.8,.8,.8);
    glRasterPos2f(-90, 90);
    glListBase(fontbase);
    glCallLists(strlen(s), GL_UNSIGNED_BYTE, s);

  }
}



/* --------------------------------------- */


#ifdef FULLSCREEN_MESA_3DFX

gint switch_fullscreen(GtkWidget *gl_area)
{
  static GtkWidget *fullscreenwidget = NULL;

  if (!fullscreenwidget)
    {
      /* Grab keyboard and pointer so that user does not wander off the game
	 window while in fullscreen mode.
      */
      if (gdk_keyboard_grab(gl_area->window, FALSE, GDK_CURRENT_TIME) == 0)
	{
	  if (gdk_pointer_grab(gl_area->window, FALSE, 0, NULL, NULL, GDK_CURRENT_TIME) == 0)
	    {
	      gtk_widget_grab_focus(gl_area);
	      if (ggla_area_make_current(GGLA_AREA(gl_area)))
		{
		  if (XMesaSetFXmode((XMESA_FX_FULLSCREEN)))
		    {
		      fullscreenwidget = gl_area;
		      return TRUE;
		    }
		}
	      gdk_pointer_ungrab(GDK_CURRENT_TIME);
	    }
	  gdk_keyboard_ungrab(GDK_CURRENT_TIME);
	}
      return FALSE;
    }

  if (fullscreenwidget == gl_area)
    {
      if (ggla_area_make_current(GGLA_AREA(gl_area)))
	XMesaSetFXmode(XMESA_FX_WINDOW);

      gdk_keyboard_ungrab(GDK_CURRENT_TIME);
      gdk_pointer_ungrab(GDK_CURRENT_TIME);
      fullscreenwidget = NULL;
      return TRUE;
    }

  return FALSE;
}

#endif




gint init(GtkWidget *widget)
{
  /* OpenGL functions can be called only if makecurrent returns true */
  if (ggla_area_make_current(GGLA_AREA(widget))) {

    /* set viewport */
    GtkAllocation allocation;
    gtk_widget_get_allocation (widget, &allocation);
    glViewport(0, 0, allocation.width, allocation.height);
  }
  return TRUE;
}


/* When widget is exposed it's contents are redrawn. */
gboolean  draw (GtkWidget *widget, cairo_t *cr, gpointer user_data)
{
  if (ggla_area_make_current(GGLA_AREA(widget)))
    game_render();

  /* Swap backbuffer to front */
  ggla_area_swap_buffers(GGLA_AREA(widget));

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


gint key_press_event(GtkWidget *widget, GdkEventKey *event)
{
  switch (event->keyval) {
  case GDK_KEY_Left:
    control_spin = 1;
    break;
  case GDK_KEY_Right:
    control_spin = -1;
    break;
  case GDK_KEY_Up:
  case GDK_KEY_space:
    control_fire = 1;
    break;
  case GDK_KEY_Down:
    control_speed = 1;
    break;
  case GDK_KEY_r:
    game_init();
    break;
  case GDK_KEY_q:
    gtk_main_quit();
    break;

#ifdef FULLSCREEN_MESA_3DFX
  case GDK_KEY_f:
    switch_fullscreen(widget);
    break;
#endif

  case GDK_KEY_d:
    draw_fast = (!draw_fast);
    break;
  }
  /* prevent the default handler from being run */
  g_signal_stop_emission_by_name(G_OBJECT(widget),"key-press-event");

  return TRUE;
}

gint key_release_event(GtkWidget *widget, GdkEventKey *event)
{
  switch (event->keyval) {
  case GDK_KEY_Left:
    if (control_spin == 1) control_spin = 0;
    break;
  case GDK_KEY_Right:
    if (control_spin == -1) control_spin = 0;
    break;
  case GDK_KEY_Up:
  case GDK_KEY_space:
    control_fire = 0;
    break;
  case GDK_KEY_Down:
    control_speed = 0;
    break;
  }
  /* prevent the default handler from being run */
  g_signal_stop_emission_by_name(G_OBJECT(widget),"key-release-event");
  return TRUE;
}

gint animate(GtkWidget *glarea)
{
  game_play();
  gtk_widget_queue_draw (glarea);
  return TRUE;
}


int main(int argc, char **argv)
{
  GtkWidget *window,*vbox,*logo,*glarea;

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

#ifdef FULLSCREEN_MESA_3DFX
  setenv("MESA_GLX_FX", "", 1);
  setenv("FX_GLIDE_NO_SPLASH", "", 1);
#endif

  /* initialize gtk */
  gtk_init(&argc, &argv);

  /* Check if OpenGL (GLX extension) is supported. */
  if (ggla_query() == FALSE) {
    g_print("OpenGL not supported\n");
    return 0;
  }

  /* Create new top level window. */
  window = gtk_window_new( GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title(GTK_WINDOW(window), "Zktor");

  /* Quit form main if got delete event */
  g_signal_connect(G_OBJECT(window), "delete-event",
                   G_CALLBACK(gtk_main_quit), NULL);


  vbox = GTK_WIDGET(gtk_box_new(GTK_ORIENTATION_VERTICAL, 0));
  gtk_container_set_border_width(GTK_CONTAINER(vbox), 10);


  logo = gtk_label_new("Zktor");


  /* Create new OpenGL widget. */
  glarea = GTK_WIDGET(ggla_area_new(attrlist));
  /* Events for widget must be set before X Window is created */
  gtk_widget_set_events(GTK_WIDGET(glarea),
			GDK_EXPOSURE_MASK|
			GDK_KEY_PRESS_MASK|
			GDK_KEY_RELEASE_MASK);
  /* set minimum size */
  /*  gtk_widget_set_size_request(GTK_WIDGET(glarea), 200,200); */
  /* set default size */
  gtk_widget_set_size_request(glarea, 640, 400);


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
  /* Capture keypress events */
  g_signal_connect(G_OBJECT(glarea), "key-press-event",
                   G_CALLBACK(key_press_event), NULL);
  g_signal_connect(G_OBJECT(glarea), "key-release-event",
                   G_CALLBACK(key_release_event), NULL);

  /* construct widget hierarchy  */
  gtk_container_add(GTK_CONTAINER(window),GTK_WIDGET(vbox));
  gtk_box_pack_start(GTK_BOX(vbox),   logo, FALSE, FALSE, 0);
  gtk_box_pack_start(GTK_BOX(vbox), glarea,  TRUE,  TRUE, 0);



  /* show all widgets */
  gtk_widget_show(GTK_WIDGET(glarea));
  gtk_widget_show(GTK_WIDGET(logo));
  gtk_widget_show(GTK_WIDGET(vbox));
  gtk_widget_show(window);

  /* set focus to glarea widget */
  gtk_widget_set_can_focus (glarea, TRUE);
  gtk_widget_grab_focus(GTK_WIDGET(glarea));

  /* animating */
  g_idle_add((GSourceFunc)animate, glarea);

  game_init();
  gtk_main();


  return 0;
}
