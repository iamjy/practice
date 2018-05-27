/* $XConsortium: DNDDrag.c /main/5 1995/07/15 21:00:05 drk $ */
/*
 * @OPENGROUP_COPYRIGHT@
 * COPYRIGHT NOTICE
 * Copyright (c) 1990, 1991, 1992, 1993 Open Software Foundation, Inc.
 * Copyright (c) 1996, 1997, 1998, 1999, 2000 The Open Group
 * ALL RIGHTS RESERVED (MOTIF).  See the file named COPYRIGHT.MOTIF for
 * the full copyright text.
 * 
 * This software is subject to an open license. It may only be
 * used on, with or for operating systems which are themselves open
 * source systems. You must contact The Open Group for a license
 * allowing distribution and sublicensing of this software on, with,
 * or for operating systems which are not Open Source programs.
 * 
 * See http://www.opengroup.org/openmotif/license for full
 * details of the license agreement. Any use, reproduction, or
 * distribution of the program constitutes recipient's acceptance of
 * this agreement.
 * 
 * EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, THE PROGRAM IS
 * PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, EITHER EXPRESS OR IMPLIED INCLUDING, WITHOUT LIMITATION, ANY
 * WARRANTIES OR CONDITIONS OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY
 * OR FITNESS FOR A PARTICULAR PURPOSE
 * 
 * EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, NEITHER RECIPIENT
 * NOR ANY CONTRIBUTORS SHALL HAVE ANY LIABILITY FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING WITHOUT LIMITATION LOST PROFITS), HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OR DISTRIBUTION OF THE PROGRAM OR THE
 * EXERCISE OF ANY RIGHTS GRANTED HEREUNDER, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGES.
 * 
 */
/*
 * HISTORY
 */
#include <testlib.h>



void
StartDrag (Widget w, XtPointer client_data, XtPointer call_data)
{
   XmDragStartCallbackStruct *DragStruct = (XmDragStartCallbackStruct *)call_data
;
   if (strcmp (UserData,"1") == 0)
     {
       DragStruct->doit = False;
       printf ("Sorry, can't drag!\n");
     }
   else if (strcmp (UserData,"2") == 0)
       DragStruct->doit = True;

}


void  
main (int argc, char **argv)
{

    int n;
    Arg args[MAX_ARGS];
    XmString tcs;
    Widget Frame1;
    Widget Label1;
    Widget xmDisplay;


    CommonTestInit(argc, argv);

    if (UserData == NULL)
      UserData = "1";

    xmDisplay = XmGetXmDisplay (display);

    XtAddCallback (xmDisplay,XmNdragStartCallback,StartDrag,(XtPointer)NULL);
    
    n = 0;
    Frame1 = XmCreateFrame(Shell1, "Frame1", args, n);
    XtManageChild(Frame1);


    
    n = 0;
    tcs = XmStringCreate("Non-draggable label", XmFONTLIST_DEFAULT_TAG);
    XtSetArg(args[n], XmNlabelString, tcs);  n++;
    XtSetArg(args[n], XmNalignment, XmALIGNMENT_CENTER); n++;
    XtSetArg(args[n], XmNrecomputeSize, TRUE); n++;
    Label1 = XmCreateLabel(Frame1, "Label1", args, n);
    XtManageChild(Label1);

    XmStringFree(tcs);

    XtRealizeWidget (Shell1);

    CommonPause();
    CommonPause();

    XtAppMainLoop(app_context);

  }


