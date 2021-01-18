package org.jahia.modules.widgets.taglibs;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.security.SecureRandom;


public class Functions {

    private static final Logger logger = LoggerFactory.getLogger(Functions.class);

    static final String AB = "abcdefghijklmnopqrstuvwxyz";
    static SecureRandom rnd = new SecureRandom();

    public static String randomString(int len){
        StringBuilder sb = new StringBuilder(len);
        for(int i = 0; i < len; i++)
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        return sb.toString();
    }

}