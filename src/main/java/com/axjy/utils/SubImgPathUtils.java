package com.axjy.utils;

/**
 * Created by Joe on 2021/09/16 下午 13:02
 */
public class SubImgPathUtils {
    public static String cutPath(String path){
        int lastSlashIndex = path.lastIndexOf("\\");
        path = path.substring(lastSlashIndex+1,path.length());
        return path;
    }
}
