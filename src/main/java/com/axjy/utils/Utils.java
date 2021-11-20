package com.axjy.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.Random;

/**
 * Created by Joe on 2021/09/07 下午 12:04
 */
public class Utils {
    /**
     * md5加密
     * @param str 加密的字符串
     * @param salt 颜值
     * @return hash码
     */
    public static String toMd5(String str,String salt){
        Md5Hash md5Hash = new Md5Hash(str,salt);
        return md5Hash.toString();
    }

    public static String get4Word(){
        String str = "";
        Random random =  new Random();
        for(int i = 0;i < 4;i++){
            int num =  65+random.nextInt(57);
            System.out.println(num);
            str += (char)num;
        }
        return str;
    }

    public static String getOutIp(){
        String ip = "";
        try {
            URL url = new URL("https://ifconfig.me/");
            URLConnection URLconnection = url.openConnection();
            HttpURLConnection httpConnection = (HttpURLConnection) URLconnection;
            int responseCode = httpConnection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                System.err.println("成功");
                InputStream in = httpConnection.getInputStream();
                InputStreamReader isr = new InputStreamReader(in);
                BufferedReader bufr = new BufferedReader(isr);
                String str;
                while ((str = bufr.readLine()) != null) {
                    ip = str;
                }
                bufr.close();
            } else {
                System.err.println("失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ip;
    }






}
