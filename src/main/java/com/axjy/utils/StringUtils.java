package com.axjy.utils;

/**
 * Created by Joe on 2021/09/16 下午 16:18
 */
public class StringUtils {
    public static boolean isNullOrEmpty(String str){
        if(str==null||str.equals("")){
            return true;
        }else{
            return false;
        }
    }
}
