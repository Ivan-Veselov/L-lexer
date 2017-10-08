package ru.spbau.bachelors2015.veselov.llexer.tokens;

import org.jetbrains.annotations.NotNull;

public class FloatingPointLiteral extends Token {
    private final double value;

    public FloatingPointLiteral(final int line,
                                final int vpos,
                                final int length,
                                final double value) {
        super(line, vpos, length);

        this.value = value;
    }

    @Override
    public @NotNull String name() {
        return "FloatingPointLiteral";
    }

    @Override
    protected @NotNull String feature() {
        return Double.toString(value);
    }
}
