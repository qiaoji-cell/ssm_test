package com.axjy.task;

import cn.hutool.core.lang.Dict;
import cn.hutool.extra.mail.MailUtil;
import cn.hutool.extra.template.Template;
import cn.hutool.extra.template.TemplateConfig;
import cn.hutool.extra.template.TemplateEngine;
import cn.hutool.extra.template.TemplateUtil;
import com.axjy.utils.Constants;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;


/**
 * Created by Joe on 2021/10/29 下午 16:12
 */
@Component
public class TaskTest {

    int count = 1;
      //发送一次短信测试
//      @Scheduled(initialDelay = 10000,fixedDelay = 10000)
//    public void sendEmail(){
//          if(count <=1){
//              List<String> names = new ArrayList<>();
//              names.add("乔高盘");
//              names.add("常艳辉");
//              names.add("郑志浩");
//              //发送一次短信测试
//              TemplateEngine engine =  TemplateUtil.createEngine(new TemplateConfig("templates",TemplateConfig.ResourceMode.CLASSPATH));
//              Template template = engine.getTemplate("mail.html");
//              String result = template.render(Dict.create().set("list",names).set("name","乔高盘"));
//              MailUtil.send(Constants.Q_Q_EMAIL,"发邮件测试",result,true);
//              MailUtil.send(Constants.Z_W_EMAIL,"发邮件测试",result,true);
//              MailUtil.send(Constants.C_W_EMAIL,"发邮件测试",result,true);
//          }
//          count++;
//      }

//    @Scheduled(initialDelay = 10000,fixedRate = 3000)
//    public void remind(){
//        System.out.println("你需要打代码了");
//    }
}
