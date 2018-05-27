/* $TOG: def.h /main/32 1998/03/25 08:17:45 kaleb $ */
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

#include "Xos.h"
#include "Xfuncproto.h"
#include <stdio.h>
#include <ctype.h>
#ifndef X_NOT_POSIX
#ifndef _POSIX_SOURCE
#define _POSIX_SOURCE
#endif
#endif
#include <sys/types.h>
#include <fcntl.h>
#include <sys/stat.h>

#define MAXDEFINES	512
#define MAXFILES	1024
#define MAXDIRS		64
#define SYMTABINC	10	/* must be > 1 for define() to work right */
#define	TRUE		1
#define	FALSE		0

/* the following must match the directives table in main.c */
#define	IF		0
#define	IFDEF		1
#define	IFNDEF		2
#define	ELSE		3
#define	ENDIF		4
#define	DEFINE		5
#define	UNDEF		6
#define	INCLUDE		7
#define	LINE		8
#define	PRAGMA		9
#define ERROR           10
#define IDENT           11
#define SCCS            12
#define ELIF            13
#define EJECT           14
#define WARNING		15
#define IFFALSE         16     /* pseudo value --- never matched */
#define ELIFFALSE       17     /* pseudo value --- never matched */
#define INCLUDEDOT      18     /* pseudo value --- never matched */
#define IFGUESSFALSE    19     /* pseudo value --- never matched */
#define ELIFGUESSFALSE  20     /* pseudo value --- never matched */

#ifdef DEBUG
extern int	_debugmask;
/*
 * debug levels are:
 * 
 *     0	show ifn*(def)*,endif
 *     1	trace defined/!defined
 *     2	show #include
 *     3	show #include SYMBOL
 *     4-6	unused
 */
#define debug(level,arg) { if (_debugmask & (1 << level)) warning arg; }
#else
#define	debug(level,arg) /**/
#endif /* DEBUG */

typedef	unsigned char boolean;

struct symtab {
	char	*s_name;
	char	*s_value;
};

/* possible i_flag */
#define DEFCHECKED	(1<<0)	/* whether defines have been checked */
#define NOTIFIED	(1<<1)	/* whether we have revealed includes */
#define MARKED		(1<<2)	/* whether it's in the makefile */
#define SEARCHED	(1<<3)	/* whether we have read this */
#define FINISHED	(1<<4)	/* whether we are done reading this */
#define INCLUDED_SYM	(1<<5)	/* whether #include SYMBOL was found
				   Can't use i_list if TRUE */
struct	inclist {
	char		*i_incstring;	/* string from #include line */
	char		*i_file;	/* path name of the include file */
	struct inclist	**i_list;	/* list of files it itself includes */
	int		i_listlen;	/* length of i_list */
	struct symtab	**i_defs;	/* symbol table for this file and its
					   children when merged */
	int		i_ndefs;	/* current # defines */
	boolean		*i_merged;      /* whether we have merged child
					   defines */
	unsigned char   i_flags;
};

struct filepointer {
	char	*f_p;
	char	*f_base;
	char	*f_end;
	long	f_len;
	long	f_line;
};

#ifndef X_NOT_STDC_ENV
#include <stdlib.h>
#if defined(macII) && !defined(__STDC__)  /* stdlib.h fails to define these */
char *malloc(), *realloc();
#endif /* macII */
#else
char			*malloc();
char			*realloc();
#endif

char			*copy();
char			*base_name();
char			*getline();
struct symtab		**slookup();
struct symtab		**isdefined();
struct symtab		**fdefined();
struct filepointer	*getfile();
struct inclist		*newinclude();
struct inclist		*inc_path();

#if NeedVarargsPrototypes
extern void fatalerr(char *, ...);
extern void warning(char *, ...);
extern void warning1(char *, ...);
#endif
