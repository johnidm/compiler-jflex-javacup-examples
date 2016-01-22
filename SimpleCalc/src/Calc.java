import java.io.FileReader;


public class Calc { 
   static public void main(String argv[]) throws Exception { 
      
	  String fileName = "/home/johni/Projects/compiler-jflex-javacup-examples/SimpleCalc/src/Calc.language";  
	  
	  Yylex scanner = new Yylex( new FileReader(fileName) ); 
      Parser p = new Parser( scanner ); 
      p.parse(); 
      
 } } 