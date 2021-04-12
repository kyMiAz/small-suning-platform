<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>用户中心</title>
<link href="css/before/daohang_kz.css" rel="stylesheet" type="text/css" />
<link href="css/before/common_kz.css" rel="stylesheet" type="text/css" />
<link href="css/before/style_kz.css" rel="stylesheet" type="text/css" />
</head>
<style>
	a{
		text-decoration: none;
	}
	.last{
		/*
		position: fixed;
		bottom: 0;
		padding:30px 0 0 0;
		*/
	}
	.header{
		float:left;
		width:100%;
		height:60px;
		background-color:#FF7700;
	}
	.logo{
		margin-left:160px;
		float:left;
	}
	.top-list{
		position: relative;
	    float: left;
	    /*padding: 12px 0 0 30px;*/
    	list-style-type: none;
	}
	.top-list li{
		padding:0 15px;
		float: left;
	}
	.top-list li a{
		font-size: 14px;
	    color: #333;
	    font-family: "Microsoft YaHei";
    	font-weight: 700;
	}
	.top-list li a:hover{
		color: #F70;
	}
	i{
		display:inline-block;
		position: relative;
	    right: 0;
	    top: 0;
	}
	
	.my-pwd{
		width: 14px;
	    height: 13px;
	    background: url(images/before/icons3.png) no-repeat 0 0;
		background-position: 1px -58px; 
	}
	.my-car{
		width: 14px;
	    height: 13px;
	    background: url(images/before/icons3.png) no-repeat 0 0;
	}
	.my-order{
		width: 14px;
	    height: 13px;
	    background: url(images/before/icons3.png) no-repeat 0 0;
		background-position: 1px -15px; 
	}
	.my-foc{
		width: 14px;
	    height: 13px;
	    background: url(images/before/icons3.png) no-repeat 0 0;
		background-position: 1px -43px; 
	}
	iframe{
		width: 1226px;
	    height: 500px;
	}
	
