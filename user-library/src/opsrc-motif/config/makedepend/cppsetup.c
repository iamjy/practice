/* $TOG: cppsetup.c /main/18 1998/02/06 11:09:35 kaleb $ */
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

#ifdef	CPP
/*
 * This file is strictly for the sake of cpy.y and yylex.c (if
 * you indeed have the source for cpp).
 */
#define IB 1
#define SB 2
#define NB 4
#define CB 8
#define QB 16
#define WB 32
#define SALT '#'
#if pdp11 | vax | ns16000 | mc68000 | ibm032
#define COFF 128
#else
#define COFF 0
#endif
/*
 * These variables used by cpy.y and yylex.c
 */
extern char	*outp, *inp, *newp, *pend;
extern char	*ptrtab;
extern char	fastab[];
extern char	slotab[];

/*
 * cppsetup
 */
struct filepointer	*currentfile;
struct inclist		*currentinc;

cppsetup(line, filep, inc)
	register char	*line;
	register struct filepointer	*filep;
	register struct inclist		*inc;
{
	register char *p, savec;
	static boolean setupdone = FALSE;
	boolean	value;

	if (!setupdone) {
		cpp_varsetup();
		setupdone = TRUE;
	}

	currentfile = filep;
	currentinc = inc;
	inp = newp = line;
	for (p=newp; *p; p++)
		;

	/*
	 * put a newline back on the end, and set up pend, etc.
	 */
	*p++ = '\n';
	savec = *p;
	*p = '\0';
	pend = p;

	ptrtab = slotab+COFF;
	*--inp = SALT; 
	outp=inp; 
	value = yyparse();
	*p = savec;
	return(value);
}

struct symtab **lookup(symbol)
	char	*symbol;
{
	static struct symtab    *undefined;
	struct symtab   **sp;

	sp = isdefined(symbol, currentinc, NULL);
	if (sp == NULL) {
		sp = &undefined;
		(*sp)->s_value = NULL;
	}
	return (sp);
}

pperror(tag, x0,x1,x2,x3,x4)
	int	tag,x0,x1,x2,x3,x4;
{
	warning("\"%s\", line %d: ", currentinc->i_file, currentfile->f_line);
	warning(x0,x1,x2,x3,x4);
}


yyerror(s)
	register char	*s;
{
	fatalerr("Fatal error: %s\n", s);
}
#else /* not CPP */

#include "ifparser.h"
struct _parse_data {
    struct filepointer *filep;
    struct inclist *inc;
    const char *line;
};

static const char *
my_if_errors (ip, cp, expecting)
    IfParser *ip;
    const char *cp;
    const char *expecting;
{
    struct _parse_data *pd = (struct _parse_data *) ip->data;
    int lineno = pd->filep->f_line;
    char *filename = pd->inc->i_file;
    char prefix[300];
    int prefixlen;
    int i;

    sprintf (prefix, "\"%s\":%d", filename, lineno);
    prefixlen = strlen(prefix);
    fprintf (stderr, "%s:  %s", prefix, pd->line);
    i = cp - pd->line;
    if (i > 0 && pd->line[i-1] != '\n') {
	putc ('\n', stderr);
    }
    for (i += prefixlen + 3; i > 0; i--) {
	putc (' ', stderr);
    }
    fprintf (stderr, "^--- expecting %s\n", expecting);
    return NULL;
}


#define MAXNAMELEN 256

static struct symtab **
lookup_variable (ip, var, len)
    IfParser *ip;
    const char *var;
    int len;
{
    char tmpbuf[MAXNAMELEN + 1];
    struct _parse_data *pd = (struct _parse_data *) ip->data;

    if (len > MAXNAMELEN)
	return 0;

    strncpy (tmpbuf, var, len);
    tmpbuf[len] = '\0';
    return isdefined (tmpbuf, pd->inc, NULL);
}


static int
my_eval_defined (ip, var, len)
    IfParser *ip;
    const char *var;
    int len;
{
    if (lookup_variable (ip, var, len))
	return 1;
    else
	return 0;
}

#define isvarfirstletter(ccc) (isalpha(ccc) || (ccc) == '_')

static long
my_eval_variable (ip, var, len)
    IfParser *ip;
    const char *var;
    int len;
{
    struct symtab **s;

    s = lookup_variable (ip, var, len);
    if (!s)
	return 0;
    do {
	var = (*s)->s_value;
	if (!isvarfirstletter(*var))
	    break;
	s = lookup_variable (ip, var, strlen(var));
    } while (s);

    return strtol(var, NULL, 0);
}


cppsetup(line, filep, inc)
	register char	*line;
	register struct filepointer	*filep;
	register struct inclist		*inc;
{
    IfParser ip;
    struct _parse_data pd;
    long val = 0;

    pd.filep = filep;
    pd.inc = inc;
    pd.line = line;
    ip.funcs.handle_error = my_if_errors;
    ip.funcs.eval_defined = my_eval_defined;
    ip.funcs.eval_variable = my_eval_variable;
    ip.data = (char *) &pd;

    (void) ParseIfExpression (&ip, line, &val);
    if (val)
	return IF;
    else
	return IFFALSE;
}
#endif /* CPP */

