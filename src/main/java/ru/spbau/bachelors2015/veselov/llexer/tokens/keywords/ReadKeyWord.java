package ru.spbau.bachelors2015.veselov.llexer.tokens.keywords;

import org.jetbrains.annotations.NotNull;

public class ReadKeyWord extends KeyWordToken {
    public ReadKeyWord(final int line, final int vpos, final int length) {
        super(line, vpos, length);
    }

    @Override
    public @NotNull String name() {
        return "ReadKeyWord";
    }
}
