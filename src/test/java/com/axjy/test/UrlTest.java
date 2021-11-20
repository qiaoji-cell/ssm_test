package com.axjy.test;

import com.axjy.utils.Utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

/**
 * Created by Joe on 2021/10/26 下午 17:37
 * 获取外网ip
 */
public class UrlTest {
        public static void main(String[] args) {
            String ip = Utils.getOutIp();
            System.out.println(ip);
        }
}
