<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>后台主页面</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

body {
    font: 12px/1.5 "Microsoft Yahei",tahoma,arial,"Hiragino Sans GB";
    -webkit-font-smoothing: antialiased;
}

#content {
	height: auto;
	width: 1030.55px;
	padding: 100px 0 0 250px;
}

#content iframe {
	height: 696.8px;
	width: 1030.55px;
}
.ad-right{
	height: 736.8px;
	position:relative;
}

#footer {
	height: 30px;
	width: 100%;
	line-height: 2em;
	text-align: center;
	padding: 10px;
	position:absolute;
	bottom:0;
}


/*=========================我是分割线啊啊啊啊=============================*/
a{
    text-decoration: none;
}
.ad-right{
    margin-left: 256px;
}

.ad-left{
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    z-index: 1001;
    width: 256px;
    min-width: 256px;
    max-width: 256px;
    flex: 0 0 256px;
    overflow: hidden;
    background-color: #DF7401;
}
.ltitle{
    height: 72px;
    line-height: 72px;
    padding-left: 20px;
    padding-top: 16px;
}
.limg{
    width: 60px;
    height: 60px;
    border-radius: 100%;
    background: url(images/admin/adlogo.jpg) 0 0 no-repeat;
    float: left;
}
.ltext{
    line-height: 50px;
    padding-left: 5px;
    float: left;
}
.ladmin{
    text-align: center;
    color: #FFFFFF;
    padding-bottom: 14px;
}
.lbody ul{
    width: 256px;
    display: block;
    margin: 0;
    padding: 0;
    outline: none;
    list-style: none;
    color: #515a6e;
    font-size: 14px;
    position: relative;
    z-index: 900;
    text-align: center;
}
.lbody ul li{
    color:black;
    padding: 7px 24px;
    position: relative;
    cursor: pointer;
    
}
.lbody ul a{
    display: block;
    color:black;
}
.lbody ul li ul{
    display: none;
}
.lbody ul li ul a{
    display: block;
    color: black;
}
.lbody ul li ul li:hover{
    background-color: rgb(255, 153, 1);
}
.lexit{
    display: block;
    color: black;
}

</style>
<script>
    function vis(id){
        var arr = ["hidden01","hidden02","hidden03","hidden04"];
        var name = "hidden0"+id;
        var checked = document.getElementById(name);
        console.log(checked);
        checked.style.display = "block";
        for(i = 0; i < arr.length;i++){
            if(arr[i] == name) continue;
            var unchecked = document.getElementById(arr[i]);
            unchecked.style.display = "none";
        }
    }
    
    
</script>
</head>
<body>
    <div class="ad-left">
        <div class="ltitle">
            <div class="limg"></div>
            <div class="ltext">
                <h2 style="color: ghostwhite; margin-left: 10px;">苏宁后台管理系统</h2>
            </div>
        </div>
        <div class="lbody">
            <div class="ladmin"><h3>欢迎您,${auser.aname}</h3></div>
            <div class="lnavigator">
                <ul>
                    <li ><a href="javascript:void(0)" onclick="vis(1)">商品管理</a>
                        <ul id="hidden01">
                            <li><a href="adminGoods/toAddGoods" target="center">添加商品</a></li>
                            <li><a href="adminGoods/selectGoods?act=deleteSelect" target="center">删除商品</a></li>
                            <li><a href="adminGoods/selectGoods?act=updateSelect" target="center">修改商品</a></li>
                            <li><a href="adminGoods/selectGoods" target="center">查询商品</a></li>
                        </ul>
                    </li>
                    <li ><a href="javascript:void(0)" onclick="vis(2)">类型管理</a>
                        <ul id="hidden02">
                            <li><a href="adminType/toAddType" target="center">添加类型</a></li>
                            <li><a href="adminType/toDeleteType" target="center">删除类型</a></li>
                        </ul>
                    </li>
                    <li ><a href="javascript:void(0)" onclick="vis(3)">用户管理</a>
                        <ul id="hidden03">
                            <li><a href="adminUser/userInfo" target="center">删除用户</a></li>
                        </ul>
                    </li>
                    <li ><a href="javascript:void(0)" onclick="vis(4)">订单管理</a>
                        <ul id="hidden04">
                            <li><a href="adminOrder/orderInfo" target="center">删除订单</a></li>
                        </ul>
                    </li>
                    <li><a class="lexit" href="exit">安全退出</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="ad-right">
        <div id="content">
            <!-- 将其他页面嵌入此页面中 -->
            <iframe src="adminGoods/selectGoods"  name="center" frameborder="0"></iframe>
        </div>
        <div id="footer">Copyright© 2002-2020，苏宁易购集团股份有限公司版权所有</div>
    </div>
	
</body>
</html>


