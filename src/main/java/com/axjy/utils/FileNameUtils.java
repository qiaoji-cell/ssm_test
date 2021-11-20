package com.axjy.utils;

/**
 * Created by Joe on 2021/09/14 下午 21:44
 */
public class FileNameUtils {

    public static String getExtension(String name){
        int lastDotted = name.lastIndexOf(".");
        name = name.substring(lastDotted+1,name.length());
        return name;
    }
}
