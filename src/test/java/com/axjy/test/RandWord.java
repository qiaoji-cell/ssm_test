package com.axjy.test;

import com.axjy.utils.Utils;

import java.util.Random;

/**
 * Created by Joe on 2021/10/26 下午 14:03
 */
public class RandWord {
    public static void main(String[] args) {
        char A = 'A';//65
        char a = 'a';//97
        char Z = 'Z';//90
        char z = 'z';//122
        Random random =  new Random();
        for(int i = 0;i < 20;i++){
            int num =  65+random.nextInt(57);
            System.out.println(num);
        }
        char shu = '[';

        System.out.println(Utils.get4Word());
        System.out.println((int)shu);
    }
}
