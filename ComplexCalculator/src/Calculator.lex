import java.io.*;
import java_cup.runtime.*;

%%

%public
%type		Symbol
%char


%{
	private int lineNumber = 1;
	public int lineNumber() { return lineNumber; }
	
    private Symbol token(int type) {
        return new Symbol(type);
    }
    private Symbol token(int type, Object value) {
        return new Symbol(type);
    }
%}

number		=	[0-9]+
ident		=	[A-Za-z][A-Za-z0-9]*
space		=	[\ \t]
newline		=	\r|\n|\r\n

%%

"="			{ return token( Sym.ASSIGN ); }
"+"			{ return token( Sym.PLUS ); }
"-"			{ return token( Sym.MINUS ); }
"*"			{ return token( Sym.TIMES ); }
"/"			{ return token( Sym.DIVIDE ); }
"("			{ return token( Sym.LEFT ); }
")"			{ return token( Sym.RIGHT ); }
{newline}	{ lineNumber++; return token( Sym.NEWLINE ); }
{space}		{ }

{number}	{ return token( Sym.NUMBER, new Integer(yytext()) ); }
{ident}		{ return token( Sym.IDENT,  yytext()); }

.			{ return token( Sym.error ); }
<<EOF>>		{ return token( Sym.EOF ); }