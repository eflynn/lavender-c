%{
  #include <stdio.h>
  #include <string.h>

  void yyerror(char const *);
  int yylex(void);
%}

%debug

%union {
  double val;
  char *id;
}

%token <val> NUM
%token <id>  ID

%token INDENT	"indent"
%token DEDENT	"dedent"
%token IF	"if"
%token ELSE	"else"
%token BLOCK	"block"
%token EACH	"each"
%token IN	"IN"
%token EXTENDS	"extends"
%token EQUALS	"=="
%token TRUE	"true"
%token FALSE	"false"
%token DOCTYPE  "doctype"

%%

input: /* empty */
| input line
;

line: '\n'
| DOCTYPE ID '\n' { printf("saw doctype\n"); }
| ID '\n'
| error '\n'      { yyerrok; }
;

%%

void yyerror(char const *s)
{
  fprintf(stderr, "%s\n", s);
}
