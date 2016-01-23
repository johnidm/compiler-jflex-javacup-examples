
cd /home/johni/Projects/compiler-jflex-javacup-examples/ComplexCalculator/src

java -jar /home/johni/Projects/compiler-jflex-javacup-examples/vendor/jflex-1.6.1.jar Calculator.lex

java -jar /home/johni/Projects/compiler-jflex-javacup-examples/vendor/java-cup-11a.jar -parser Parser -symbols Sym Calculator.cup

echo "\n\n... Fim da compilacao\n\n"
