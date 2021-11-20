package com.axjy.test;

/**
 * Created by Joe on 2021/10/11 上午 7:03
 */
public class Singleton {

    private Singleton(){};
    public static Singleton getInstance(){
        return Hello.singleton;
    }
    static class Hello{
        public static Singleton singleton = new Singleton();
    }
}
