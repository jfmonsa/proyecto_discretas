/*Seccion de definiciones*/
/*se declaran variables que se vayan a usar para el código*/
%{
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>
FILE *yyin
%}

/*Seccion de conjuntos y expresiones regulares */
%option noywrap
%option yylineno

/*Seccion de tonkes*/
NUMERO [0-9]
CHAR [a-zA-Z]
SPACE [" "]
INI_COMENTARIO ["/*"]
FIN_COMENTARIO ["*/"]
GUIONES [-_]
CHAR_COMA [","]
CHAR_PUNTO ["."]
CHAR_PUNTOYCOMA [";"]
CHAR_DOSPUNTOS [":"]

IDENTIFICADOR {LETRA}({LETRA}|{DIGITO}|{GUIONES})*
CONST_INTEGER (-?[1-9][0-9]{0,4})|0
CONST_FLOAT {DIGITO}{0,8}{CHAR_PUNTO}{DIGITO}{1,8}
/*La regex de abajo considera string todo aquello dentro de las comillas dobles excepto el caracter de fin de linea y la propia comilla doble*/
CONST_CADENA \"[^\n"]*\"


/*Operadores logicos y operadores aritmeticos basicos*/
OP_SUMA ["+"]
OP_RESTA  ["-"]
OP_MULT ["*"]
OP_DIV ["/"]
OP_IGUAL ["="]
OP_MAYOR [">"]
OP_MENOR ["<"]
OP_MAYORIGUAL [">="] 
OP_MENORIGUAL ["<="]
OP_COMP_IGUAL ["=="]
OP_NEGACION ["!"]
OP_DISTINTO ["!="]
/*Tiene doble funcionalidad, definir un tipo de datos o asignar un valor*/