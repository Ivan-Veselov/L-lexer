package ru.spbau.bachelors2015.veselov.llexer.tokens;

import org.jetbrains.annotations.NotNull;

public class Identifier extends Token {
    private final @NotNull String name;

    public Identifier(final int line,
                      final int vpos,
                      final int length,
                      final @NotNull String name) {
        super(line, vpos, length);

        this.name = name;
    }

    @Override
    public @NotNull String name() {
        return "Identifier";
    }

    @Override
    protected @NotNull String feature() {
        return name;
    }
}
