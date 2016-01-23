
// java -jar ../../vendor/java-cup-11a.jar -parser MyParser -symbols MySymbol < MyParser.cup
// java -jar ../../vendor/jflex-1.6.1.jar MyScanner.lex

import java.io.FileNotFoundException;
import java.io.FileReader;

class Main {
	public static void main(String[] args) throws FileNotFoundException {

		String fileName = "lang.l";  

		MyParser parser = new MyParser(new MyScanner(new FileReader(fileName)));
		try {
//			parser.parse();
			parser.debug_parse();
		}
		catch (Exception e) {
			System.out.println("Caught an exception.");
		}
	}
}