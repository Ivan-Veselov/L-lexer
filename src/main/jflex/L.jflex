package ru.spbau.bachelors2015.veselov.llexer;

import ru.spbau.bachelors2015.veselov.llexer.tokens.*;
import ru.spbau.bachelors2015.veselov.llexer.tokens.keywords.*;
import static ru.spbau.bachelors2015.veselov.llexer.tokens.OperatorType.*;

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

    private Operator operator(final OperatorType type) {
        return new Operator(yyline, yycolumn, yytext().length(), type);
    }
%}

EOL = \x0D | \x0A | \x0D\x0A // CR | LF | CR LF
NotEOL = [^\x0D\x0A]
Whitespace = {EOL} | \x20 | \x09 | \x0C // SP | HT | FF
NotWhitespace = [^\x0D\x0A\x20\x09\x0C]

Letter = [a-z]

Commentary = \/\/{NotEOL}*

Identifier = ({Letter} | _) ({NotWhitespace})*

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

true { return new TrueKeyWord(yyline, yycolumn, yytext().length()); }

false { return new FalseKeyWord(yyline, yycolumn, yytext().length()); }

{Identifier} { return new Identifier(yyline, yycolumn, yytext().length(), yytext().toString()); }

"+" { return operator(PLUS); }

"-" { return operator(MINUS); }

"*" { return operator(MULT); }

"/" { return operator(DIV); }

"%" { return operator(REM); }

"==" { return operator(EQ); }

"!=" { return operator(NEQ); }

">" { return operator(GRT); }

">=" { return operator(GRT_EQ); }

"<" { return operator(LESS); }

"<=" { return operator(LESS_EQ); }

"&&" { return operator(AND); }

"||" { return operator(OR); }
