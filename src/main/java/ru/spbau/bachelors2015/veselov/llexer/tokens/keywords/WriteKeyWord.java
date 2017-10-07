package ru.spbau.bachelors2015.veselov.llexer.tokens.keywords;

import org.jetbrains.annotations.NotNull;

public class WriteKeyWord extends KeyWordToken {
    public WriteKeyWord(final int line, final int vpos, final int length) {
        super(line, vpos, length);
    }

    @Override
    public @NotNull String name() {
        return "WriteKeyWord";
    }
}
