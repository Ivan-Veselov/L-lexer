package ru.spbau.bachelors2015.veselov.llexer.tokens;

import org.jetbrains.annotations.NotNull;

public class KeyWord extends Token {
    private final @NotNull KeyWordType type;

    public KeyWord(final int line,
                   final int vpos,
                   final int length,
                   final @NotNull KeyWordType type) {
        super(line, vpos, length);

        this.type = type;
    }

    @Override
    public @NotNull String name() {
        return "KeyWord";
    }

    @Override
    protected @NotNull String feature() {
        return type.toString();
    }
}
