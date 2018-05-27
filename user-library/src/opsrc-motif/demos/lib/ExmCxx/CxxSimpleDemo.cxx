/* $XConsortium: CxxSimpleDemo.cxx /main/4 1995/07/17 11:45:34 drk $ */
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

/****************************************************************************
 ****************************************************************************
 **
 **   File:     simpleDemo.c
 **
 **   Description: C program to instantiate the ExmSimple widget. 
 **
 ****************************************************************************
 ****************************************************************************/


#include <sys/file.h>

/*  Standard C headers  */
#include <stdio.h>
#include <stdlib.h>

/*  X headers  */
#include <X11/IntrinsicP.h>

/*  Xm headers  */
#include <Xm/Xm.h>
#include <Xm/MainW.h>
#include <Xm/Form.h>
#include <Xm/MessageB.h>
#include <Xm/Label.h>
#include <XmCxx/CxxXmString.h>
#include "CxxSimple.h"
#include "CxxString.h"
#include "CxxGrid.h"
#include "CxxCommand.h"

static void TickleCB(Widget, XtPointer, XtPointer);

void TickleCB(
   Widget w,
   XtPointer,
   XtPointer
              )
{
 XmCxxString  stop_that("Stop that!");
 Arg       arg[2];
 Widget    MsgBox1;
 printf("In TickleCB\n");

 XtSetArg(arg[0], XmNmessageString, (XmString) stop_that);
 
 MsgBox1 = XmCreateMessageDialog(w, "MsgBox1",  arg, 1);

 XtManageChild(MsgBox1);
} 


void make_simple_widgets(Widget parent)
{
  Widget       simpleWidget1, simpleWidget2, stringWidget,
    commandButtonWidget1;
  XmCxxString  compound_string1, compound_string2;
  Arg          args[8];
  Cardinal     argcount;

  simpleWidget1 = XtCreateManagedWidget("Simple1", 
					exmCxxSimpleWidgetClass, parent, 
					NULL, 0);

  argcount = 0;
  XtSetArg(args[argcount], ExmNsimpleShape, ExmSHAPE_RECTANGLE); argcount++;
  XtSetArg(args[argcount], XmNmarginWidth, 20); argcount++;

  simpleWidget2 = XtCreateManagedWidget("Simple2", 
					exmCxxSimpleWidgetClass, parent, 
					args, argcount);

  compound_string1 = "ExmString";
  compound_string1 = compound_string1 + XmCxxString::Separator() + "widget";

  argcount = 0;
  XtSetArg(args[argcount], ExmNcompoundString, (XmString) compound_string1);
  argcount++;
  stringWidget = XtCreateManagedWidget("String", 
				       exmCxxStringWidgetClass, parent, 
				       args, argcount);

  compound_string2 = "ExmCommandButton";
  compound_string2 = compound_string2 + XmCxxString::Separator() + "Push me";

  argcount = 0;
  XtSetArg(args[argcount], ExmNcompoundString, (XmString) compound_string2);
  argcount++;
  commandButtonWidget1 = XtCreateManagedWidget("CommandButtonWidget1", 
					       exmCxxCommandWidgetClass, 
					       parent, args, argcount);

  XtAddCallback(commandButtonWidget1, XmNactivateCallback, TickleCB, NULL);
}

#define      APP_CLASS  "C++ Widgets demo"

int main (int argc, char **argv)
{
  Display     *display;
  Widget       shell, mainWindow, workRegion;
  XtAppContext AppContext;
  Arg args[8];
  Cardinal argcount = 0;


  XtToolkitInitialize();
  AppContext = XtCreateApplicationContext();
  if ((display = XtOpenDisplay (AppContext, NULL, argv[0], APP_CLASS,
				NULL, 0, &argc, argv)) == NULL)
    {
      fprintf (stderr,"\n%s:  Can't open display\n", argv[0]);
      exit(1);
    }

  argcount = 0;
  XtSetArg(args[argcount], XmNallowShellResize, True); argcount++;

  shell = XtAppCreateShell(argv[0], APP_CLASS, applicationShellWidgetClass,
			   display, args, argcount);
			     

  mainWindow = XtCreateManagedWidget("myMainWindow", xmMainWindowWidgetClass, 
				     shell, NULL, 0);

  argcount = 0;
  XtSetArg(args[argcount], XmNrows, 2); argcount++;
  XtSetArg(args[argcount], XmNcolumns, 2); argcount++;
  workRegion = XtCreateManagedWidget("myWorkRegion", exmCxxGridWidgetClass,
				     mainWindow, args, argcount); 

  make_simple_widgets(workRegion);

  XmMainWindowSetAreas(mainWindow, NULL, NULL, NULL, NULL, workRegion);

  XtRealizeWidget(shell);

  XtAppMainLoop(AppContext);
}
