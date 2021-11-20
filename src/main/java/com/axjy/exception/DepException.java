package com.axjy.exception;

import lombok.Data;

/**
 * Created by Joe on 2021/11/12 上午 10:08
 */
@Data
public class DepException extends RuntimeException{
    Integer code;
    public DepException(String message, Integer code) {
        super(message);
        this.code = code;
    }
}
