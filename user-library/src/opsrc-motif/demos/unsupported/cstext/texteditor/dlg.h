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
/*   $XConsortium: dlg.h /main/6 1995/07/14 09:44:04 drk $ */

/************************************************************
 *     dlg.h -- toolkit-independent dialogue layer
 ************************************************************/

#ifndef _dlg_h
#define _dlg_h

#include <Xmd/Print.h>

#include "tkdef.h"


extern void DlgKeepFileDialogueCB(int val);
extern void DlgRevertToOpenCB(int val);
extern void DlgNoteJustChangedCB();
extern void DlgNoteJustChangedSinceCB();

extern void DlgSelectOpenCB(char *filnam);
extern void DlgSelectSaveCB(char *filnam);
extern void DlgSelectCopyCB(char *filnam);
extern void DlgSelectMoveCB(char *filnam);

extern void DlgSelectCancelCB();

extern void DlgSaveYesCB();
extern void DlgSaveNoCB();
extern void DlgSaveCancelCB();
extern void DlgWarnCancelCB(enum warn_reasons reason);
extern void DlgQuestionYesCB();

extern void DlgPrintCB(Widget w, char *ignore, XmdPrintCallbackStruct *cb);

extern void DlgWantClearCB();
extern void DlgWantOpenCB();
extern void DlgWantSaveAsCB();
extern void DlgWantSaveCB();
extern void DlgWantCopyCB();
extern void DlgWantMoveCB();
extern void DlgWantRemoveCB();

extern void DlgExitCB();


#endif /* _dlg_h */
/* DON'T ADD ANYTHING AFTER THIS #endif */
