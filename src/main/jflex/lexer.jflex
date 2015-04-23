import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
%%
%public
%class Lexer
%standalone

%{
    private List<String> tokens = new ArrayList<>();
%}

%{
    public List<String> analizar(String archivo){
        FileReader in = null;
        try{
            in = new FileReader(archivo);
            Lexer lex = new Lexer(in);
            while(!lex.zzAtEOF){
            lex.yylex();
            }
        }catch(Exception ex){
            System.out.println("NO JALO D:");
        }finally{
            try{
                in.close();
            }catch(Exception ex){
                System.out.println("NO CERRO D:");
            }
        }
            return tokens;
    }
%}

%%

":"     {tokens.add(":"); System.out.println("DOS_PUNTOS");}
";"     {tokens.add(";"); System.out.println("PUNTO_COMA");}
"<"     {tokens.add("<"); System.out.println("MAY_QUE");}
">"     {tokens.add(">"); System.out.println("MEN_QUE");}
={2}    {tokens.add("=="); System.out.println("IGUAL");}
%{2}    {tokens.add("%%"); System.out.println("MOD");}
[0-9]+  {tokens.add("numero"); System.out.println("NUM");}
[_a-zA-Z][A-Za-z]* {tokens.add("id"); System.out.println("ID");}