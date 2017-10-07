package ru.spbau.bachelors2015.veselov.llexer.tokens;

import org.jetbrains.annotations.NotNull;

public abstract class DelimiterToken extends Token {
    public DelimiterToken(final int line, final int vpos, final int length) {
        super(line, vpos, length);
    }

    @Override
    protected @NotNull String feature() {
        return "";
    }
}
