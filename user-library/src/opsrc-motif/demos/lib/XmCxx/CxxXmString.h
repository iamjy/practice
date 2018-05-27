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
/*   $XConsortium: CxxXmString.h /main/4 1995/07/13 18:31:09 drk $ */

// Wrapper for XmString objects

class XmCxxString {
private:
  XmString	internal;
public:
      // Constructors
  XmCxxString(const char* str) { 
    internal = XmStringCreateLocalized((String) str); 
  };
  XmCxxString(XmCxxString &str) { internal = XmStringCopy(str.internal); }
  XmCxxString(XmString str) { internal = str; }
  XmCxxString() { internal = XmStringCreateLocalized((String) ""); }
  static XmCxxString& Separator() {
    XmCxxString *n;
    n = new XmCxxString(XmStringSeparatorCreate());
    return *n;
  }
      // Destructor
  ~XmCxxString() { XmStringFree(internal); }
      // Operators + (concat), = and ==
  XmCxxString& operator=(const char *s) {
    XmStringFree(internal);
    internal = XmStringCreateLocalized((String) s);
    return *this;
  }
  XmCxxString& operator=(const XmString s) {
    XmStringFree(internal);
    internal = s;
    return *this;
  }
  XmCxxString& operator=(const XmCxxString &s) {
    XmStringFree(internal);
    internal = XmStringCopy(s.internal);
    return *this;
  }
  friend Boolean operator== (XmCxxString &x, XmCxxString &y) {
    return XmStringCompare(x.internal, y.internal);
  }
  friend XmCxxString& operator+(XmCxxString &x, XmCxxString &y);
  friend XmCxxString& operator+(XmCxxString &x, char *y);
  operator XmString() { return internal; }
      // Accessors and Functions
  Dimension 	baseline(XmRenderTable tab);
  Boolean 	empty() { return XmStringEmpty(internal); }
  void 		draw(Widget w, XmRenderTable r, GC gc, 
		     Position x, Position y, Dimension width, 
		     unsigned char alignment, unsigned char layout_dir,
		     XRectangle *clip);
  void 		draw(Display *d, Window w, XmRenderTable r, GC gc, 
		     Position x, Position y, Dimension width, 
		     unsigned char alignment, unsigned char layout_dir,
		     XRectangle *clip);
  void		extents(XmRenderTable r, Dimension *w, Dimension *h);
  Boolean	hasSubstring(XmCxxString& ss) {
    return XmStringHasSubstring(internal, ss.internal);
  }
  int		length() { return XmStringLength(internal); }
  int		lineCount() { return XmStringLineCount(internal); }
};



