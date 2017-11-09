package ru.spbau.bachelors2015.veselov.llexer;

public class UnableToTokenizeException extends RuntimeException {
    private final int line;

    private final int vpos;

    public UnableToTokenizeException(final int line, final int vpos) {
        this.line = line;
        this.vpos = vpos;
    }

    public String toString() {
        return "Unexpected symbol at " + Integer.toString(line) + ":" + Integer.toString(vpos);
    }

}
