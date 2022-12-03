%{ 
  #include<stdio.h>
  #include<stdlib.h>
  #include "y.tab.h" 
  #include <string.h>
  void yyerror(char *);

  /*
    <str_comment> ::= "/*"
  <end_comment> ::= "/"
  <oneline_comment> ::= "//"

  <op_comp_equal> ::= "=="
  <op_max> ::= ">"
  <op_min> ::= "<"
  <op_min_equal> ::= "<="
  <op_max_equal> ::= ">="
  <op_not> ::= "!"
  <op_diff> ::= "!="

OP_IGUAL ["="]
OP_MAYOR [">"]
OP_MENOR ["<"]
OP_MAYORIGUAL [">="] 
OP_MENORIGUAL ["<="]
OP_COMP_IGUAL ["=="]
OP_NEGACION ["!"]
OP_DISTINTO ["!="]

LLAVE_A ["{"]
LLAVE_C ["}"]
PARENTESIS_A ["("]
PARENTESIS_C [")"]
FIN_SENTENCIA [";"]

IF "if"|"IF"
WHILE "while"|"WHILE"

/*STRING \'[^\n']*\'*/
/* String considera todos los caracteres andentro de la comilla DOBALE menos las comillas doble y el salto de linea */
  

/*BOOLEAN "true"|"false"*/
/* NUM_FLOAT {DIGITO}{0,8}{CHAR_PUNTO}{DIGITO}{1,8}*/

/*{NUM_FLOAT} {return NUM_FLOAT;}*/
/*{STRING} {return STRING;}*/

/*{BOOLEAN} {return BOOLEAN;}*/

/*{IDENTIFIER} {yylval.valor_entero = atoi(&yytext[1]); return IDENTIFIER;}*/

/*NUMBER (-?[1-9][0-9]{0,4})|0*/
/*IDENTIFIER x[0-9]+ OP_ASIGNAT "="*/

%} 

%option noyywrap




/* Rule Section */
%% 
"evaluar" {return EVALUAR;}
[-()+*/;] {return *yytext;}
"=" {return OP_ASIGNAT;}

[[:blank]] ;
\t  ;
\r  ;
\n  ;

x[0-9]+               {yylval.valor_entero = atoi(&yytext[1]);return IDENTIFIER;}
(-?[1-9][0-9]{0,4})|0     {yylval.valor_entero=atoi(yytext);return NUMBER;}
.                   yyerror("No se encontro un caracter");
%%