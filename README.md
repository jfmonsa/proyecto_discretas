# Proyecto Final Matematicas Discretas II

# Backus Naur Form

```
  <semicolon> ::= ";"
  <dashes> ::= [-_]
  <coma> ::= ","
  
  <empty_spc> ::= " "
  <new_line> ::= "\n"

  <empty_chrs> ::= (<new_line> | <empty_spc>)*

  <int> ::= -?[1-9][0-9]*
  <bool> ::= "true" | "false"
  <char> ::= [a-zA-Z]+
  <string> ::= <char> | <dashes> | <int>

  <str_comment> ::= "/*"
  <end_comment> ::= "*/"
  <oneline_comment> ::= "//"

  <op_sum> ::= "+"
  <op_minus> ::= "-"
  <op_multiply> ::= "*"
  <op_division> ::= "/"

  <op_asignat> ::= "="

  <op_comp_equal> ::= "=="
  <op_max> ::= ">"
  <op_min> ::= "<"
  <op_min_equal> ::= "<="
  <op_max_equal> ::= ">="
  <op_not> ::= "!"
  <op_diff> ::= "!="

  <comparation_logic> ::= <int> |
                        <identifier> |
                        <comparation_logic><op_diff><comparation_logic> |
                        <comparation_logic><op_comp_equal><comparation_logic> |
                        <op_not><identifier>

  <comparation_int> ::= <int> |
                        <identifier> |
                        <comparation_int><op_max><comparation_int>|
                        <comparation_int><op_min><comparation_int>|
                        <comparation_int><op_min_equal><comparation_int>|
                        <comparation_int><op_max_equal><comparation_int>|

  <srt_bracket> ::= "{"
  <end_bracket> ::= "}"
  <str_parenth> ::= ")"
  <end_parenth> ::= "("

  <continue> ::= "continue"
  <break> ::= "break"

  <identifier> ::= <char>(<char>|<int>|<dashes>)*

  <expr> ::= <expr_simp> | <expr_comp>

  <expr_comp> ::= <function_def> |
                  <if_stmt> |
                  <else_stmt> |
                  <elif_stmt> |
                  <while_stmt> |
                  <for_stmt> |
                  <new_line>

  <expr_simp> ::= <int> |
             <bool> |
             <math_op> |
             <identifier> |
             <asignat> |
             <continue> |
             <break>

  <math_exp> ::= <int> |
                 <identifier> |
                 <math_exp> <op_sum> <math_exp> |
                 <math_exp> <op_minus> <math_exp> |
                 <math_exp> <op_multiply> <math_exp> |
                 <math_exp> <op_division> <math_exp>

  <asignat> ::= <identifier> <op_asign> <expr>


  <if_stmt> ::= "if" <str_parenth> (<bool>|<comparation_int>|<comparation_logic>)+ <end_parenth>
                <str_bracket>
                (<expr_simp>|<expr_comp>)+
                <end_bracket>
                (<elif_stmt>|<else_stmt>)*

  <else_stmt> ::= "else" <str_bracket> (<expr_simp>|<expr_comp>)+ <end_bracket>

  <elif_stmt> ::= "if" <str_parenth> (<bool>|<comparation_int>|<comparation_logic>)+ <end_parenth>
                <str_bracket>
                (<expr_simp>|<expr_comp>)+
                <end_bracket>
                (<elif_stmt>)*
                (<else_stmt>)* 

  <while_stmt> ::= "while" <str_parenth> (<bool>|<comparation_int>|<comparation_logic>)+ <end_parenth>
    <str_bracket>
      (<expr_simp>|<expr_comp>)+
    <end_bracket> 

  <for_stmt> ::= "for" 
    <str_parenth>
      <asignat> <semicolon>
      <comparation_int> <semicolon>
      <identifier><op_sum><op_sum>
    <end_parenth>
    <str_bracket>
      (<expr_simp>|<expr_comp>)+
    <end_bracket> 

```

## Recursos y tutoriales utilizados
- https://gnuu.org/2009/09/18/writing-your-own-toy-compiler/ < Tuto completo
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

### Informacion adicional
- http://www.lcc.uma.es/~galvez/ftp/libros/Compiladores.pdf


