/* $TOG: pr.c /main/21 1998/02/06 11:10:30 kaleb $ */
/*

@OPENGROUP_COPYRIGHT@
COPYRIGHT NOTICE
Copyright (c) 1990, 1991, 1992, 1993 Open Software Foundation, Inc.
Copyright (c) 1996, 1997, 1998, 1999, 2000 The Open Group
ALL RIGHTS RESERVED (MOTIF). See the file named COPYRIGHT.MOTIF for
the full copyright text.
 
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

This software is subject to an open license. It may only be
used on, with or for operating systems which are themselves open
source systems. You must contact The Open Group for a license
allowing distribution and sublicensing of this software on, with,
or for operating systems which are not Open Source programs.

See http://www.opengroup.org/openmotif/license for full
details of the license agreement. Any use, reproduction, or
distribution of the program constitutes recipient's acceptance of
this agreement.

EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, THE PROGRAM IS
PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, EITHER EXPRESS OR IMPLIED INCLUDING, WITHOUT LIMITATION, ANY
WARRANTIES OR CONDITIONS OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY
OR FITNESS FOR A PARTICULAR PURPOSE

EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, NEITHER RECIPIENT
NOR ANY CONTRIBUTORS SHALL HAVE ANY LIABILITY FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING WITHOUT LIMITATION LOST PROFITS), HOWEVER CAUSED
AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
ANY WAY OUT OF THE USE OR DISTRIBUTION OF THE PROGRAM OR THE
EXERCISE OF ANY RIGHTS GRANTED HEREUNDER, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGES.

*/

#include "def.h"

extern struct	inclist	inclist[ MAXFILES ],
			*inclistp;
extern char	*objprefix;
extern char	*objsuffix;
extern int	width;
extern boolean	printed;
extern boolean	verbose;
extern boolean	show_where_not;

void
add_include(filep, file, file_red, include, dot, failOK)
	struct filepointer	*filep;
	struct inclist	*file, *file_red;
	char	*include;
	boolean	dot;
{
	register struct inclist	*newfile;
	register struct filepointer	*content;

	/*
	 * First decide what the pathname of this include file really is.
	 */
	newfile = inc_path(file->i_file, include, dot);
	if (newfile == NULL) {
		if (failOK)
		    return;
		if (file != file_red)
			warning("%s (reading %s, line %d): ",
				file_red->i_file, file->i_file, filep->f_line);
		else
			warning("%s, line %d: ", file->i_file, filep->f_line);
		warning1("cannot find include file \"%s\"\n", include);
		show_where_not = TRUE;
		newfile = inc_path(file->i_file, include, dot);
		show_where_not = FALSE;
	}

	if (newfile) {
		included_by(file, newfile);
		if (!(newfile->i_flags & SEARCHED)) {
			newfile->i_flags |= SEARCHED;
			content = getfile(newfile->i_file);
			find_includes(content, newfile, file_red, 0, failOK);
			freefile(content);
		}
	}
}

void
pr(ip, file, base)
	register struct inclist  *ip;
	char	*file, *base;
{
	static char	*lastfile;
	static int	current_len;
	register int	len, i;
	char	buf[ BUFSIZ ];

	printed = TRUE;
	len = strlen(ip->i_file)+1;
	if (current_len + len > width || file != lastfile) {
		lastfile = file;
		sprintf(buf, "\n%s%s%s: %s", objprefix, base, objsuffix,
			ip->i_file);
		len = current_len = strlen(buf);
	}
	else {
		buf[0] = ' ';
		strcpy(buf+1, ip->i_file);
		current_len += len;
	}
	fwrite(buf, len, 1, stdout);

	/*
	 * If verbose is set, then print out what this file includes.
	 */
	if (! verbose || ip->i_list == NULL || ip->i_flags & NOTIFIED)
		return;
	ip->i_flags |= NOTIFIED;
	lastfile = NULL;
	printf("\n# %s includes:", ip->i_file);
	for (i=0; i<ip->i_listlen; i++)
		printf("\n#\t%s", ip->i_list[ i ]->i_incstring);
}

void
recursive_pr_include(head, file, base)
	register struct inclist	*head;
	register char	*file, *base;
{
	register int	i;

	if (head->i_flags & MARKED)
		return;
	head->i_flags |= MARKED;
	if (head->i_file != file)
		pr(head, file, base);
	for (i=0; i<head->i_listlen; i++)
		recursive_pr_include(head->i_list[ i ], file, base);
}
