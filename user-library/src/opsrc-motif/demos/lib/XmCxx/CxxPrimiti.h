/* $XConsortium: CxxPrimiti.h /main/4 1995/07/15 20:58:59 drk $ */
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
 * This is the header file for the C++ version of Primitive widget.
 * It contains #ifdef __cplusplus clause to make it possible
 * to include it from a C source file.
 */

#ifndef _CxxPrimiti_h
#define _CxxPrimiti_h

#ifdef __cplusplus

#include <X11/IntrinsicP.h>
#include <Xm/Xm.h>
#include <Xm/PrimitiveP.h>


/**********************************
 * Widget class record definition *
 **********************************/

class XmCxxPrimitiveClass {

    friend class XmCxxPrimitive;

  public:
    
    XmCxxPrimitiveClass(char*		name,
			WidgetClass	parent,
			Cardinal	widgetSize,
			XtProc		class_init,
			XtActionList	actions,
			Cardinal	num_actions,
			XtResourceList	resources,
			Cardinal	num_resources,
			XtInitProc	cxx_cast);

    /*
     * static class-methods
     * (must be public : passed as parameter to class_rec static constructor)
     */
    static void			ClassInitialize();
    
  protected:

    CoreClassPart		core_class;
    XmPrimitiveClassPart	primitive_class;

    XtPointer			cxx_primitive_extension;
    
    // convenience function;
    void			SetBaseClassExtensionQuark();

    /*
     * virtual chained class-methods
     */
    virtual void		class_part_initialize();

    /*
     * virtual self contained class-methods
     */
    virtual void		class_part_initialize_prehook();
    virtual void		class_part_initialize_posthook();
    virtual Cardinal		sec_res_data(XmSecondaryResourceData **r_d);

  private:

    /*
     * static toolkit-class-methods
     */
    static void			ClassPartInitialize(WidgetClass wc);
    static void			ClassPartInitializePrehook(WidgetClass wc);
    static void			ClassPartInitializePosthook(WidgetClass wc);
    static Cardinal		GetSecResData(WidgetClass wc,
					      XmSecondaryResourceData **r_d);
};


/***************************
 * Widget class definition *
 ***************************/

class XmCxxPrimitive {

    friend class XmCxxPrimitiveClass;

  public:

    CorePart		core;
    XmPrimitivePart	primitive;

  protected:

    /*
     * constructors & destructors
     */
  public: // sgi/C++ does not want 'new' to be protected.
    void* operator new(size_t size, void* w = NULL);
  protected:
    void  operator delete(void*);
    virtual ~XmCxxPrimitive();
    XmCxxPrimitive();
    
    /*
     * virtual chained class-methods
     */
    // core class part;
    virtual void		initialize(Widget req_w, ArgList, Cardinal*);
    virtual void		initialize_hook(ArgList, Cardinal*);
    virtual Boolean		set_values(Widget old_w, Widget req_w,
					   ArgList, Cardinal*);
    virtual Boolean		set_values_hook(ArgList, Cardinal*);
    virtual void		get_values_hook(ArgList, Cardinal*);

    /*
     * virtual self contained class-methods
     */
    // core class part;
    virtual void		realize(XtValueMask* mask,
					XSetWindowAttributes* win_att);
    virtual void		resize();
    virtual void		expose(XEvent*, Region);
    virtual Boolean		accept_focus(Time* t);
    virtual void		set_values_almost(Widget old_w,
						  XtWidgetGeometry* request,
						  XtWidgetGeometry* reply);
    virtual XtGeometryResult	query_geometry(XtWidgetGeometry* intended,
					       XtWidgetGeometry* reply);

    // base class extension part;
    virtual Boolean		set_values_prehook(Widget old_w, Widget req_w,
						   ArgList, Cardinal*);
    virtual void		initialize_posthook(Widget req_w,
						    ArgList, Cardinal*);
    virtual Boolean		set_values_posthook(Widget old_w, Widget req_w,
						    ArgList, Cardinal*);
    virtual void		secondary_object_create(Widget req_w,
							ArgList, Cardinal*);
    virtual void		get_values_prehook(ArgList, Cardinal*);
    virtual void		get_values_posthook(ArgList, Cardinal*);
    virtual XmNavigability	widget_navigable();
    virtual void		focus_change(XmFocusChange);
    virtual void		display_accelerator(String);

