package br.com.johnidouglas;

import java.io.*;
import java_cup.runtime.*;


%%


%cup
%public
%class Lexer
%type Symbol
%line
%column


%{

	public void log( int type ) {
		System.out.println("Lendo token " + type + " \"" + yytext() + "\"" );
	}

	private Symbol symbol(int type) {
		log(type);
        return new Symbol(type, yyline, yycolumn);
    }    
    
    private Symbol symbol(int type, Object value) {
        log(type);
        return new Symbol(type, yyline, yycolumn, value);
    }

%}

DIGITO = [0-9]
INTEIRO = {DIGITO}+
IDENTIFICADOR = [A-Za-z_][A-Za-z_0-9]*
ESPACO_EM_BRANCO = [\n|\s|\t\r]

%%

<YYINITIAL> {

	"inicio"	{ return symbol(Sym.INICIO); }
	"fim"       { return symbol(Sym.FIM); }
	"para"      { return symbol(Sym.PARA); }
	"ate"       { return symbol(Sym.ATE); }
	"faca"      { return symbol(Sym.FACA); }
	"*"         { return symbol(Sym.MULTIPLICACAO); }
	"<-"        { return symbol(Sym.ATRIBUICAO); }
	">>"        { return symbol(Sym.VARIAVEL); }
	";"         { return symbol(Sym.PONTO_E_VIRGULA); }
	":"        	{ return symbol(Sym.DOIS_PONTOS); }
	"Inteiro"   { return symbol(Sym.TIPO_INTEIRO); }
	"func"   { return symbol(Sym.FUNCAO); }
	
	"("   { return symbol(Sym.ABRE_PARENTESES); }
	")"   { return symbol(Sym.FECHA_PARENTESES); }
	","   { return symbol(Sym.VIRGULA); }
		
	
	":"	{ return symbol(Sym.INICIO); }
	
	{INTEIRO} 		{ return symbol(Sym.NUMERO, new Integer(yytext())); 		}
	{IDENTIFICADOR}	{ return symbol(Sym.ID); 	}
	
	{ESPACO_EM_BRANCO}	{}

}

<<EOF>> { return symbol( Sym.EOF ); }


[^] { throw new Error("Illegal character: "+yytext()+" at line "+(yyline+1)+", column "+(yycolumn+1) ); } 