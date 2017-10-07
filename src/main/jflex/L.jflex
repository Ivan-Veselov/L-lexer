package ru.spbau.bachelors2015.veselov.llexer;

import ru.spbau.bachelors2015.veselov.llexer.tokens.*;
import ru.spbau.bachelors2015.veselov.llexer.tokens.keywords.*;

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

Letter = [a-z]

Commentary = \/\/{NotEOL}*

%%

({EOL} | {Whitespace})* {}

{Commentary} { return new Commentary(yyline, yycolumn, yytext().length(), yytext().toString()); }

if { return new IfKeyWord(yyline, yycolumn, yytext().length()); }

then { return new ThenKeyWord(yyline, yycolumn, yytext().length()); }

else { return new ElseKeyWord(yyline, yycolumn, yytext().length()); }

while { return new WhileKeyWord(yyline, yycolumn, yytext().length()); }

do { return new DoKeyWord(yyline, yycolumn, yytext().length()); }

read { return new ReadKeyWord(yyline, yycolumn, yytext().length()); }

write { return new WriteKeyWord(yyline, yycolumn, yytext().length()); }

begin { return new BeginKeyWord(yyline, yycolumn, yytext().length()); }

end { return new EndKeyWord(yyline, yycolumn, yytext().length()); }
