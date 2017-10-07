package ru.spbau.bachelors2015.veselov.llexer.tokens;

import org.jetbrains.annotations.NotNull;

public class Operator extends Token {
    private final @NotNull OperatorType type;

    public Operator(final int line,
                    final int vpos,
                    final int length,
                    final @NotNull OperatorType type) {
        super(line, vpos, length);

        this.type = type;
    }

    @Override
    public @NotNull String name() {
        return "Operator";
    }

    @Override
    protected @NotNull String feature() {
        return type.toString();
    }
}
