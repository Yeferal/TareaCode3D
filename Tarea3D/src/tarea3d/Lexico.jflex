package tarea6;
import java_cup.runtime.*;
import java.util.ArrayList;

%%
%{
    //coidgo de usuario en sintaxis java
    

%}

    //directivas
%public 
%class AnalizadorLexico
%cupsym Simbolos
%cup
%char
%line
%column
%full
//%ignorecase
//%unicode

//expreciones regulares

Letra               = [a-zA-Z]
Digito              = [0-9]
Numero              = {Digito} {Digito}*
Palabra             = {Letra}+
Espacio             = [" "\t\r\b\n]+
//Salto               = [\n\t\r" "]+
%%

<YYINITIAL> {
    {Espacio}                       {/*Ignore*/}
    ({Numero})*                     {return new Symbol(Simbolos.NUM, yycolumn, yyline, yytext());}
    //("-"({Numero})*)                {return new Symbol(Simbolos.NUM_N, yycolumn, yyline, yytext());}
    "*"                             {return new Symbol(Simbolos.POR, yycolumn, yyline, yytext());}
    "/"                             {return new Symbol(Simbolos.DIV, yycolumn, yyline, yytext());}
    "("                             {return new Symbol(Simbolos.P_A , yycolumn, yyline, yytext());}
    "+"                             {return new Symbol(Simbolos.MAS , yycolumn, yyline, yytext());}
    "-"                             {return new Symbol(Simbolos.MENOS , yycolumn, yyline, yytext());}
    ")"                             {return new Symbol(Simbolos.P_C , yycolumn, yyline, yytext());}
    ";"                             {return new Symbol(Simbolos.PUNTO_COMA , yycolumn, yyline, yytext());}
    "="                             {return new Symbol(Simbolos.IGUAL , yycolumn, yyline, yytext());}
    (({Palabra})|({Numero})*)*      {return new Symbol(Simbolos.ID , yycolumn, yyline, yytext());}
    .                               {
                                    //ErrorG e = new ErrorG(yyline+1, yycolumn+1,yytext(),"Lexico","Error Lexico token: " + yytext()+"   Linea: " + (yyline+1) + " ,    Columna: " + (yycolumn+1));
                                    //listaErrores.add(e);
                                    //return new Symbol(Simbolos.CUALQUIER_SIM , yycolumn, yyline, yytext());
                                    }
    
}
