/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_SCANNERPARSER_H_INCLUDED
# define YY_YY_SCANNERPARSER_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    IDENTIFIER = 258,
    TYPEDEF_NAME = 259,
    INTEGER = 260,
    FLOATING = 261,
    BOOLEAN = 262,
    CHARACTER = 263,
    STRING = 264,
    INTL_CONST = 265,
    INTUL_CONST = 266,
    ELLIPSIS = 267,
    ADDEQ = 268,
    SUBEQ = 269,
    MULEQ = 270,
    DIVEQ = 271,
    MODEQ = 272,
    XOREQ = 273,
    ANDEQ = 274,
    OREQ = 275,
    SL = 276,
    SR = 277,
    SLEQ = 278,
    SREQ = 279,
    EQ = 280,
    NOTEQ = 281,
    LTEQ = 282,
    GTEQ = 283,
    ANDAND = 284,
    OROR = 285,
    PLUSPLUS = 286,
    MINUSMINUS = 287,
    ARROW = 288,
    AUTO = 289,
    BOOL = 290,
    BREAK = 291,
    CASE = 292,
    CHAR = 293,
    CONST = 294,
    CONTINUE = 295,
    DEFAULT = 296,
    DO = 297,
    DOUBLE = 298,
    ELSE = 299,
    ENUM = 300,
    EXTENSION = 301,
    EXTERN = 302,
    FLOAT = 303,
    FOR = 304,
    GOTO = 305,
    IF = 306,
    INLINE = 307,
    INT = 308,
    LONG = 309,
    REGISTER = 310,
    RESTRICT = 311,
    RETURN = 312,
    SHORT = 313,
    SIGNED = 314,
    SIZEOF = 315,
    STATIC = 316,
    STRUCT = 317,
    SWITCH = 318,
    TYPEDEF = 319,
    UNION = 320,
    UNSIGNED = 321,
    VOID = 322,
    VOLATILE = 323,
    WHILE = 324,
    FUNCTION_MACRO = 325,
    OBJECT_MACRO = 326,
    IFDEF_GI_SCANNER = 327,
    IFNDEF_GI_SCANNER = 328,
    IFDEF_COND = 329,
    IFNDEF_COND = 330,
    IF_COND = 331,
    ELIF_COND = 332,
    ELSE_COND = 333,
    ENDIF_COND = 334
  };
#endif
/* Tokens.  */
#define IDENTIFIER 258
#define TYPEDEF_NAME 259
#define INTEGER 260
#define FLOATING 261
#define BOOLEAN 262
#define CHARACTER 263
#define STRING 264
#define INTL_CONST 265
#define INTUL_CONST 266
#define ELLIPSIS 267
#define ADDEQ 268
#define SUBEQ 269
#define MULEQ 270
#define DIVEQ 271
#define MODEQ 272
#define XOREQ 273
#define ANDEQ 274
#define OREQ 275
#define SL 276
#define SR 277
#define SLEQ 278
#define SREQ 279
#define EQ 280
#define NOTEQ 281
#define LTEQ 282
#define GTEQ 283
#define ANDAND 284
#define OROR 285
#define PLUSPLUS 286
#define MINUSMINUS 287
#define ARROW 288
#define AUTO 289
#define BOOL 290
#define BREAK 291
#define CASE 292
#define CHAR 293
#define CONST 294
#define CONTINUE 295
#define DEFAULT 296
#define DO 297
#define DOUBLE 298
#define ELSE 299
#define ENUM 300
#define EXTENSION 301
#define EXTERN 302
#define FLOAT 303
#define FOR 304
#define GOTO 305
#define IF 306
#define INLINE 307
#define INT 308
#define LONG 309
#define REGISTER 310
#define RESTRICT 311
#define RETURN 312
#define SHORT 313
#define SIGNED 314
#define SIZEOF 315
#define STATIC 316
#define STRUCT 317
#define SWITCH 318
#define TYPEDEF 319
#define UNION 320
#define UNSIGNED 321
#define VOID 322
#define VOLATILE 323
#define WHILE 324
#define FUNCTION_MACRO 325
#define OBJECT_MACRO 326
#define IFDEF_GI_SCANNER 327
#define IFNDEF_GI_SCANNER 328
#define IFDEF_COND 329
#define IFNDEF_COND 330
#define IF_COND 331
#define ELIF_COND 332
#define ELSE_COND 333
#define ENDIF_COND 334

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 212 "giscanner/scannerparser.y" /* yacc.c:1909  */

  char *str;
  GList *list;
  GISourceSymbol *symbol;
  GISourceType *ctype;
  StorageClassSpecifier storage_class_specifier;
  TypeQualifier type_qualifier;
  FunctionSpecifier function_specifier;
  UnaryOperator unary_operator;

#line 223 "scannerparser.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (GISourceScanner* scanner);

#endif /* !YY_YY_SCANNERPARSER_H_INCLUDED  */
