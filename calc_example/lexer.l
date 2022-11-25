%{
#include <stdio.h>
#include "y.tab.h"
void yyerror(char *);
%}

%option noyywrap
NUM -?[1-9][0-9]*

%%
{NUM} {yylval = atoi(yytext); return NUMBER;}
%%