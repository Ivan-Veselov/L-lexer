package ru.spbau.bachelors2015.veselov.llexer;

import org.jetbrains.annotations.NotNull;

public class TokenUtils {
    private static TokenUtils instance;

    private TokenUtils() {}

    public static @NotNull TokenUtils getInstance() {
        if (instance == null) {
            instance = new TokenUtils();
        }

        return instance;
    }

    public @NotNull String toString(final @NotNull TokenStream tokens) {
        StringBuilder builder = new StringBuilder();
        while (tokens.hasNext()) {
            builder.append(tokens.next()).append('\n');
        }

        return builder.toString();
    }
}
