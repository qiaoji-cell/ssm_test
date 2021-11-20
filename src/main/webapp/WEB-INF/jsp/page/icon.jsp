<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +
request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>图标列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="../css/public.css" media="all">
    <style>
        h4{ font-size:18px;font-family:"Microsoft YaHei","Simsun",Arial; font-weight:normal; line-height:1; padding:0; margin:0;}
        .icons li{  margin:5px 0; text-align:center; height:120px; cursor:pointer;}
        .icons li i{ display:block; font-size:35px; margin:10px 0; line-height:60px; height:60px;}
        .icons li:hover{ background:#2f4056; border-radius:5px; color:#fff;}
        .icons li:hover i{ font-size:50px;}
        .section{ padding:20px;}
        .section h4 span{ color:#0084e9;}
        .fa {font-size: 25px !important;}
        .fa:hover {font-size: 50px !important;}
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <div class="section">
            <h4><span>全部图标</span></h4>
            <hr>
            <ul class="icons layui-row">
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-adjust"></i><span>fa-adjust</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-anchor"></i><span>fa-anchor</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-archive"></i><span>fa-archive</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-area-chart"></i><span>fa-area-chart</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrows"></i><span>fa-arrows</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrows-h"></i><span>fa-arrows-h</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrows-v"></i><span>fa-arrows-v</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-asterisk"></i><span>fa-asterisk</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-at"></i><span>fa-at</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-automobile"></i><span>fa-automobile</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-ban"></i><span>fa-ban</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bank"></i><span>fa-bank</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bar-chart"></i><span>fa-bar-chart</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bar-chart-o"></i><span>fa-bar-chart-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-barcode"></i><span>fa-barcode</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bars"></i><span>fa-bars</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bed"></i><span>fa-bed</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-beer"></i><span>fa-beer</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bell"></i><span>fa-bell</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bell-o"></i><span>fa-bell-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bell-slash"></i><span>fa-bell-slash</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bell-slash-o"></i><span>fa-bell-slash-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bicycle"></i><span>fa-bicycle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-binoculars"></i><span>fa-binoculars</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-birthday-cake"></i><span>fa-birthday-cake</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bolt"></i><span>fa-bolt</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bomb"></i><span>fa-bomb</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-book"></i><span>fa-book</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bookmark"></i><span>fa-bookmark</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bookmark-o"></i><span>fa-bookmark-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-briefcase"></i><span>fa-briefcase</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bug"></i><span>fa-bug</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-building"></i><span>fa-building</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-building-o"></i><span>fa-building-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bullhorn"></i><span>fa-bullhorn</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bullseye"></i><span>fa-bullseye</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bus"></i><span>fa-bus</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cab"></i><span>fa-cab</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-calculator"></i><span>fa-calculator</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-calendar"></i><span>fa-calendar</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-calendar-o"></i><span>fa-calendar-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-camera"></i><span>fa-camera</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-camera-retro"></i><span>fa-camera-retro</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-car"></i><span>fa-car</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-caret-square-o-down"></i><span>fa-caret-square-o-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-caret-square-o-left"></i><span>fa-caret-square-o-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-caret-square-o-right"></i><span>fa-caret-square-o-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-caret-square-o-up"></i><span>fa-caret-square-o-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cart-arrow-down"></i><span>fa-cart-arrow-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cart-plus"></i><span>fa-cart-plus</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cc"></i><span>fa-cc</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-certificate"></i><span>fa-certificate</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-check"></i><span>fa-check</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-check-circle"></i><span>fa-check-circle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-check-circle-o"></i><span>fa-check-circle-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-check-square"></i><span>fa-check-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-check-square-o"></i><span>fa-check-square-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-child"></i><span>fa-child</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-circle"></i><span>fa-circle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-circle-o"></i><span>fa-circle-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-circle-o-notch"></i><span>fa-circle-o-notch</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-circle-thin"></i><span>fa-circle-thin</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-clock-o"></i><span>fa-clock-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-close"></i><span>fa-close</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cloud"></i><span>fa-cloud</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cloud-download"></i><span>fa-cloud-download</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cloud-upload"></i><span>fa-cloud-upload</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-code"></i><span>fa-code</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-code-fork"></i><span>fa-code-fork</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-coffee"></i><span>fa-coffee</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cog"></i><span>fa-cog</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cogs"></i><span>fa-cogs</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-comment"></i><span>fa-comment</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-comment-o"></i><span>fa-comment-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-comments"></i><span>fa-comments</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-comments-o"></i><span>fa-comments-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-compass"></i><span>fa-compass</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-copyright"></i><span>fa-copyright</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-credit-card"></i><span>fa-credit-card</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-crop"></i><span>fa-crop</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-crosshairs"></i><span>fa-crosshairs</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cube"></i><span>fa-cube</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cubes"></i><span>fa-cubes</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cutlery"></i><span>fa-cutlery</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-dashboard"></i><span>fa-dashboard</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-database"></i><span>fa-database</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-desktop"></i><span>fa-desktop</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-diamond"></i><span>fa-diamond</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-dot-circle-o"></i><span>fa-dot-circle-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-download"></i><span>fa-download</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-edit"></i><span>fa-edit</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-ellipsis-h"></i><span>fa-ellipsis-h</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-ellipsis-v"></i><span>fa-ellipsis-v</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-envelope"></i><span>fa-envelope</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-envelope-o"></i><span>fa-envelope-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-envelope-square"></i><span>fa-envelope-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-eraser"></i><span>fa-eraser</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-exchange"></i><span>fa-exchange</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-exclamation"></i><span>fa-exclamation</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-exclamation-circle"></i><span>fa-exclamation-circle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-exclamation-triangle"></i><span>fa-exclamation-triangle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-external-link"></i><span>fa-external-link</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-external-link-square"></i><span>fa-external-link-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-eye"></i><span>fa-eye</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-eye-slash"></i><span>fa-eye-slash</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-eyedropper"></i><span>fa-eyedropper</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-fax"></i><span>fa-fax</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-female"></i><span>fa-female</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-fighter-jet"></i><span>fa-fighter-jet</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-archive-o"></i><span>fa-file-archive-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-audio-o"></i><span>fa-file-audio-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-code-o"></i><span>fa-file-code-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-excel-o"></i><span>fa-file-excel-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-image-o"></i><span>fa-file-image-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-movie-o"></i><span>fa-file-movie-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-pdf-o"></i><span>fa-file-pdf-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-photo-o"></i><span>fa-file-photo-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-picture-o"></i><span>fa-file-picture-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-powerpoint-o"></i><span>fa-file-powerpoint-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-sound-o"></i><span>fa-file-sound-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-video-o"></i><span>fa-file-video-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-word-o"></i><span>fa-file-word-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-zip-o"></i><span>fa-file-zip-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-film"></i><span>fa-film</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-filter"></i><span>fa-filter</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-fire"></i><span>fa-fire</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-fire-extinguisher"></i><span>fa-fire-extinguisher</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-flag"></i><span>fa-flag</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-flag-checkered"></i><span>fa-flag-checkered</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-flag-o"></i><span>fa-flag-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-flash"></i><span>fa-flash</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-flask"></i><span>fa-flask</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-folder"></i><span>fa-folder</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-folder-o"></i><span>fa-folder-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-folder-open"></i><span>fa-folder-open</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-folder-open-o"></i><span>fa-folder-open-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-frown-o"></i><span>fa-frown-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-futbol-o"></i><span>fa-futbol-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-gamepad"></i><span>fa-gamepad</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-gavel"></i><span>fa-gavel</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-gear"></i><span>fa-gear</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-gears"></i><span>fa-gears</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-genderless"></i><span>fa-genderless</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-gift"></i><span>fa-gift</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-glass"></i><span>fa-glass</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-globe"></i><span>fa-globe</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-graduation-cap"></i><span>fa-graduation-cap</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-group"></i><span>fa-group</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-hdd-o"></i><span>fa-hdd-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-headphones"></i><span>fa-headphones</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-heart"></i><span>fa-heart</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-heart-o"></i><span>fa-heart-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-heartbeat"></i><span>fa-heartbeat</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-history"></i><span>fa-history</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-home"></i><span>fa-home</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-hotel"></i><span>fa-hotel</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-image"></i><span>fa-image</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-inbox"></i><span>fa-inbox</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-info"></i><span>fa-info</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-info-circle"></i><span>fa-info-circle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-institution"></i><span>fa-institution</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-key"></i><span>fa-key</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-keyboard-o"></i><span>fa-keyboard-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-language"></i><span>fa-language</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-laptop"></i><span>fa-laptop</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-leaf"></i><span>fa-leaf</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-legal"></i><span>fa-legal</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-lemon-o"></i><span>fa-lemon-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-level-down"></i><span>fa-level-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-level-up"></i><span>fa-level-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-life-bouy"></i><span>fa-life-bouy</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-life-buoy"></i><span>fa-life-buoy</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-life-ring"></i><span>fa-life-ring</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-life-saver"></i><span>fa-life-saver</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-lightbulb-o"></i><span>fa-lightbulb-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-line-chart"></i><span>fa-line-chart</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-location-arrow"></i><span>fa-location-arrow</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-lock"></i><span>fa-lock</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-magic"></i><span>fa-magic</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-magnet"></i><span>fa-magnet</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-mail-forward"></i><span>fa-mail-forward</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-mail-reply"></i><span>fa-mail-reply</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-mail-reply-all"></i><span>fa-mail-reply-all</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-male"></i><span>fa-male</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-map-marker"></i><span>fa-map-marker</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-meh-o"></i><span>fa-meh-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-microphone"></i><span>fa-microphone</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-microphone-slash"></i><span>fa-microphone-slash</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-minus"></i><span>fa-minus</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-minus-circle"></i><span>fa-minus-circle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-minus-square"></i><span>fa-minus-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-minus-square-o"></i><span>fa-minus-square-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-mobile"></i><span>fa-mobile</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-mobile-phone"></i><span>fa-mobile-phone</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-money"></i><span>fa-money</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-moon-o"></i><span>fa-moon-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-mortar-board"></i><span>fa-mortar-board</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-motorcycle"></i><span>fa-motorcycle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-music"></i><span>fa-music</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-navicon"></i><span>fa-navicon</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-newspaper-o"></i><span>fa-newspaper-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-paint-brush"></i><span>fa-paint-brush</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-paper-plane"></i><span>fa-paper-plane</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-paper-plane-o"></i><span>fa-paper-plane-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-paw"></i><span>fa-paw</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-pencil"></i><span>fa-pencil</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-pencil-square"></i><span>fa-pencil-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-pencil-square-o"></i><span>fa-pencil-square-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-phone"></i><span>fa-phone</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-phone-square"></i><span>fa-phone-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-photo"></i><span>fa-photo</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-picture-o"></i><span>fa-picture-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-pie-chart"></i><span>fa-pie-chart</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-plane"></i><span>fa-plane</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-plug"></i><span>fa-plug</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-plus"></i><span>fa-plus</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-plus-circle"></i><span>fa-plus-circle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-plus-square"></i><span>fa-plus-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-plus-square-o"></i><span>fa-plus-square-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-power-off"></i><span>fa-power-off</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-print"></i><span>fa-print</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-puzzle-piece"></i><span>fa-puzzle-piece</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-qrcode"></i><span>fa-qrcode</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-question"></i><span>fa-question</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-question-circle"></i><span>fa-question-circle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-quote-left"></i><span>fa-quote-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-quote-right"></i><span>fa-quote-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-random"></i><span>fa-random</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-recycle"></i><span>fa-recycle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-refresh"></i><span>fa-refresh</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-remove"></i><span>fa-remove</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-reorder"></i><span>fa-reorder</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-reply"></i><span>fa-reply</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-reply-all"></i><span>fa-reply-all</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-retweet"></i><span>fa-retweet</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-road"></i><span>fa-road</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-rocket"></i><span>fa-rocket</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-rss"></i><span>fa-rss</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-rss-square"></i><span>fa-rss-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-search"></i><span>fa-search</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-search-minus"></i><span>fa-search-minus</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-search-plus"></i><span>fa-search-plus</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-send"></i><span>fa-send</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-send-o"></i><span>fa-send-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-server"></i><span>fa-server</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-share"></i><span>fa-share</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-share-alt"></i><span>fa-share-alt</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-share-alt-square"></i><span>fa-share-alt-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-share-square"></i><span>fa-share-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-share-square-o"></i><span>fa-share-square-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-shield"></i><span>fa-shield</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-ship"></i><span>fa-ship</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-shopping-cart"></i><span>fa-shopping-cart</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sign-in"></i><span>fa-sign-in</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sign-out"></i><span>fa-sign-out</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-signal"></i><span>fa-signal</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sitemap"></i><span>fa-sitemap</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sliders"></i><span>fa-sliders</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-smile-o"></i><span>fa-smile-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-soccer-ball-o"></i><span>fa-soccer-ball-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sort"></i><span>fa-sort</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sort-alpha-asc"></i><span>fa-sort-alpha-asc</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sort-alpha-desc"></i><span>fa-sort-alpha-desc</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sort-amount-asc"></i><span>fa-sort-amount-asc</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sort-amount-desc"></i><span>fa-sort-amount-desc</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sort-asc"></i><span>fa-sort-asc</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sort-desc"></i><span>fa-sort-desc</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sort-down"></i><span>fa-sort-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sort-numeric-asc"></i><span>fa-sort-numeric-asc</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sort-numeric-desc"></i><span>fa-sort-numeric-desc</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sort-up"></i><span>fa-sort-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-space-shuttle"></i><span>fa-space-shuttle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-spinner"></i><span>fa-spinner</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-spoon"></i><span>fa-spoon</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-square"></i><span>fa-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-square-o"></i><span>fa-square-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-star"></i><span>fa-star</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-star-half"></i><span>fa-star-half</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-star-half-empty"></i><span>fa-star-half-empty</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-star-half-full"></i><span>fa-star-half-full</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-star-half-o"></i><span>fa-star-half-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-star-o"></i><span>fa-star-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-street-view"></i><span>fa-street-view</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-suitcase"></i><span>fa-suitcase</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sun-o"></i><span>fa-sun-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-support"></i><span>fa-support</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-tablet"></i><span>fa-tablet</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-tachometer"></i><span>fa-tachometer</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-tag"></i><span>fa-tag</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-tags"></i><span>fa-tags</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-tasks"></i><span>fa-tasks</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-taxi"></i><span>fa-taxi</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-terminal"></i><span>fa-terminal</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-thumb-tack"></i><span>fa-thumb-tack</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-thumbs-down"></i><span>fa-thumbs-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-thumbs-o-down"></i><span>fa-thumbs-o-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-thumbs-o-up"></i><span>fa-thumbs-o-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-thumbs-up"></i><span>fa-thumbs-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-ticket"></i><span>fa-ticket</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-times"></i><span>fa-times</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-times-circle"></i><span>fa-times-circle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-times-circle-o"></i><span>fa-times-circle-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-tint"></i><span>fa-tint</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-toggle-down"></i><span>fa-toggle-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-toggle-left"></i><span>fa-toggle-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-toggle-off"></i><span>fa-toggle-off</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-toggle-on"></i><span>fa-toggle-on</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-toggle-right"></i><span>fa-toggle-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-toggle-up"></i><span>fa-toggle-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-trash"></i><span>fa-trash</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-trash-o"></i><span>fa-trash-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-tree"></i><span>fa-tree</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-trophy"></i><span>fa-trophy</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-truck"></i><span>fa-truck</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-tty"></i><span>fa-tty</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-umbrella"></i><span>fa-umbrella</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-university"></i><span>fa-university</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-unlock"></i><span>fa-unlock</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-unlock-alt"></i><span>fa-unlock-alt</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-unsorted"></i><span>fa-unsorted</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-upload"></i><span>fa-upload</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-user"></i><span>fa-user</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-user-plus"></i><span>fa-user-plus</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-user-secret"></i><span>fa-user-secret</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-user-times"></i><span>fa-user-times</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-users"></i><span>fa-users</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-video-camera"></i><span>fa-video-camera</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-volume-down"></i><span>fa-volume-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-volume-off"></i><span>fa-volume-off</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-volume-up"></i><span>fa-volume-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-warning"></i><span>fa-warning</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-wheelchair"></i><span>fa-wheelchair</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-wifi"></i><span>fa-wifi</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-wrench"></i><span>fa-wrench</span></li>
            </ul>
        </div>

        <div class="section" id="transportation">
            <h4><span>运输工具</span></h4>
            <hr>
            <ul class="icons layui-row">
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-ambulance"></i><span>fa-ambulance</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-car"></i><span>fa-car</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bicycle"></i><span>fa-bicycle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bus"></i><span>fa-bus</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-taxi"></i><span>fa-taxi</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-fighter-jet"></i><span>fa-fighter-jet</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-motorcycle"></i><span>fa-motorcycle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-plane"></i><span>fa-plane</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-rocket"></i><span>fa-rocket</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-ship"></i><span>fa-ship</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-space-shuttle"></i><span>fa-space-shuttle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-subway"></i><span>fa-subway</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-train"></i><span>fa-train</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-truck"></i><span>fa-truck</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-wheelchair"></i><span>fa-wheelchair</span></li>
            </ul>
        </div>

        <div class="section" id="gender">
            <h4><span>性别</span></h4>
            <hr>
            <ul class="icons layui-row">
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-circle-thin"></i><span>fa-circle-thin</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-mars"></i><span>fa-mars</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-mars-double"></i><span>fa-mars-double</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-mars-stroke"></i><span>fa-mars-stroke</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-mars-stroke-h"></i><span>fa-mars-stroke-h</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-mars-stroke-v"></i><span>fa-mars-stroke-v</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-mercury"></i><span>fa-mercury</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-neuter"></i><span>fa-neuter</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-transgender"></i><span>fa-transgender</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-transgender-alt"></i><span>fa-transgender-alt</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-venus"></i><span>fa-venus</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-venus-double"></i><span>fa-venus-double</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-venus-mars"></i><span>fa-venus-mars</span></li>
            </ul>
        </div>

        <div class="section" id="file">
            <h4><span>文件类型</span></h4>
            <hr>
            <ul class="icons layui-row">
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file"></i><span>fa-file</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-archive-o"></i><span>fa-file-archive-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-audio-o"></i><span>fa-file-audio-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-code-o"></i><span>fa-file-code-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-excel-o"></i><span>fa-file-excel-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-image-o"></i><span>fa-file-image-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-video-o"></i><span>fa-file-video-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-o"></i><span>fa-file-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-pdf-o"></i><span>fa-file-pdf-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-powerpoint-o"></i><span>fa-file-powerpoint-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-text"></i><span>fa-file-text</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-text-o"></i><span>fa-file-text-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-word-o"></i><span>fa-file-word-o</span></li>
            </ul>
        </div>

        <div class="section" id="spinner">
            <h4><span>旋转加载</span></h4>
            <hr>
            <ul class="icons layui-row">
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cog"></i><span>fa-cog</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-circle-o-notch"></i><span>fa-circle-o-notch</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-refresh"></i><span>fa-refresh</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-spinner"></i><span>fa-spinner</span></li>
            </ul>
        </div>

        <div class="section" id="form">
            <h4><span>表单控件</span></h4>
            <hr>
            <ul class="icons layui-row">
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-check-square"></i><span>fa-check-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-check-square-o"></i><span>fa-check-square-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-circle"></i><span>fa-circle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-circle-o"></i><span>fa-circle-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-dot-circle-o"></i><span>fa-dot-circle-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-minus-square"></i><span>fa-minus-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-minus-square-o"></i><span>fa-minus-square-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-plus-square"></i><span>fa-plus-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-plus-square-o"></i><span>fa-plus-square-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-square"></i><span>fa-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-square-o"></i><span>fa-square-o</span></li>
            </ul>
        </div>

        <div class="section" id="payment">
            <h4><span>支付方式</span></h4>
            <hr>
            <ul class="icons layui-row">
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cc-amex"></i><span>fa-cc-amex</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cc-discover"></i><span>fa-cc-discover</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cc-mastercard"></i><span>fa-cc-mastercard</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cc-paypal"></i><span>fa-cc-paypal</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cc-stripe"></i><span>fa-cc-stripe</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cc-visa"></i><span>fa-cc-visa</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-credit-card"></i><span>fa-credit-card</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-google-wallet"></i><span>fa-google-wallet</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-paypal"></i><span>fa-paypal</span></li>
            </ul>
        </div>

        <div class="section" id="chart">
            <h4><span>统计</span></h4>
            <hr>
            <ul class="icons layui-row">
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-area-chart"></i><span>fa-area-chart</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bar-chart"></i><span>fa-bar-chart</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-line-chart"></i><span>fa-line-chart</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-pie-chart"></i><span>fa-pie-chart</span></li>
            </ul>
        </div>

        <div class="section" id="currency">
            <h4><span>货币</span></h4>
            <hr>
            <ul class="icons layui-row">
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-btc"></i><span>fa-btc</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-jpy"></i><span>fa-jpy</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-usd"></i><span>fa-usd</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-eur"></i><span>fa-eur</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-gbp"></i><span>fa-gbp</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-ils"></i><span>fa-ils</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-inr"></i><span>fa-inr</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-krw"></i><span>fa-krw</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-money"></i><span>fa-money</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-rub"></i><span>fa-rub</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-try"></i><span>fa-try</span></li>
            </ul>
        </div>

        <div class="section" id="text">
            <h4><span>文本编辑</span></h4>
            <hr>
            <ul class="icons layui-row">
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-align-center"></i><span>fa-align-center</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-align-justify"></i><span>fa-align-justify</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-align-left"></i><span>fa-align-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-align-right"></i><span>fa-align-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bold"></i><span>fa-bold</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-font"></i><span>fa-font</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-italic"></i><span>fa-italic</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-header"></i><span>fa-header</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-underline"></i><span>fa-underline</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-text-width"></i><span>fa-text-width</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-text-height"></i><span>fa-text-height</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-strikethrough"></i><span>fa-strikethrough</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-subscript"></i><span>fa-subscript</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-superscript"></i><span>fa-superscript</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-link"></i><span>fa-link</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-chain-broken"></i><span>fa-chain-broken</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-clipboard"></i><span>fa-clipboard</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-files-o"></i><span>fa-files-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-scissors"></i><span>fa-scissors</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-columns"></i><span>fa-columns</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-eraser"></i><span>fa-eraser</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file"></i><span>fa-file</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-o"></i><span>fa-file-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-text"></i><span>fa-file-text</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-file-text-o"></i><span>fa-file-text-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-floppy-o"></i><span>fa-floppy-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-repeat"></i><span>fa-repeat</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-undo"></i><span>fa-undo</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-outdent"></i><span>fa-outdent</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-indent"></i><span>fa-indent</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-list"></i><span>fa-list</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-list-alt"></i><span>fa-list-alt</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-list-ol"></i><span>fa-list-ol</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-list-ul"></i><span>fa-list-ul</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-paperclip"></i><span>fa-paperclip</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-paragraph"></i><span>fa-paragraph</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-table"></i><span>fa-table</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-th"></i><span>fa-th</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-th-large"></i><span>fa-th-large</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-th-list"></i><span>fa-th-list</span></li>
            </ul>
        </div>

        <div class="section" id="directional">
            <h4><span>方向性</span></h4>
            <hr>
            <ul class="icons layui-row">
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-angle-double-down"></i><span>fa-angle-double-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-angle-double-left"></i><span>fa-angle-double-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-angle-double-right"></i><span>fa-angle-double-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-angle-double-up"></i><span>fa-angle-double-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-angle-down"></i><span>fa-angle-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-angle-left"></i><span>fa-angle-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-angle-right"></i><span>fa-angle-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-angle-up"></i><span>fa-angle-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrow-circle-down"></i><span>fa-arrow-circle-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrow-circle-left"></i><span>fa-arrow-circle-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrow-circle-right"></i><span>fa-arrow-circle-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrow-circle-up"></i><span>fa-arrow-circle-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrow-circle-o-down"></i><span>fa-arrow-circle-o-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrow-circle-o-left"></i><span>fa-arrow-circle-o-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrow-circle-o-right"></i><span>fa-arrow-circle-o-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrow-circle-o-up"></i><span>fa-arrow-circle-o-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrow-down"></i><span>fa-arrow-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrow-left"></i><span>fa-arrow-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrow-right"></i><span>fa-arrow-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrow-up"></i><span>fa-arrow-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrows"></i><span>fa-arrows</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrows-alt"></i><span>fa-arrows-alt</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrows-h"></i><span>fa-arrows-h</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrows-v"></i><span>fa-arrows-v</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-caret-down"></i><span>fa-caret-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-caret-left"></i><span>fa-caret-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-caret-right"></i><span>fa-caret-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-caret-up"></i><span>fa-caret-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-caret-square-o-down"></i><span>fa-caret-square-o-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-caret-square-o-left"></i><span>fa-caret-square-o-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-caret-square-o-right"></i><span>fa-caret-square-o-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-caret-square-o-up"></i><span>fa-caret-square-o-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-chevron-circle-down"></i><span>fa-chevron-circle-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-chevron-circle-left"></i><span>fa-chevron-circle-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-chevron-circle-right"></i><span>fa-chevron-circle-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-chevron-circle-up"></i><span>fa-chevron-circle-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-chevron-down"></i><span>fa-chevron-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-chevron-left"></i><span>fa-chevron-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-chevron-right"></i><span>fa-chevron-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-chevron-up"></i><span>fa-chevron-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-hand-o-down"></i><span>fa-hand-o-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-hand-o-left"></i><span>fa-hand-o-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-hand-o-right"></i><span>fa-hand-o-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-hand-o-up"></i><span>fa-hand-o-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-long-arrow-down"></i><span>fa-long-arrow-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-long-arrow-left"></i><span>fa-long-arrow-left</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-long-arrow-right"></i><span>fa-long-arrow-right</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-long-arrow-up"></i><span>fa-long-arrow-up</span></li>
            </ul>
        </div>

        <div class="section" id="video">
            <h4><span>播放器控件</span></h4>
            <hr>
            <ul class="icons layui-row">
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-arrows-alt"></i><span>fa-arrows-alt</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-backward"></i><span>fa-backward</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-compress"></i><span>fa-compress</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-eject"></i><span>fa-eject</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-expand"></i><span>fa-expand</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-fast-backward"></i><span>fa-fast-backward</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-fast-forward"></i><span>fa-fast-forward</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-forward"></i><span>fa-forward</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-pause"></i><span>fa-pause</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-play"></i><span>fa-play</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-play-circle"></i><span>fa-play-circle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-play-circle-o"></i><span>fa-play-circle-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-step-backward"></i><span>fa-step-backward</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-step-forward"></i><span>fa-step-forward</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-stop"></i><span>fa-stop</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-youtube-play"></i><span>fa-youtube-play</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-volume-off"></i><span>fa-volume-off</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-volume-down"></i><span>fa-volume-down</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-volume-up"></i><span>fa-volume-up</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-random"></i><span>fa-random</span></li>
            </ul>
        </div>

        <div class="section" id="medical">
            <h4><span>医疗</span></h4>
            <hr>
            <ul class="icons layui-row">
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-ambulance"></i><span>fa-ambulance</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-h-square"></i><span>fa-h-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-heart"></i><span>fa-heart</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-heart-o"></i><span>fa-heart-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-heartbeat"></i><span>fa-heartbeat</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-hospital-o"></i><span>fa-hospital-o</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-medkit"></i><span>fa-medkit</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-plus-square"></i><span>fa-plus-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-stethoscope"></i><span>fa-stethoscope</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-user-md"></i><span>fa-user-md</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-wheelchair"></i><span>fa-wheelchair</span></li>
            </ul>
        </div>

        <div class="section" id="brand">
            <h4><span>品牌</span></h4>
            <hr>
            <ul class="icons layui-row">
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-adn"></i><span>fa-adn</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-android"></i><span>fa-android</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-angellist"></i><span>fa-angellist</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-apple"></i><span>fa-apple</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-behance"></i><span>fa-behance</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-behance-square"></i><span>fa-behance-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bitbucket"></i><span>fa-bitbucket</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-bitbucket-square"></i><span>fa-bitbucket-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-btc"></i><span>fa-btc</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-buysellads"></i><span>fa-buysellads</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cc-amex"></i><span>fa-cc-amex</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cc-discover"></i><span>fa-cc-discover</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cc-mastercard"></i><span>fa-cc-mastercard</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cc-paypal"></i><span>fa-cc-paypal</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cc-stripe"></i><span>fa-cc-stripe</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-cc-visa"></i><span>fa-cc-visa</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-codepen"></i><span>fa-codepen</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-connectdevelop"></i><span>fa-connectdevelop</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-css3"></i><span>fa-css3</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-dashcube"></i><span>fa-dashcube</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-delicious"></i><span>fa-delicious</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-deviantart"></i><span>fa-deviantart</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-digg"></i><span>fa-digg</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-dribbble"></i><span>fa-dribbble</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-dropbox"></i><span>fa-dropbox</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-drupal"></i><span>fa-drupal</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-empire"></i><span>fa-empire</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-facebook"></i><span>fa-facebook</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-facebook-official"></i><span>fa-facebook-official</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-facebook-square"></i><span>fa-facebook-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-flickr"></i><span>fa-flickr</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-forumbee"></i><span>fa-forumbee</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-foursquare"></i><span>fa-foursquare</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-git"></i><span>fa-git</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-git-square"></i><span>fa-git-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-github"></i><span>fa-github</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-github-alt"></i><span>fa-github-alt</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-github-square"></i><span>fa-github-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-gratipay"></i><span>fa-gratipay</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-google"></i><span>fa-google</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-google-plus"></i><span>fa-google-plus</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-google-plus-square"></i><span>fa-google-plus-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-google-wallet"></i><span>fa-google-wallet</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-hacker-news"></i><span>fa-hacker-news</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-html5"></i><span>fa-html5</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-instagram"></i><span>fa-instagram</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-ioxhost"></i><span>fa-ioxhost</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-joomla"></i><span>fa-joomla</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-jsfiddle"></i><span>fa-jsfiddle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-lastfm"></i><span>fa-lastfm</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-lastfm-square"></i><span>fa-lastfm-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-leanpub"></i><span>fa-leanpub</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-linkedin"></i><span>fa-linkedin</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-linkedin-square"></i><span>fa-linkedin-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-linux"></i><span>fa-linux</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-maxcdn"></i><span>fa-maxcdn</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-meanpath"></i><span>fa-meanpath</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-medium"></i><span>fa-medium</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-openid"></i><span>fa-openid</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-pagelines"></i><span>fa-pagelines</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-paypal"></i><span>fa-paypal</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-pied-piper"></i><span>fa-pied-piper</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-pied-piper-alt"></i><span>fa-pied-piper-alt</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-pinterest"></i><span>fa-pinterest</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-pinterest-p"></i><span>fa-pinterest-p</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-pinterest-square"></i><span>fa-pinterest-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-qq"></i><span>fa-qq</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-rebel"></i><span>fa-rebel</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-reddit"></i><span>fa-reddit</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-reddit-square"></i><span>fa-reddit-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-renren"></i><span>fa-renren</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-sellsy"></i><span>fa-sellsy</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-share-alt"></i><span>fa-share-alt</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-share-alt-square"></i><span>fa-share-alt-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-shirtsinbulk"></i><span>fa-shirtsinbulk</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-simplybuilt"></i><span>fa-simplybuilt</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-skyatlas"></i><span>fa-skyatlas</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-skype"></i><span>fa-skype</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-slack"></i><span>fa-slack</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-slideshare"></i><span>fa-slideshare</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-soundcloud"></i><span>fa-soundcloud</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-spotify"></i><span>fa-spotify</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-stack-exchange"></i><span>fa-stack-exchange</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-stack-overflow"></i><span>fa-stack-overflow</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-steam"></i><span>fa-steam</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-steam-square"></i><span>fa-steam-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-stumbleupon"></i><span>fa-stumbleupon</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-stumbleupon-circle"></i><span>fa-stumbleupon-circle</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-tencent-weibo"></i><span>fa-tencent-weibo</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-trello"></i><span>fa-trello</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-tumblr"></i><span>fa-tumblr</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-tumblr-square"></i><span>fa-tumblr-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-twitch"></i><span>fa-twitch</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-twitter"></i><span>fa-twitter</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-twitter-square"></i><span>fa-twitter-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-viacoin"></i><span>fa-viacoin</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-vimeo-square"></i><span>fa-vimeo-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-vine"></i><span>fa-vine</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-vk"></i><span>fa-vk</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-weixin"></i><span>fa-weixin</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-weibo"></i><span>fa-weibo</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-whatsapp"></i><span>fa-whatsapp</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-windows"></i><span>fa-windows</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-wordpress"></i><span>fa-wordpress</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-xing"></i><span>fa-xing</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-xing-square"></i><span>fa-xing-square</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-yahoo"></i><span>fa-yahoo</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-yelp"></i><span>fa-yelp</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-youtube"></i><span>fa-youtube</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-youtube-play"></i><span>fa-youtube-play</span></li>
                <li class='layui-col-xs4 layui-col-sm3 layui-col-md2 layui-col-lg1 '><i class="fa fa-youtube-square"></i><span>fa-youtube-square</span></li>
            </ul>
        </div>
    </div>
</div>
<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
</body>
</html>
