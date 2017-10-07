package ru.spbau.bachelors2015.veselov.llexer.tokens.keywords;

import org.jetbrains.annotations.NotNull;
import ru.spbau.bachelors2015.veselov.llexer.tokens.Token;

public abstract class KeyWordToken extends Token {
    public KeyWordToken(final int line, final int vpos, final int length) {
        super(line, vpos, length);
    }

    @Override
    protected @NotNull String feature() {
        return "";
    }
}
