package ru.spbau.bachelors2015.veselov.llexer.tokens;

import org.jetbrains.annotations.NotNull;

public abstract class Token {
    private final int line;

    private final int vpos;

    private final int length;

    public Token(final int line, final int vpos, final int length) {
        this.line = line;
        this.vpos = vpos;
        this.length = length;
    }

    public int line() {
        return line;
    }

    public int vpos() {
        return vpos;
    }

    public int length() {
        return length;
    }

    public abstract @NotNull String name();

    public @NotNull String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append(name())
               .append('[')
               .append(Integer.toString(line))
               .append(':')
               .append(Integer.toString(vpos));

        if (length > 1) {
            builder.append('-')
                   .append(Integer.toString(vpos + length - 1));
        }

        builder.append(']');

        String feature = feature();
        if (!feature.isEmpty()) {
            builder.append('(')
                   .append(feature)
                   .append(')');
        }

        return builder.toString();
    }

    protected abstract  @NotNull String feature();
}
