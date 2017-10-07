package ru.spbau.bachelors2015.veselov.llexer;

import ru.spbau.bachelors2015.veselov.llexer.tokens.*;
import static ru.spbau.bachelors2015.veselov.llexer.tokens.KeyWordType.*;
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

    private KeyWord keyWord(final KeyWordType type) {
        return new KeyWord(yyline, yycolumn, yytext().length(), type);
    }

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

if { return keyWord(IF); }

then { return keyWord(THEN); }

else { return keyWord(ELSE); }

while { return keyWord(WHILE); }

do { return keyWord(DO); }

read { return keyWord(READ); }

write { return keyWord(WRITE); }

begin { return keyWord(BEGIN); }

end { return keyWord(END); }

true { return keyWord(TRUE); }

false { return keyWord(FALSE); }

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

"(" { return new LeftParen(yyline, yycolumn, yytext().length()); }

")" { return new RightParen(yyline, yycolumn, yytext().length()); }

";" { return new Semicolon(yyline, yycolumn, yytext().length()); }

{Identifier} { return new Identifier(yyline, yycolumn, yytext().length(), yytext().toString()); }
