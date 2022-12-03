%{ 
   #include<stdio.h>    
   int yylex(void);
   void yyerror(char *s);
   int variables[1000];

   /* FILE *yyin; */
%} 
%union {
   int valor_entero;
}
/* EVALUAR OP_ASIGNAT IDENTIFIER NUMBER */

%token EVALUAR
%token OP_ASIGNAT
%token <valor_entero> IDENTIFIER
%token <valor_entero> NUMBER

/* %start Program */
%left '+' '-'
%left '*' '/'
%left NEG

%type <valor_entero> math_op  
/* Rule Section */
%% 
  
Program 
   :
   asignat Program | 
   print Program|
     {
      return 0;
   }
;

print 
   :
   EVALUAR '(' math_op ')' ';'
      { printf( "==> Interpreter: Resultado de la operacion = %d\n", $3); }
;

asignat
   :
   IDENTIFIER OP_ASIGNAT math_op ';'
   { variables[$1] = $3; printf("==> Interpreter: var declaration: xn = %d\n", variables[$1]);}
;

math_op 
   : math_op '+' math_op 
   {
      $$ = $1 + $3; 
   } 
   | math_op '-' math_op 
   {
      $$ = $1 - $3;
   } 
   | math_op '*' math_op 
   {
      $$ = $1 * $3;
   } 
   | math_op '/' math_op 
   {
      $$ = $1/$3;
   }
   | '-' math_op %prec NEG {
      $$ = -$2;
   } 
   |'(' math_op ')' 
   {
      $$ = $2;
   } 
   | NUMBER 
   {
      $$ = $1;
   } 
   | IDENTIFIER
   {
      $$ = variables[$1];
      // printf("\nidetifier = %d\n",variables[$1]);
   }
; 
  
%% 
  
int main(){
    return(yyparse());
}

void yyerror(char *s) { 
   printf("\n%s\n", s); 
}

/*
int  parse(FILE *file) { 
   yyin = file;
   int r = yyparse();
   fclose(yyin);
   return r;
}
*/