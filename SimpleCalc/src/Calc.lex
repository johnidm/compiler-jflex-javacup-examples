import java_cup.runtime.Symbol;

%%

%cup
%public
%line
%column

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}


%%

<YYINITIAL> {

	"="         { System.out.print(" = "); return symbol(Sym.EQ); }
	"+"         { System.out.print(" + "); return symbol(Sym.PLUS); }
	"*"         { System.out.print(" * "); return symbol(Sym.TIMES); }
	"("         { System.out.print(" ( "); return symbol(Sym.LPAREN); }
	")"         { System.out.print(" ) "); return symbol(Sym.RPAREN); }
	[0-9]+      { System.out.print(yytext());
	              return symbol(Sym.NUMBER, new Integer(yytext())); }
	[ \n]+      {}

}

<<EOF>> { return new Symbol( Sym.EOF ); }


[^] { throw new Error("Illegal character: "+yytext()+" at line "+(yyline+1)+", column "+(yycolumn+1) ); } 