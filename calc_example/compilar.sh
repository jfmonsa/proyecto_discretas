#!/bin/bash
lex lexer.l 
yacc calc.y -d
gcc lex.yy.c y.tab.c
