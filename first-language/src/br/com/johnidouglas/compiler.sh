#!/bin/bash

cd /home/johni/Projects/compiler-jflex-javacup/src/br/com/johnidouglas/

echo "... Compilando Analisador Léxico"
java -jar /home/johni/.m2/repository/de/jflex/jflex/1.6.1/jflex-1.6.1.jar Lexer.lex

echo "... Compilando Analisador Sintático"
java -jar /home/johni/.m2/repository/net/sf/squirrel-sql/thirdparty/non-maven/java-cup/11a/java-cup-11a.jar -parser Parser -symbols Sym Parser.cup

echo "\n\n... Fim da compilacao\n\n"