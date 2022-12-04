%{ 
   #include<stdio.h>    
   int yylex(void);
   void yyerror(char *s);
   int variables[1000];
      /*
  <str_comment> 
  <end_comment> :
  <oneline_comment> ::= "//"

   <continue> ::= "continue"
  <break> ::= "break"

  <for_stmt> ::= "for" 
    <str_parenth>
      <asignat> <semicolon>
      <comparation_int> <semicolon>
      <identifier><op_sum><op_sum>
    <end_parenth>
    <str_bracket>
      (<expr_simp>|<expr_comp>)+
    <end_bracket> 
      */


%} 
%union {
   int valor_entero;
   int matecho;
   bool valor_booleano;
}


%token SEMICOLON

%token OP_DIFF OP_COMP_EQUAL OP_NOT OP_MAX OP_MIN OP_MAX_EQUAL OP_MIN_EQUAL OP_ASIGNAT
%token OP_NEG OP_SUM OP_TIMES OP_DIV

%token BOOLEAN STRING
%token <valor_entero> IDENTIFIER
%token <valor_entero> NUMBER

%token EVALUAR

%left OP_SUM OP_NEG
%left OP_TIMES OP_DIV
%left NEG
%left NOT

%token IF ELIF ELSE WHILE FOR

%type <valor_entero> math_op
%type <valor_booleano> n_expr
%type <matecho> asignat
/* %start program*/
/* Rule Section */
%% 


program
   :
   stmt program |
    {return 0;}
;

stmt
   : simple_stmt SEMICOLON |
    desicion_strt |
    {printf("");}
;
simple_stmt
   :
   asignat |
   print |
   {printf("");}
;
desicion_strt
   :
   if_stmt |
   elseif_stmt |
   else_stmt |
   while_stmt |
   for_stmt |
   {printf("");}
;

asignat :
   IDENTIFIER OP_ASIGNAT values SEMICOLON
   { variables[$1] = $3; printf("==> Interpreter: var declaration: xn = %d\n", variables[$1]);}
;
print 
   :
   EVALUAR '(' math_op ')' SEMICOLON
      { printf( "==> Interpreter: Resultado de la operacion = %d\n", $3); }
;

values
   : math_op |
   BOOLEAN |
   STRING |
   {printf("");}
;
expr
   :
   n_expr |
   BOOLEAN |
   {printf("");}
;
n_expr
   :
   math_op |
   IDENTIFIER {$$ = variables[$1];} |
   '(' expr ')' {$$=$2;} |
   expr OP_DIFF expr {$$= $1 != $3;}|
   expr OP_COMP_EQUAL expr {$$= $1 == $3;} |
   OP_NOT expr %prec NOT {$$= !$1;} |
   expr OP_MAX expr {$$= $1 > $3;}|
   expr OP_MIN expr {$$= $1 < $3;}|
   expr OP_MIN_EQUAL expr {$$= $1 <= $3;}|
   expr OP_MAX_EQUAL expr {$$= $1 >= $3;}
;
math_op 
   : math_op OP_SUM math_op {$$ = $1 + $3; } 
   | math_op OP_NEG math_op {$$ = $1 - $3;} 
   | math_op OP_TIMES math_op {$$ = $1 * $3;} 
   | math_op OP_DIV math_op {$$ = $1/$3;}
   | OP_NEG math_op %prec NEG {$$ = -$2;} 
   |'(' math_op ')' {$$ = $2;} 
   | NUMBER {$$ = $1;} 
   | IDENTIFIER {$$ = variables[$1]; }
;

if_stmt
   : IF '(' expr ')' '{' stmt '}' { if($3){$6}; }
;

else_stmt
   : elseif_stmt ELSE '{' stmt '}' { else{$4}; } |
   if_stmt ELSE '{' stmt '}' { else{$4}; }
;
elseif_stmt
   :  if_stmt ELIF '(' expr ')' '{' stmt '}' { else if($4){$7}; } |
   elseif_stmt ELIF '(' expr ')' '{' stmt '}' { else if($4){$7}; } 
;
while_stmt
   : WHILE '(' expr ')' '{' stmt '}' {while($3){$6};}
;
for_stmt
   : FOR '(' asignat SEMICOLON expr SEMICOLON  n_expr OP_SUM OP_SUM ')' '{' stmt '}' { for($3;$5;$7++){$12} ;}
;
%% 
/*
   for_stmt |
*/
  
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