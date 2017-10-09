package ru.spbau.bachelors2015.veselov.llexer;

import org.apache.commons.io.FileUtils;
import org.jetbrains.annotations.NotNull;
import org.junit.Test;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

public class TokenStreamTest {
    @Test
    public void test() throws Exception {
        Path sourcesRoot = Paths.get(getClass().getResource("/sources/").toURI());

        List<String> fileNames = new ArrayList<>();
        SimpleFileVisitor<Path> visitor = new SimpleFileVisitor<Path>() {
            public FileVisitResult visitFile(Path file, BasicFileAttributes attrs)
                    throws IOException {
                if (file.toString().endsWith(".L")) {
                    String fileName = sourcesRoot.relativize(file).toString();
                    fileNames.add(fileName.substring(0, fileName.length() - 2));
                }

                return FileVisitResult.CONTINUE;
            }
        };

        Files.walkFileTree(sourcesRoot, visitor);
        for (String fileName : fileNames) {
            checkProgram(fileName);
        }
    }

    private void checkProgram(final @NotNull String fileName)
            throws Exception {
        assertEquals(fileToString("/tokens/" + fileName),
            TokenUtils.getInstance()
                      .toString(new TokenStream(
                              fileToString("/sources/" + fileName + ".L"))));
    }

    private @NotNull String fileToString(final @NotNull String fileName) throws Exception {
        Path pathToFile = Paths.get(getClass().getResource(fileName).getFile());
        return FileUtils.readFileToString(pathToFile.toFile(), (Charset) null);
    }
}