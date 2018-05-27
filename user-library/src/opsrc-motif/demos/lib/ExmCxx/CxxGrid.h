/* $XConsortium: CxxGrid.h /main/4 1995/07/15 20:42:19 drk $ */
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
 *
 * GridP.h - XmCxxGrid Private header
 *
 */

#ifndef _ExmCxxGridP_h
#define _ExmCxxGridP_h

#ifdef __cplusplus
#include <Xm/ManagerP.h>

#include <XmCxx/CxxManager.h>

/**********************************
 * Widget class record definition *
 **********************************/

class ExmCxxGridClass : public XmCxxManagerClass {

    friend class ExmCxxGrid;
    
  public:
    
    ExmCxxGridClass(char*		name,
		   WidgetClass		parent,
		   Cardinal		widgetSize,
		   XtProc		class_init,
		   XtActionList		actions,
		   Cardinal		num_actions,
		   XtResourceList	resources,
		   Cardinal		num_resources,
		   XtInitProc		cxx_cast);

    /*
     * virtual chained methods
     */
    virtual void		class_part_initialize();

    /*
     * static class-methods
     * (must be public : passed as parameter to class_rec static constructor)
     */
    static void			ClassInitialize();
};



/********************
 * The CxxGrid part *
 ********************/

struct ExmCxxGridPart {
	short			rows;
	short			columns;
	Dimension		margin_width;
	Dimension		margin_height;
	XtCallbackList	        map_callback;
	XtCallbackList	        unmap_callback;
	Boolean		        default_position;
	XmRenderTable           button_render_table ;
	XmRenderTable           label_render_table ;
	XmRenderTable           text_render_table ;
        XmString	        dialog_title;

	/* processing_constraints is a flag.  If its value is True, then 
	   it means that the ConstraintSetValues method is requesting a 
	   geometry change. */
	Boolean			processing_constraints;
};

/* Define string equivalents of new resource names. */
#define ExmNgridMarginWidthWithinCell "gridMarginWidthWithinCell"
#define ExmNgridMarginHeightWithinCell "gridMarginHeightWithinCell"

#define ExmCGridMarginWidthWithinCell  "GridMarginWidthWithinCell"
#define ExmCGridMarginHeightWithinCell "GridMarginHeightWithinCell"

/* Establish an arbitrary limit */
#define EXM_GRID_MAX_NUMBER_OF_ROWS 100
#define EXM_GRID_MAX_NUMBER_OF_COLUMNS 100

/**********************
 * The CxxGrid widget *
 **********************/

class ExmCxxGrid : public XmCxxManager {

    friend class ExmCxxGridClass;

  public:
     /*
      * should really be protected but we must reference fields when
      * declaring the static resources array;
      */
    ExmCxxGridPart    grid;

    // Destructor
    ~ExmCxxGrid();

  protected:

    /*
     * virtual chained class-methods
     */
    // core class part;
    virtual void		initialize(Widget req_w, ArgList, Cardinal*);
    virtual Boolean		set_values(Widget old_w, Widget req_w,
					   ArgList, Cardinal*);
    virtual void		set_values_almost(Widget old_w,
						  XtWidgetGeometry* request,
						  XtWidgetGeometry* reply);
    // constraint class part;
    virtual Boolean		constraint_set_values(Widget old_w,
						      Widget req_w,
						      Widget new_w,
						      ArgList, Cardinal*);
    
    /*
     * virtual self contained class-methods
     */
    // core class part
    virtual void		resize();
    virtual void		expose(XEvent*, Region);
    virtual XtGeometryResult	query_geometry(XtWidgetGeometry *intended,
					       XtWidgetGeometry *reply);

    // composite class part
    virtual XtGeometryResult	geometry_manager(Widget child,
						 XtWidgetGeometry* intended,
						 XtWidgetGeometry* reply);
    virtual void		change_managed();

    // Functions for this class and for subclasses to override
    virtual void		layout(Widget);
    virtual void		calc_size(Widget, 
					  Dimension *, 
					  Dimension *);
    virtual Boolean		need_relayout(Widget);
  public:

    /*
     * static class-methods
     * (must be public : passed as parameter to class_rec static constructor)
     */
    static void			_MakeCxxWidget(Widget req, Widget new_w,
					       ArgList, Cardinal*);
    /* Synthetic resource methods */
    static void			GetDialogTitle(Widget w, int resource, 
					       XtArgVal *value);
    /* Trait methods */
    static void 		CallMapUnmap(Widget wid, Boolean map_unmap);
    static XmRenderTable	GetTable(Widget wid, XtEnum type);
};

/**********************
 * constraint records *
 **********************/

struct ExmCxxGridConstraintPart {
	Dimension		grid_margin_width_within_cell;
	Dimension		grid_margin_height_within_cell;
};

struct ExmCxxGridConstraintRec {
	XmManagerConstraintPart	manager;
	ExmCxxGridConstraintPart	grid;
};

typedef ExmCxxGridConstraintRec*	ExmCxxGridConstraint;

/* Define macros for this class. */
#define GridConstraint(w) \
      (&((ExmCxxGridConstraint) (((Widget) w)->core.constraints))->grid)

typedef ExmCxxGridClass*		ExmCxxGridWidgetClass;
typedef ExmCxxGrid*		ExmCxxGridWidget;

externalref ExmCxxGridClass	ExmCxxGridClassRec;

#endif /* __cplusplus */

/* These symbols may be used from C code */
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */
extern Widget ExmCreateCxxGrid(Widget parent, char *name, 
			       ArgList args, Cardinal nargs);
extern Widget ExmCreateCxxGridDialog(Widget parent, char   *name,
				     ArgList arglist, Cardinal argcount);
#ifdef __cplusplus
}
#endif /* __cplusplus */

externalref WidgetClass		exmCxxGridWidgetClass;

#ifndef XmIsCxxGrid
#define XmIsCxxGrid(w)		XtIsSubclass(w, exmCxxGridWidgetClass)
#endif


#endif /* _ExmGridP_h */
