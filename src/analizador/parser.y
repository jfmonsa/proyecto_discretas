/*
Archivo donde se definen las reglas de produccion en BNF
*/
%{
#include<stdio.h> 
int yylex(void);
void yyerror(char *s);
FILE *yyin;  
%}

/* ------------- Definicion de tonkens ------------ */
// Caracteres: Apartir de ellos construimos identificadores, palabras reservadas, etc...
%token NUMERO
%token CHAR
%token GUIONES
%token SPACE
%token INI_COMENTARIO
%token FIN_COMENTARIO
%token CHAR_COMA
%token CHAR_PUNTO
%token CHAR_PUNTOYCOMA
%token CHAR_DOSPUNTOS

// El identificador se construye con los caractesr
%token IDENTIFICADOR

// Tipos de datos
%token CONST_INTEGER
%token CONST_FLOAT
%token CONST_CADENA

// Operadores logicos y operadores aritmeticos basicos
%token OP_SUMA
%token OP_RESTA
%token OP_MULT
%token OP_DIV
%token OP_IGUAL
%token OP_MAYOR
%token OP_MENOR
%token OP_MAYORIGUAL
%token OP_MENORIGUAL
%token OP_NEGACION
%token OP_DISTINTO
// precedencia de operadores
%left OP_SUMA OP_RESTA
%left OP_MULT OP_DIVISION

// Caracteres de apertura, cierre y fin de linea 
%token LLAVE_A
%token LLAVE_C
%token PARENTESIS_A
%token PARENTESIS_C
%token FIN_SENTENCIA

// Palabras reservadas del lenguaje
%token IF
%token WHILE
%token FOR
// %token DECVAR
// %token ENDDEC
%token INTEGER
%token FLOAT
// %token WRITE
/* ------------- Definicion de tonkens ------------ */


/* ------------- Rule section (BNF) ----------------- */
%%
list: /*empty */
         |
        list stat '\n'
         |
        list error '\n'
         {
           yyerrok;
         }
         ;

Expr 
   : Expr '+' Expr 
   {
      $$ = $1 + $3; 
   } 
   | Expr '-' Expr 
   {
      $$ = $1 - $3;
   } 
   | Expr '*' Expr 
   {
      $$ = $1 * $3;
   } 
   | Expr '/' Expr 
   {
      $$ = $1/$3;
   }
   | '-' Expr %prec NEG {
      $$ = -$2;
   } 
   |'(' Expr ')' 
   {
      $$ = $2;
   } 
   | NUMBER 
   {
      $$ = $1;
   } 
;
%%
/* ------------- Rule section (BNF) ----------------- */


/* ------------- driver code ----------------- */
void parse(FILE *file) { 
   yyin = file;
   yyparse();
   fclose(yyin);
} 
  
void yyerror(char *s) { 
   printf("\n%s\n", s); 
}