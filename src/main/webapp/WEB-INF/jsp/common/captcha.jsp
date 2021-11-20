<%@ page import="java.awt.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.imageio.ImageIO" %><%--
  Created by IntelliJ IDEA.
  User: Joe
  Date: 2021-10-12
  Time: 下午 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="image/jpeg;charset=UTF-8" language="java" %>
<%!
    //产生随机颜色
    public Color getColor(){
        Random ran = new Random();//Math.random() 0-1
        int r = ran.nextInt(256);
        int g = ran.nextInt(256);
        int b = ran.nextInt(256);
        return new Color(r,g,b);//red green blue 0-255
    }

    //产生验证码
    public String getNum(){
        //0-899 1000-9999
        int ran = (int)(Math.random()*9000)+1000;
        return String.valueOf(ran);
    }
%>

<%
    //禁止缓存，防止验证码过期
    response.setHeader("Pragram","no-cache");
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Expires","0");

    //绘制验证码
    BufferedImage image = new BufferedImage(80,30,BufferedImage.TYPE_INT_RGB);
    //画笔
    Graphics graphics = image.getGraphics();
    graphics.fillRect(0,0,80,30);
    graphics.fillRect(0,0,80,30);
    //绘制干扰线条
    for(int i = 0;i < 60;i++){
        Random ran = new Random();
        int xBegin = ran.nextInt(80);//55
        int yBegin = ran.nextInt(30);

        int xEnd = ran.nextInt(xBegin+10);
        int yEnd = ran.nextInt(yBegin+10);

        graphics.setColor(getColor());
        //绘制线条
        graphics.drawLine(xBegin,yBegin,xEnd,yEnd);
    }
    graphics.setFont(new Font("seif",Font.BOLD,20));
    //绘制验证码
    graphics.setColor(Color.black);
    String checkCode = getNum();//2 1 3 4
    StringBuffer sb = new StringBuffer();
    for(int i = 0;i < checkCode.length();i++){
        sb.append(checkCode.split("")[i]+" ");//验证码的每一位数字
    }

    graphics.drawString(sb.toString(),15,20);//绘制验证码

    //将验证码真实值 保存在session中,共使用时比较真实性
    session.setAttribute("captcha",checkCode);

    //真实的产生图标
    ImageIO.write(image,"jpeg",response.getOutputStream());

    //关闭
    out.clear();
    out=pageContext.push();//<>
%>
