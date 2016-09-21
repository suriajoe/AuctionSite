package com.cs336.pkg;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Utilities {

    /**
     *
     * @param input the string to check
     * @return true if the string does not contain any special characters, false otherwise
     */
    public static boolean inputCheck( String input ) {

        input.trim();
        if (input == null || input.trim().isEmpty()) {
            return false;
        }

        Pattern p = Pattern.compile("[^A-Za-z0-9 :'-]");
        Matcher m = p.matcher(input);
        return !m.find();
    }
}