</style>
<body>
	<div class="all_zong">
		<!--最上面 灰色条部分-->
		<div class="all_zong_top">
			<div class="all_zong_top_right a8c">
				<table border="0" cellspacing="0" cellpadding="0" class="main_login">
					<tr>
						<td>
							<p id="content">
								<c:if test="${bruser!=null}">欢迎 ${bruser.bemail }</c:if>
								<c:if test="${bruser==null}"><a href="toLogin">登录</a></c:if>
							</p>
						</td>
						<td>
							<p>
								<c:if test="${bruser==null}"><a href="toRegister">注册</a></c:if>	
							</p>
							<span class="xx">|</span>
						</td>
						<!-- 没有登录 -->
						<c:if test="${bruser!= null}">	
						<td><a href="user/exit">退出</a><span
							class="xx">|</span></td>
						</c:if>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="header">
		<div class="logo">
				<a href="before"><img src="images/before/logo.png" width="190px" height="60px" /></a>
		</div>
	</div>
	<div class="blank"></div>
	<div class="block clearfix">
		<div class ="center-top">
			<ul class="top-list">
				<li><i class="my-pwd"></i> <a href="toEdit" target="switch-box">修改密码</a></li>
				<li><i class="my-car"></i> <a href="cart/selectCart">我的购物车</a></li>
				<li><i class="my-order"></i> <a href="myOrder" target="switch-box">我的订单</a></li>
				<li><i class="my-foc"></i> <a href="myFocus" target="switch-box">我的关注</a></li>
			</ul>
		</div>
		<div class="blank20"></div>
		
		<div id="switch">
			<!-- 将其他页面嵌入此页面中 -->
			<iframe src="myOrder"  name="switch-box" frameborder="0"></iframe>
		</div>
		<div class="blank20"></div>
		<!-- 示例代码 -->
		<!--  
		<div class="location ared">
			我的订单
		</div>
		<div class="blank"></div>
		<div>
			<div class="nFlowBox">
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th>订单编号</th>
						<th>订单金额</th>
						<th>订单日期</th>
						<th>订单状态</th>
						<th>详情</th>
					</tr>
					<tr>
						<td colspan="5" height="15px"
							style="border: 0 none; background: #FFF"></td>
					</tr> 
					<c:forEach var="mo" items="${myOrder}"> 
						<tr>
							<td bgcolor="#ffffff" align="center">${mo.id}</td>
							<td bgcolor="#ffffff"  align="center">${mo.amount}</td>
							<td align="center" bgcolor="#ffffff">${mo.orderdate}</td>
							<td bgcolor="#ffffff"  align="center">
							<c:if test="${mo.status == 0}" >
							未付款&nbsp;&nbsp;
							<a style="text-decoration: none;" class="f6" href="order/pay?ordersn=${mo.id}">去支付</a>
							</c:if>
							<c:if test="${mo.status == 1}" >已付款</c:if>
							</td>
							<td align="center" bgcolor="#ffffff">
							<a style="text-decoration: none;" class="f6" href="orderDetail?ordersn=${mo.id}" target="_blank">详情</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="location ared">
			我的关注
		</div>
		<div class="blank"></div>
		<div>
			<div class="nFlowBox">
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th>商品编号</th>
						<th>商品名称</th>
						<th>商品图片</th>
						<th>商品价格</th>
						<th>去看看</th>
					</tr>
					<tr>
						<td colspan="5" height="15px"
							style="border: 0 none; background: #FFF"></td>
					</tr> 
					<c:forEach var="mf" items="${myFocus}"> 
						<tr>
							<td bgcolor="#ffffff" align="center">${mf.id}</td>
							<td bgcolor="#ffffff"  align="center">${mf.gname}</td>
							<td align="center" bgcolor="#ffffff" height="60px"> <img
									style="width: 50px; height: 50px;"
									src="logos/${mf.gpicture}" border="0"
									title="${mf.gname}" /> </td>
							<td align="center" bgcolor="#ffffff">${mf.grprice}</td>
							<td align="center" bgcolor="#ffffff">
								<a style="text-decoration: none;" class="f6" href="goodsDetail?id=${mf.id}">去看看</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		-->
	</div>
	
	<!--证书号-->
    <div class="last">
        <div class="lup">
            <div class="last-logo"></div>
            <div class="last-info">
                <p class="sites">
                          <a href="https://10035.suning.com/">苏宁互联</a>
                        <span class="sep">|</span>
                        <a href="https://jinrong.suning.com/">苏宁金融</a>
                        <span class="sep">|</span>
                        <a href="https://pay.suning.com/epp-epw/login/login.action?idsTrustFrom=suning">苏宁支付</a>
                        <span class="sep">|</span>
                        <a href="https://www.pptv.com/?rcc_id=snyg">PP视频</a>
                        <span class="sep">|</span>
                        <a href="https://pindao.suning.com/city/Redbaby.html">红孩子</a>
                        <span class="sep">|</span>
                        <a href="https://wuliu.suning.com/home/home.htm">苏宁物流</a>
                        <span class="sep">|</span>
                        <a href="https://cuxiao.suning.com/newUser.html">手机苏宁</a>
                        <span class="sep">|</span>
                        <a href="https://lsy.suning.com/">零售云</a>
                        <span class="sep">|</span>
                        <a href="https://www.suningcloud.com/">苏宁云</a>
                        <span class="sep">|</span>
                        <a href="http://www.xglvip.com/knowledge.php?m=index&a=index">知识产权举报</a>
                        <span class="sep">|</span>
                        <a href="https://www.suning.cn/cms/enterpriseManagementIntro/index.htm">投资者关系</a>
                        <span class="sep">|</span>
                        <a href="https://smarthome.suning.com/">苏宁智能</a>
                        <span class="sep">|</span>
                        <a href="https://hc.suning.com/help/channel-153317970815764428.htm">联系我们</a>
                        <span class="sep">|</span>
                        <a href="https://careers.suning.cn/">诚聘英才</a>
                        <span class="sep">|</span>
                        <a href="https://cc.suning.com/">合作招商</a>
                        <span class="sep">|</span>
                        <a href="https://ap.suning.com/aps-sale-web/">广告平台</a>
                        <span class="sep">|</span>
                        <a href="https://hc.suning.com/privacy/index.htm">隐私政策|</a>
                </p>
                <p class="inces">
                    Copyright© 2002-2020，苏宁易购集团股份有限公司版权所有| 苏公网安备 32010202010078号| 苏ICP备10207551号-4<br>
                    合字B2-20180025| 合字A1.B1.B2-20180017| 出版物经营许可证新出发苏批字第A-243号| 互联网药品信息服务资格证书（苏）-非经营性-2016-0005<br>
                    经营证照| 网络文化经营许可证：苏网文〔2018〕10580-203号| 互联网违法和不良信息举报邮箱：kfpt-yy@cnsuning.com| 举报电话：02566996699-865948<br>
                    医疗器械网络交易服务第三方平台备案凭证-（苏）网械平台备字（2018）第00052号<br>
                    本网站直接或间接向消费者推销商品或者服务的商业宣传均属于“广告”（包装及参数、售后保障等商品信息除外）
                </p>
            </div>
            <div class="links">
                <img src="images/before/link1.jpg" alt="">
                <img src="images/before/link2.jpg" alt="">
                <img src="images/before/link3.jpg" alt="">
                <img src="images/before/link4.jpg" alt="">
                <img src="images/before/link5.jpg" alt="">
            </div>
        </div>
    </div>

</body>
</html>