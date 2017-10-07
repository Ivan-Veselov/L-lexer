package ru.spbau.bachelors2015.veselov.llexer;

import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class TokenStream implements Iterator<Token> {
    private final @NotNull JFLexer lexer;

    private Token nextToken = null;

    public TokenStream(final @NotNull CharSequence chars) {
        lexer = new JFLexer(null);
        lexer.reset(chars, 0, chars.length(), JFLexer.YYINITIAL);
    }

    @Override
    public boolean hasNext() {
        if (nextToken != null) {
            return true;
        }

        try {
            nextToken = lexer.yylex();
        } catch (IOException e) {
        }

        return nextToken != null;
    }

    @Override
    public Token next() {
        if (nextToken == null) {
            try {
                nextToken = lexer.yylex();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        if (nextToken == null) {
            throw new NoSuchElementException();
        }

        Token token = nextToken;
        nextToken = null;
        return token;
    }
}
