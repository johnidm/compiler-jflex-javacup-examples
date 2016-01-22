#!/bin/bash

cd /home/johni/Projects/compiler-jflex-javacup-examples/SimpleCalc/src/

java -jar /home/johni/Projects/compiler-jflex-javacup-examples/vendor/jflex-1.6.1.jar Calc.lex

java -jar /home/johni/Projects/compiler-jflex-javacup-examples/vendor/java-cup-11a.jar -parser Parser -symbols Sym Calc.cup

echo "\n\n... Fim da compilacao\n\n"




