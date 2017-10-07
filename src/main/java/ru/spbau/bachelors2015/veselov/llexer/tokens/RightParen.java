package ru.spbau.bachelors2015.veselov.llexer.tokens;

import org.jetbrains.annotations.NotNull;

public class RightParen extends DelimiterToken {
    public RightParen(final int line, final int vpos, final int length) {
        super(line, vpos, length);
    }

    @Override
    public @NotNull String name() {
        return "RightParen";
    }
}
