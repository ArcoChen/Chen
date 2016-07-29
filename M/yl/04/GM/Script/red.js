var integral;
var coin;
var totalIntegral;
$(function () {
    //var openid = "o9tD6wmIvgIe6rRy8IUo-545ddM4";
    var nickName = GetQuery("nickName");
    totalIntegral = GetQuery("totalIntegral");
    $("#nickName").text(nickName);
    $("#totalIntegral").text(totalIntegral);
    var openid = GetQuery("openid");
    $(".bignav li a").each(function (i) {
        $(this).click(function () {
            switch (i) {
                case 0:
                    integral = 100;
                    coin = 1;
                    break;
                case 1:
                    integral = 190;
                    coin = 2;
                    break;
                case 2:
                    integral = 460;
                    coin = 5;
                    break;
                case 3:
                    integral = 900;
                    coin = 10;
                    break;
            }
            checkUserIntergral(openid, integral);
        });
    });
    $(".redbutton").click(function () {
        duductUserIntegral(openid, integral, coin);
    });
    $("#footer").click(function () {
        location.href = "../WeChat/ExchangeDetails.html?openid=" + openid;
    });
});

//显示灰色 jQuery 遮罩层 
function showBg() {
    var bh = $("#container").height();
    var bw = $("#container").width();
    $("#fullbg").css({
        height: bh,
        width: bw,
        display: "block"
    });
    $("#dialog").show();
    $(".redbutton").show();
}
//关闭灰色 jQuery 遮罩 
function closeBg() {
    $("#fullbg,#dialog").hide();
}

//检查用户是否足够积分
function checkUserIntergral(openid, duduct) {
    getAjax("/ProductListHandle.ashx", { "openid": openid, "duduct": duduct, "status": "0" }, function (data) {
        if (data == "-1") {
            //用户不存在
            $("#dialog").css("background", 'url(../Images/nouser.png) no-repeat');
            $("#dialog").css("background-size", 'contain');
            showBg();
            $(".redbutton").hide();
        } else if (data == "0") {
            //不够积分
            $("#dialog").css("background", 'url(../Images/NO.png) no-repeat');
            $("#dialog").css("background-size", 'contain');
            showBg();
            $(".redbutton").hide();
        } else {
            //足够积分
            $("#dialog").css("background", 'url(../Images/' + duduct + 'coin.png) no-repeat');
            $("#dialog").css("background-size", 'contain');
            showBg();
        }
    });
}
//扣减积分
function duductUserIntegral(openid, duduct, rmbcoin) {
    getAjax("/ProductListHandle.ashx", { "openid": openid, "duduct": duduct, "rmbcoin": rmbcoin, "status": "1" }, function (data) {
        if (data == "-2") {
            //红包发送异常
            $("#dialog").css("background", 'url(../Images/sysbad.png) no-repeat');
            $("#dialog").css("background-size", 'contain');
            $(".redbutton").hide();
        } else if (data == "-1") {
            //执行数据异常报错
            $("#dialog").css("background", 'url(../Images/nouser.png) no-repeat');
            $("#dialog").css("background-size", 'contain');
            $(".redbutton").hide();
        } else if (data == "0") {
            //用户不存在
            $("#dialog").css("background", 'url(../Images/nouser.png) no-repeat');
            $("#dialog").css("background-size", 'contain');
            $(".redbutton").hide();
        } else if (data == "1") {
            //用户积分不足
            $("#dialog").css("background", 'url(../Images/NO.png) no-repeat');
            $("#dialog").css("background-size", 'contain');
            $(".redbutton").hide();
        } else {
            totalIntegral = parseInt(totalIntegral) - parseInt(duduct);
            $("#totalIntegral").text(totalIntegral);
            //兑换积分成功
            openRedPackage(rmbcoin);
        }
    });
}
//打开红包
function openRedPackage(rmbcoin) {
    // 在带有red样式的div中添加shake-chunk样式
    $('#dialog').addClass('rotate');
    //// 点击按钮2000毫秒后执行以下操作
    setTimeout(function () {
        // 在带有red样式的div中删除shake-chunk样式
        $('#dialog').removeClass('rotate');
        // 将redbutton按钮隐藏
        $('.redbutton').css("display", "none");
        // 修改red 下背景图
        $("#dialog").css("background", 'url(../Images/' + rmbcoin + 'rmb.png) no-repeat');
        // 修改red-jg的css显示方式为块
        $("#dialog").css("background-size", 'contain');
    }, 2000);
}