    // primitive class part;
    virtual void		border_highlight();
    virtual void		border_unhighlight();
    virtual void		arm_and_activate(XEvent* event,
						 String* params,
						 Cardinal* nparams);

    // primitive extension part;
    virtual Boolean		widget_baseline(Dimension** dim, int* nb);
    virtual Boolean		widget_display_rect(XRectangle*);
    virtual void		widget_margins(XmBaselineMargins*);


  public:

    /*
     * static class-methods
     * (must be public : passed as parameter to class_rec static constructor)
     */
    static void			_MakeCxxWidget(Widget req, Widget new_w,
					       ArgList, Cardinal*);
  private:

    /*
     * static version of class-methods (calling virtual version)
     */
    // core class part;
    static void			Initialize(Widget req_w, Widget new_w,
					   ArgList, Cardinal*);
    static void 		InitializeHook(Widget w, ArgList, Cardinal*);
    static Boolean	 	SetValues(Widget old_w,
					  Widget req_w,
					  Widget new_w,
					  ArgList, Cardinal*);
    static Boolean 		SetValuesHook(Widget, ArgList, Cardinal*);
    static void 		GetValuesHook(Widget, ArgList, Cardinal*);

    static void			Realize(Widget, XtValueMask*,
					XSetWindowAttributes*);
    static void			Destroy(Widget);
    static void			Resize(Widget);
    static void			Redisplay(Widget, XEvent*, Region);
    static void			SetValuesAlmost(Widget, Widget,
						XtWidgetGeometry*,
						XtWidgetGeometry*);
    static Boolean		AcceptFocus(Widget, Time*);
    static void			DisplayAccelerator(Widget, String);
    static XtGeometryResult	QueryGeometry(Widget,
					      XtWidgetGeometry*,
					      XtWidgetGeometry*);

    // base class extension part;
    static Boolean		SetValuesPrehook(Widget old_w,
						 Widget req_w,
						 Widget new_w,
						 ArgList, Cardinal*);
    static void			InitializePosthook(Widget req_w,
						   Widget new_w,
						   ArgList, Cardinal*);
    static Boolean		SetValuesPosthook(Widget old_w,
						  Widget req_w,
						  Widget new_w,
						  ArgList, Cardinal*);
    static void			SecondaryObjectCreate(Widget req_w,
						      Widget new_w,
						      ArgList, Cardinal*);
    static void			GetValuesPrehook(Widget, ArgList, Cardinal*);
    static void			GetValuesPosthook(Widget, ArgList, Cardinal*);
    static XmNavigability	WidgetNavigable(Widget);
    static void			FocusChange(Widget, XmFocusChange);

    // primitive class part;
    static void			BorderHighlight(Widget w);
    static void			BorderUnhighlight(Widget w);
    static void			ArmAndActivate(Widget w, XEvent* event,
					       String* params,
					       Cardinal* nparams);

    // primitive class extension part
    static Boolean		WidgetBaseline(Widget w,
					       Dimension** dim, int* nb);
    static Boolean		WidgetDisplayRect(Widget w, XRectangle* rect);
    static void			WidgetMargins(Widget w,
					      XmBaselineMargins* margins);
};

/*
 * versions of g++ < 2.3.1 use a syntax with {} for placement.
 */
#ifndef IDLE_NEW
#  ifdef OLD_STYLE_NEW
#    define IDLE_NEW(ptr) new {ptr}
#  else
#    define IDLE_NEW(ptr) new(ptr)
#  endif /* ! OLD_STYLE_NEW */
#endif /* ! IDLE_NEW */


typedef class XmCxxPrimitiveClass	*XmCxxPrimitiveWidgetClass;
typedef class XmCxxPrimitive		*XmCxxPrimitiveWidget;

externalref XmCxxPrimitiveClass	xmCxxPrimitiveClassRec;

#endif /* not __cplusplus */

/* This symbol may be used from C code */
externalref WidgetClass		xmCxxPrimitiveWidgetClass;

#ifndef XmIsCxxPrimitive
#define XmIsCxxPrimitive(w)	XtIsSubclass(w, xmCxxPrimitiveWidgetClass)
#endif

#endif /* _CxxPrimiti_h */
/* DON'T ADD ANYTHING AFTER THIS #endif */
