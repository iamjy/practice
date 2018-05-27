#include <stdio.h>
#include <Xm/Xm.h>
#include <Xm/PushB.h>
#include <Xm/Form.h>
#include <Xm/Frame.h>
#include <Xm/Label.h>
#include <Xm/TextF.h>
#include <Xm/SeparatoG.h>


static char *FallBack[] = {
		"*.borderWidth: 1",
		NULL
};

int
main(int argc, char **argv)
{
  XtAppContext	app;
  Widget Shell;
  Widget Form;
  Widget BottomLabel;

  XtSetLanguageProc(NULL, NULL, NULL);

  Shell = XtVaAppInitialize(&app, "Shell", NULL, 0, &argc, argv, FallBack, NULL);

  Form = XmCreateForm(Shell,"Form",NULL,0);
  XtVaSetValues(Form,
  	XmNfractionBase, 4,
  	NULL);

  BottomLabel = XmCreateLabel(Form,"BottomLabel",NULL,0);
  XtVaSetValues(BottomLabel,
  	XmNbottomOffset, 50,
  	XmNbottomAttachment, XmATTACH_FORM,
  	XmNtopAttachment, XmATTACH_POSITION,
  	XmNtopPosition, 1,
  	NULL);
  XtManageChild(BottomLabel);

  XtManageChild(Form);

  XtRealizeWidget(Shell);
  {
  static XtWidgetGeometry Expected[] = {
  	CWWidth | CWHeight,		0,	0,	72,	92,	0,0,0,	/* Form */
  	CWWidth | CWHeight | CWX | CWY,	0,	23,	70,	17,	0,0,0,	/* two */
};

  PrintDetails(Shell, Expected);
  }
      LessTifTestMainLoop(Shell);
  exit(0);
}
