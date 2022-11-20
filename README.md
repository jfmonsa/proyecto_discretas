# Proyecto Final Matematicas Discretas II

## Recursos y tutoriales utilizados
- https://ericknavarro.io/2020/10/01/27-Mi-primer-proyecto-utilizando-Yacc-y-Lex/
- https://ccia.ugr.es/~rosa/tutormc/yacc/Yacc.html
- https://www.ibm.com/docs/es/aix/7.3?topic=information-yacc-grammar-file
- https://github.com/cardel/Cursos/blob/master/Semestres/12.%20Agosto-Diciembre%202022/DiscretasII/Corte3/ExplicacionProyecto.pdf
- https://steemit.com/utopian-io/@drifter1/writing-a-simple-compiler-on-my-own-combine-flex-and-bison
- https://users.exa.unicen.edu.ar/catedras/compila1/index_archivos/Herramientas/Yacc.pdf
- https://medium.com/codex/building-a-c-compiler-using-lex-and-yacc-446262056aaa
- https://www.admb-project.org/tools/flex/compiler.pdf (Book)

### Videos
- https://www.youtube.com/watch?v=8zvgR9gbh68&ab_channel=ProgramacionPHPyMySQL

#### Introuduction to yacc
- https://www.youtube.com/watch?v=yTXCPGAD3SQ&ab_channel=WayneCochran
- https://www.youtube.com/watch?v=mGIme3D0NTA&ab_channel=WayneCochran pt2
- https://www.youtube.com/watch?v=wEFvuOvllkM&ab_channel=WayneCochran pt3
#### Complete tutorial
- https://www.youtube.com/watch?v=54bo1qaHAfk&ab_channel=JonathanEngelsma
- https://www.youtube.com/watch?v=__-wUHG2rfM&ab_channel=JonathanEngelsma pt2

#### Mas videos xd
- https://www.youtube.com/watch?v=IGBCNH7_JOA
- https://www.youtube.com/watch?v=7p4yF_Qmimg
- https://www.youtube.com/watch?v=h14KqP9zUrk
- https://www.youtube.com/watch?v=gnSok6mbvug

## Ejemplo BNF python
- https://docs.python.org/3/reference/grammar.html
- https://github.com/shnewto/bnf
## Otras alternativas
- https://www.dabeaz.com/ply/ply.html
## Generar el pdf con LaTex
- https://ctan.org/pkg/syntax-mdw
### Informacion adicional
- http://www.lcc.uma.es/~galvez/ftp/libros/Compiladores.pdf

# Backus Naur Form
#Tokens
$
<semicolon> ::= ";"
<empty_spc> ::= " "
<dashes> ::= [-_]
<coma> ::= ","

<int> ::= -?[1-9][0-9]*
<bool> ::= <true> | <false>
<string> ::= [a-zA-Z]*

<str_comment> ::= "/*"
<end_comment> ::= "*/"
<oneline_comment> ::= "//"

<op_sum> ::= "+"
<op_minus> ::= "-"
<op_multiply> ::= "*"
<op_division> ::= "/"

<op_asignat> ::= "="
<op_comp_equal> ::= "=="
<op_min_equal> ::= "<="
<op_max_equal> ::= ">="
<op_not> ::= "!"
<op_diff> ::= "!="
$

$
<expr> ::= <expr_simp> | <expr_comp>

<expr_simp> ::= <asignat> <semicolon> |
                <return> <semicolon> |
                <break> <semicolon> |
                <contin> <semicolon> |
                <empty_spc> <semicolon> |
                <new_line>
                
<expr_comp> ::= <function_def> |
                <if_stmt> |
                <while_stmt> |
                <for_stmt>

<expr> ::= <int> |
           <bool> |
           <math_op> |
           <identifier> |
           <asignat>

<math_exp> ::= <int> |
               <identifier> |
               <math_exp> <op_sum> <math_exp> |
               <math_exp> <op_minus> <math_exp> |
               <math_exp> <op_multiply> <math_exp> |
               <math_exp> <op_division> <math_exp>
               
<asignat> ::= <identifier> <op_asign>
<sum> ::= (<math_exp> <op_sum> <math_exp>)+
<identifier> <op_asign>
 
<sustract>
<multiply>
<division>

<return>
<break>
<contin>
<empty_space>
<new_line>

<function_def>
<if_stmt>
<while_stmt>
<for_stmt>

<identifier>
<semicolon>

$

## Tokens
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
/*CONST_CADENA \"[^\n"]*\"*/


  ```
  /*Seccion de tonkes*/



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
  OP_DOSPUNTOS [":"]

  /* Caracteres de apertura, cierre y fin de linea */
  LLAVE_A ["{"]
  LLAVE_C ["}"]
  PARENTESIS_A ["("]
  PARENTESIS_C [")"]
  FIN_SENTENCIA [";"]

  /*Palabras reservadas*/
  IF "if"|"IF"
  WHILE "while"|"WHILE"
  DECVAR "DECVAR"
  ENDDEC "ENDDEC"
  INTEGER "INTEGER"|"integer"
  FLOAT "float"|"FLOAT"
  WRITE "write"|"WRITE"

```
