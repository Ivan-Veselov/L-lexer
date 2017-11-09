package ru.spbau.bachelors2015.veselov.llexer;

import ru.spbau.bachelors2015.veselov.llexer.tokens.*;
import static ru.spbau.bachelors2015.veselov.llexer.tokens.KeyWordType.*;
import static ru.spbau.bachelors2015.veselov.llexer.tokens.OperatorType.*;

%%

%class JFLexer

%unicode

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

Letter = [a-z]
Digit = [0-9]
NonZeroDigit = [1-9]
Underscore = _
Underscores = {Underscore}+

DigitOrUnderscore = {Digit} | {Underscore}
DigitsAndUnderscores = {DigitOrUnderscore}+
Digits = {Digit} | {Digit} {DigitsAndUnderscores}? {Digit}

Commentary = \/\/{NotEOL}*

Identifier = ({Letter} | {Underscore}) ({Letter} | {Digit} | {Underscore})*

// Decimal integer literal

DecimalIntegerLiteral =
    "0" |
    {NonZeroDigit} {Digits}? |
    {NonZeroDigit} {Underscores} {Digits}

// Decimal floating point literal

ExponentIndicator = e | E

Sign = "+" | "-"
SignedInteger = {Sign}? {Digits}

ExponentPart = {ExponentIndicator} {SignedInteger}

DecimalFloatingPointLiteral =
    {Digits} "." {Digits}? {ExponentPart}? |
    "." {Digits} {ExponentPart}? |
    {Digits} {ExponentPart}

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

":=" { return new Assignment(yyline, yycolumn, yytext().length()); }

{DecimalIntegerLiteral} {
    return new FloatingPointLiteral(yyline,
                                    yycolumn,
                                    yytext().length(),
                                    Long.parseLong(yytext().toString().replace("_", "")));
}

{DecimalFloatingPointLiteral} {
    return new FloatingPointLiteral(yyline,
                                    yycolumn,
                                    yytext().length(),
                                    Double.parseDouble(yytext().toString().replace("_", "")));
}

{Identifier} { return new Identifier(yyline, yycolumn, yytext().length(), yytext().toString()); }

[^] { throw new UnableToTokenizeException(); }
