package com.axjy.test;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * Created by Joe on 2021/10/12 上午 8:38
 */
public class HashMd5Test {
    public static void main(String[] args) {
        Md5Hash hash = new Md5Hash("123456", ByteSource.Util.bytes("secret"),1);
        System.out.println(hash.toString());
        String hashAlgorithmName = "MD5";
        String credentials = "qiseguang";
        int hashIterations = 1;
        Object obj = new SimpleHash(hashAlgorithmName, credentials, "secret", hashIterations);
        System.out.println(obj);
    }
}
