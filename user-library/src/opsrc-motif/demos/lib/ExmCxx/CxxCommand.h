/* $XConsortium: CxxCommand.h /main/4 1995/07/15 20:42:15 drk $ */
/* This may look like C code, but it is really -*- C++ -*- */
/*
 *  @OPENGROUP_COPYRIGHT@
 *  COPYRIGHT NOTICE
 *  Copyright (c) 1990, 1991, 1992, 1993 Open Software Foundation, Inc.
 *  Copyright (c) 1996, 1997, 1998, 1999, 2000 The Open Group
 *  ALL RIGHTS RESERVED (MOTIF). See the file named COPYRIGHT.MOTIF for
 *  the full copyright text.
 *  
 *  This software is subject to an open license. It may only be
 *  used on, with or for operating systems which are themselves open
 *  source systems. You must contact The Open Group for a license
 *  allowing distribution and sublicensing of this software on, with,
 *  or for operating systems which are not Open Source programs.
 *  
 *  See http://www.opengroup.org/openmotif/license for full
 *  details of the license agreement. Any use, reproduction, or
 *  distribution of the program constitutes recipient's acceptance of
 *  this agreement.
 *  
 *  EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, THE PROGRAM IS
 *  PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, EITHER EXPRESS OR IMPLIED INCLUDING, WITHOUT LIMITATION, ANY
 *  WARRANTIES OR CONDITIONS OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY
 *  OR FITNESS FOR A PARTICULAR PURPOSE
 *  
 *  EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, NEITHER RECIPIENT
 *  NOR ANY CONTRIBUTORS SHALL HAVE ANY LIABILITY FOR ANY DIRECT,
 *  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 *  DAMAGES (INCLUDING WITHOUT LIMITATION LOST PROFITS), HOWEVER CAUSED
 *  AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 *  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 *  ANY WAY OUT OF THE USE OR DISTRIBUTION OF THE PROGRAM OR THE
 *  EXERCISE OF ANY RIGHTS GRANTED HEREUNDER, EVEN IF ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGES.
 */
/*
 * HISTORY
 */

/*
 * This is the header file for the C++ version of StaticText widget.
 * It contains #ifdef __cplusplus clause to make it possible
 * to include it from a C source file.
 */

#ifndef _CxxCommand_h
#define _CxxCommand_h

#ifdef __cplusplus

#include "CxxString.h"


/**********************************
 * Widget class record definition *
 **********************************/

class ExmCxxCommandClass : public ExmCxxStringClass {

    friend class ExmCxxCommand;

  public:
    
    ExmCxxCommandClass(char*		name,
		      WidgetClass	parent,
		      Cardinal		widgetSize,
		      XtProc		class_init,
		      XtActionList	actions,
		      Cardinal		num_actions,
		      XtResourceList	resources,
		      Cardinal		num_resources,
		      XtInitProc	cxx_cast);
    
    /*
     * static class-methods
     * (must be public : passed as parameter to class_rec static constructor)
     */
    static void		ClassInitialize();

  protected:
    virtual void        class_part_initialize();
};



/***************************
 * Widget class definition *
 ***************************/


struct ExmCxxCommandPart {
  XtCallbackList	activate_callback;

  /* armed is a flag.  If its value is True, then the user has selected the
     widget.  */
  Boolean		armed;

  /* visual_armed is a flag.  If its value is True, then the widget is to
     visually represent its armed state by drawing a certain kind 
     of shadow. */ 
  Boolean		visual_armed;
  
  /* visual_timer holds an integral value representing the time
     (in milliseconds) between when armed is set to True and
     visual_armed is set to True. */ 
  XtIntervalId		visual_timer;
};


class ExmCxxCommand : public ExmCxxString {

    friend class ExmCxxCommandClass;
    friend class ExmCxxCommandActions;
    
  public:
    /*
     * should really be protected but we must reference fields when
     * declaring the static resources array;
     */
    ExmCxxCommandPart	command;
    
  protected:
    
    /*
     * constructors & destructors
     */
    ~ExmCxxCommand();
    
    /*
     * virtual chained class-methods
     */
    // core class part;
    virtual void	initialize(Widget req_w, ArgList, Cardinal*);
    virtual Boolean	set_values(Widget old_w, Widget req_w,
				   ArgList, Cardinal*);
    
    /*
     * virtual self contained class-methods
     */
    // StaticText class part;
    virtual void	draw_shadow();
    
  public:
    
    /*
     * static class-methods
     * (must be public : passed as parameter to class_rec static constructor)
     */
    static void		_MakeCxxWidget(Widget req, Widget new_w,
				       ArgList, Cardinal*);
    /* 
     * Trait methods
     */
    static void		ChangeCB(Widget w, XtCallbackProc activCB,
				 XtPointer closure, Boolean setunset);
    static void		ShowAsDefault(Widget w, XtEnum state);
};

typedef ExmCxxCommandClass	*ExmCxxCommandWidgetClass;
typedef ExmCxxCommand		*ExmCxxCommandWidget;

externalref ExmCxxCommandClass	exmCxxCommandClassRec;

#endif /* __cplusplus */

/* These symbols may be used from C code */
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */
extern Widget			ExmCreateCxxCommand(Widget parent, char *name,
						   ArgList, Cardinal);
#ifdef __cplusplus
}
#endif /* __cplusplus */

externalref WidgetClass		exmCxxCommandWidgetClass;

#ifndef XmIsCxxCommand
#define XmIsCxxCommand(w)	XtIsSubclass(w, exmCxxCommandWidgetClass)
#endif

#endif /* _CxxCommand_h */
/* DON'T ADD ANYTHING AFTER THIS #endif */
