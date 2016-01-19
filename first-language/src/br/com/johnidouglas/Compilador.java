package br.com.johnidouglas;


import java.io.FileReader;
import java.nio.file.Paths;

public class Compilador {

	static public void main(String argv[]) {

		String rootPath = Paths.get("").toAbsolutePath().toString();
		String subPath = "/src/br/com/johnidouglas/";

		String sourcecode = rootPath + subPath + "sextafase.pg";
        
		
		try {
			Parser p = new Parser(new Lexer(new FileReader(sourcecode)));
			Object result = p.parse().value;
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
