import java.io.FileNotFoundException;
import java.io.FileReader;

// java -jar ../../vendor/jflex-1.6.1.jar calculator.lex
// java -jar ../../vendor/java-cup-11a.jar -parser Parser < calculator.cup 

public class Main {

	public static void main(String[] args) throws FileNotFoundException {
		
		String fileName = "/home/johni/Projects/compiler-jflex-javacup-examples/OtherCalc/src/calc.l";  

		Parser parser = new Parser(new Lexer(new FileReader(fileName)));
		try {
			parser.parse();
//			parser.debug_parse();
		}
		catch (Exception e) {
			System.out.println("Caught an exception.");
		}

	}

}
