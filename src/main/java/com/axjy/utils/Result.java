package com.axjy.utils;

import com.github.pagehelper.PageInfo;
import lombok.Data;

/**
 * Created by Joe on 2021/09/03 上午 9:55
 */
@Data
public class Result {
    private Integer code;
    private String msg;
    private long count;
    private Object data;

    public static Result success(Object object, String msg){
        Result result = new Result();

        result.setCode(0);
        result.setData(object);
        result.setMsg(msg);

        return result;
    }
    public static Result success(Object object){
        Result result = new Result();

        result.setCode(0);
        result.setData(object);
        result.setMsg("查询成功了");

        return result;
    }

    public static Result success(PageInfo pageInfo){
        Result result = new Result();

        result.setCount(pageInfo.getTotal());
        result.setData(pageInfo.getList());
        result.setCode(0);
        result.setMsg("查询成功！");

        return result;
    }

    public static Result success(String msg){
        Result result = new Result();
        result.setCode(0);
        result.setMsg(msg);
        return result;
    }

    public static Result failed(String msg){
        Result result = new Result();
        result.setCode(3001);//默认指定
        result.setMsg(msg);

        return result;
    }
    public static Result failed(String msg,Integer code){
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);

        return result;
    }


}
