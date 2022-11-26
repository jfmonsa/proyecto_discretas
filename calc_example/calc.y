%{ 
   #include<stdio.h> 
   int yylex(void);
   void yyerror(char *s);
   /* FILE *yyin; */
%} 
  
%token NUMBER EVALUAR

%start INICIO
%left '+' '-'
%left '*' '/'
%left NEG

  
/* Rule Section */
%% 
  
INICIO 
   : Lista {
      return 0;
   }
;

Lista 
   : Lista EVALUAR '(' Expr ')' ';'
   {
      printf("\nResult=%d\n", $4);
   }
   | EVALUAR '(' Expr ')' ';'
   { 
      printf("\nResult=%d\n", $3); 
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
  
//driver code
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