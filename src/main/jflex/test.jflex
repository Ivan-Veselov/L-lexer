package ru.spbau.bachelors2015.veselov.llexer;

%%

%class JFLexer

%unicode

%type Token

%{
%}

Symbol = [a-z]

%%

<YYINITIAL> {Symbol} { return new Symbol(); }
