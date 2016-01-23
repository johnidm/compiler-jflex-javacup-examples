
import java.io.File;
import java.io.FileReader;

public class Main {
	public static void main( String[] argv ) {
		
		try {
			String dirName = "/home/johni/Projects/compiler-jflex-javacup-examples/ComplexCalculator/src/";
			
			File file = new File( dirName, "program.in" );
			
			Parser p = new Parser( file );
			// p.parse();
			p.debug_parse();
		}
		catch ( Exception e ) {
			System.err.println( "Exception at " );
			e.printStackTrace();
		}
	}
}