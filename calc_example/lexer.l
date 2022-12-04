%{ 
  #include<stdio.h>
  #include<stdlib.h>
  #include "y.tab.h" 
  #include <string.h>
  void yyerror(char *);

  /*

LLAVE_A ["{"]
LLAVE_C ["}"]
PARENTESIS_A ["("]
PARENTESIS_C [")"]
FIN_SENTENCIA [";"]*/
%} 

%option noyywrap
%option yylineno

SEMICOLON ";"
/*Operators */
/*Comparation op*/
OP_DIFF "!="
OP_COMP_EQUAL "=="
OP_NOT "!"
OP_MAX ">"
OP_MIN "<"
OP_MAX_EQUAL ">="
OP_MIN_EQUAL "<="
/* Op asignat */
OP_ASIGNAT "="

/*Math operators*/
OP_NEG "-"
OP_SUM "+"
OP_TIMES "*"
OP_DIV "/"

/*Values */
STRING \'[^\n']*\'
BOOLEAN "true"|"false"

/*Comments*/

/* Agrupation symbols*/

/* keywords / built-in functions */
EVALUAR "evaluar"
IF "if"
ELIF "elif"
ELSE "else"
WHILE "while"
FOR "for"

/* Rule Section */

/*[-()+/;] {return *yytext;}*/
%% 
SEMICOLON {return SEMICOLON;}

OP_DIFF {return OP_DIFF;}
OP_COMP_EQUAL {return OP_COMP_EQUAL;}
OP_NOT {return OP_NOT;}
OP_MAX {return OP_MAX;}
OP_MIN {return OP_MIN;}
OP_MAX_EQUAL {return OP_MAX_EQUAL;}
OP_MIN_EQUAL {return OP_MIN_EQUAL;}

OP_ASIGNAT {return OP_ASIGNAT;}

OP_NEG {return OP_NEG;}
OP_SUM {return OP_SUM;}
OP_TIMES {return OP_TIMES;}
OP_DIV {return OP_DIV;}


x[0-9]+               {yylval.valor_entero = atoi(&yytext[1]);return IDENTIFIER;}
(-?[1-9][0-9]{0,4})|0     {yylval.valor_entero=atoi(yytext);return NUMBER;}
[(){}] {return *yytext;}

STRING {return STRING;}
BOOLEAN {return BOOLEAN;}

EVALUAR {return EVALUAR;}

IF {return IF;}
ELIF {return ELIF;}
ELSE {return ELSE;}
WHILE {return WHILE;}
FOR {return FOR;}

[\t\r\n[:blank]] ;
.                   yyerror("No se encontro un caracter");
%%