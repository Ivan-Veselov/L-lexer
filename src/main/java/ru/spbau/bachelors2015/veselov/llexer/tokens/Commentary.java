package ru.spbau.bachelors2015.veselov.llexer.tokens;

import org.jetbrains.annotations.NotNull;

public class Commentary extends Token {
    private final @NotNull String string;

    public Commentary(final int line,
                      final int vpos,
                      final int length,
                      final @NotNull String string) {
        super(line, vpos, length);

        this.string = string;
    }

    public @NotNull String string() {
        return string;
    }

    @Override
    public @NotNull String name() {
        return "Commentary";
    }

    @Override
    protected @NotNull String feature() {
        return string;
    }
}
