package ru.spbau.bachelors2015.veselov.llexer;

import ru.spbau.bachelors2015.veselov.llexer.tokens.*;

%%

%class JFLexer

%unicode
%ignorecase

%line
%column

%type Token

%{
    private int yyline = 0;

    private int yycolumn = 0;
%}

EOL = \x0D | \x0A | \x0D\x0A // CR | LF | CR LF
NotEOL = [^\x0D\x0A]
Whitespace = {EOL} | \x20 | \x09 | \x0C // SP | HT | FF

Commentary = \/\/{NotEOL}*

%%

({EOL} | {Whitespace})* {}

{Commentary} { return new Commentary(yyline, yycolumn, yytext().length(), yytext().toString()); }

