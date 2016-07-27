<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScanJar.aspx.cs" Inherits="QRCode.ScanJar" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>越港云端</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="screen-orientation" content="portrait" />
    <meta name="x5-orientation" content="portrait" />
    <meta http-equiv="x-rim-auto-match" content="none" />
    <link href="Styles/main.css" rel="stylesheet" />
    <script type="text/javascript" src="Script/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="Script/imlzt-framework.js"></script>
    <script type="text/javascript" src="Script/jquery.cookie.js"></script>
    <script type="text/javascript" src="Script/comm.js"></script>
</head>
<body>
<div id="container" class="container">
            <!--<div id="top"><a href="#"><img class="center-middle" src="Images/logo.png" style="height:200%"/></a></div>-->
            <div id="main">
                <div class="title"><img src="Images/logo.png" style="width:28%"/></div>
                <div class="info">
                    <img src="Images/databorder.png" alt="" />
                    <div><span class="l">身份编码:</span><span id="outcode"><%= Code %></span></div>
                    <div><span class="l">查询次数:</span><span id="inquirecount"><%= ScanCount %></span></div>
                </div>
                <!--<audio id="deep-one"  preload="auto" >
                    <source src="Upload/music.mp3"/>
                </audio>-->
                <div class="rd"><img src="Images/product.png" /></div>
                <div class="more"><span class="l" style="color:#e2d9d9">支持公益▪扫码惊喜</span>&nbsp;<!--<img src="Images/notice.png" style="width:6%" />--><span style="font-size:1em; color:#ffffff;">点击了解详情</span></div>
            </div>
            <div id="footer">
                <div><a href="#"><img class="center-middle" src="Images/icon1.png" style="height:100%" id="mainwebsite"/></a></div>
                <div><a href="#"><img class="center-middle" src="Images/icon2.png" style="height:100%" id="checkdetail"/></a></div>
           <!--     <div><a href="#"><img class="center-middle" src="Images/icon3.png" style="height:100%" id="publicheck"/></a></div>   -->
                <div><a href="#"><img class="center-middle" src="Images/icon4.png" style="height:100%" id="twobarcode"/></a></div>
            </div>
     </div>
     
    <script type="text/javascript">
        $(function () {
		
				$.cookie('outcode', "<%= Code %>");
            $("#checkdetail").click(function () {
                location.href = "/GM/ScanAntiFakeInfo.html";
            });
            $("#mainwebsite").click(function () {
                location.href = "http://www.51ganten.com/";
            });
            $("#publicheck").click(function () {
                location.href = "/GM/ScanPublicInfo.html";
            });

            $("#twobarcode").click(function () {
                //  location.href = "http://a.eqxiu.com/s/5UR8tVaC";
            });

            var beepOne = $("#deep-one")[0];
            $(".rd>img").mouseenter(function () {
                beepOne.play();
            });
        });

    </script>
</body>
</html>
