package com.axjy.test;

import java.time.LocalDate;

/**
 * Created by Joe on 2021/11/05 下午 10:57
 */
public class MonthTest {
    public static void main(String[] args) {
        String month = LocalDate.now().getYear()+"-"+LocalDate.now().getMonthValue()+"-01";
        LocalDate date = LocalDate.parse(month);
        System.out.println(date);
    }
}
