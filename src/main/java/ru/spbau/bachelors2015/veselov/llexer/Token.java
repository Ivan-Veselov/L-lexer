package ru.spbau.bachelors2015.veselov.llexer;

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
}
