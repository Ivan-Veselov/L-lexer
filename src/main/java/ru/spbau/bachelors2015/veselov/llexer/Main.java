package ru.spbau.bachelors2015.veselov.llexer;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;

import static org.apache.commons.io.FileUtils.readFileToString;

public class Main {
    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("One argument is required: path to L source file.");
            return;
        }

        TokenStream tokens;
        try {
            tokens = new TokenStream(readFileToString(new File(args[0]), (Charset) null));
        } catch (IOException e) {
            System.out.println("Failed to read the given file.");
            return;
        }

        try {
            System.out.println(TokenUtils.getInstance().toString(tokens));
        } catch (UnableToTokenizeException e) {
            System.out.println(e);
        }
    }
}
