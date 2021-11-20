package com.axjy.test;

import com.axjy.pojo.generalCharge.Groove;
import com.axjy.pojo.sys.User;
import com.axjy.service.generalCharge.GrooveService;
import com.axjy.service.impl.sys.UserServiceImpl;
import com.axjy.service.sys.UserService;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Joe on 2021/10/11 上午 7:03
 */
@ExtendWith(SpringExtension.class)
@SpringJUnitConfig(SpringExtension.class)
@ContextConfiguration
public class NormalTest {
    @Resource
    private GrooveService grooveService;
    @org.junit.jupiter.api.Test
    public void test(){
//        List<Groove> allGardenId = grooveService.findAllGardenId();
//        System.out.println(allGardenId);
    }
    public static void main(String[] args) {
        Singleton singleton = Singleton.getInstance();
        System.out.println(singleton);

    }
}
