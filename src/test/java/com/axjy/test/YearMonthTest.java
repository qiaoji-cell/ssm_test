package com.axjy.test;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * Created by Joe on 2021/11/04 上午 07:06
 */
public class YearMonthTest {
    public static void main(String[] args) {
        String yearMonth = "2021-12-11";
        LocalDate date = LocalDate.parse(yearMonth);
        System.out.println(date);
    }
}
