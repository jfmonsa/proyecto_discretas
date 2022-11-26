%{
#include <stdio.h>
#include "y.tab.h"
void yyerror(char *);
%}

%option noyywrap
NUM -?[1-9][0-9]*
EVALUAR ["evaluar"]


%%
{NUM} {yylval = atoi(yytext); return NUMBER;}
{EVALUAR} {return EVALUAR;}
"\n"
"\t"
" ";

. yyerror("Caracter Invalido");
%%