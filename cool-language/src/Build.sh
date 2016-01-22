#!/bin/bash


lexer() {
	cd /home/johni/Projects/compiler-jflex-javacup-examples/cool-language/src/
	rm -rf Lexer.java*
	java -jar /home/johni/Projects/compiler-jflex-javacup-examples/vendor/jflex-1.6.1.jar Lexer.lex
}
           
parser() {
	cd /home/johni/Projects/compiler-jflex-javacup-examples/cool-language/src/
	rm -rf Parser.java
	rm -rf Sym.java
	java -jar /home/johni/Projects/compiler-jflex-javacup-examples/vendor/java-cup-11a.jar -parser Parser -symbols Sym Parser.cup
}

result() {
	RED='\033[0;32m'
	NC='\033[0m' # No Color
	printf "\n\n${RED}Fim da compilacao${NC}\n\n"
}

lexer
parser
result


