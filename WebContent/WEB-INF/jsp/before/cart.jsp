<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>购物车</title>
<link href="css/before/daohang_kz.css" rel="stylesheet" type="text/css" />
<link href="css/before/common_kz.css" rel="stylesheet" type="text/css" />
<link href="css/before/style_kz.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	//确认
	function  goOrderConfirm(){
		window.location.href="/ch20/cart/orderConfirm";
	}
	//清空
	function godelete(){
		if(window.confirm("真的清空购物车吗？")){
			window.location.href="/ch20/cart/clear";
			return true;
		}
		return false;
	}
	//删除
	function deleteAgoods(gno){
		if(window.confirm("真的删除该商品吗？")){
			window.location.href="/ch20/cart/deleteAgoods?id=" + gno;
			return true;
		}
		return false;
	}
</script>
<style>
	a{
		text-decoration: none;
	}
	.empty_car{
		background-position: 302px 47px;
		background: url(images/before/empty_car.jpg)  124px 47px no-repeat #fff ;
		height: 156px;
    	margin-top: 30px;
    	padding: 47px 0 57px 507px;
	}
	.empty_car h2{
	    padding-top: 40px;
	    font: 400 18px/40px "Microsoft YaHei";	
	}
	.empty_car h2 a{
		background-color: #f60;
	    border-radius: 2px;
	    color: #FFF;
	    font-family: "Microsoft YaHei";
	    padding: 5px 12px;
	}
	.c6{
	    border: 1px solid #ddd;
	    color:#666;
	    font: 12px/1.5 "Microsoft Yahei",tahoma,arial,"Hiragino Sans GB" ;
	    -webkit-font-smoothing: antialiased;
	}
	.d1{
		color:#666;
	}
	.d1:hover{
		color:#FF6600;
	}
	
	.botrg{
		float: right;
	}
	.botrg div{
		display: inline-block;
		padding-right:15px;
	}
	.botrl{
		float: left;
	}
	.fresh{
		position: relative;
	    display: inline-block;
	    width: 120px;
	    height: 60px;
	    line-height: 60px;
	    margin-top: -1px;
	    margin-right: -1px;
	    text-align: center;
	    font-size: 18px;
	    font-weight: 700;
	    font-family: "Microsoft YaHei";
	    color: #fff;
	    background-color: #00BFFF;
	}
	.order{
		position: relative;
	    display: inline-block;
	    width: 120px;
	    height: 60px;
	    line-height: 60px;
	    margin-top: -1px;
	    margin-right: -1px;
	    text-align: center;
	    font-size: 18px;
	    font-weight: 700;
	    font-family: "Microsoft YaHei";
	    color: #fff;
	    background-color: #f60;
	}
	#stotal{
		font-size: 22px;
		color:#ff6600;
	}
	#stotal i{
		font-size: 14px;
		color:#ff6600;
		position: relative;
		right:0;
		top:0;
	}
	
</style>
</head>
<body>
	<div class="blank"></div>
	<div class="block clearfix">
		<!--当前位置-->
		<div class="location ared">
			当前位置： <a href="before?id=0">首页</a> > 购物流程 > 购物车
		</div>
		<div class="blank"></div>
		<c:if test="${empty cartlist}">
		<div>
			<div class="nFlowBox">
				<div class="empty_car">	
					<h2>购物车还是空空的呢，快去 <a href="before">首页</a> 逛逛吧~~</h3>
				</div>
			</div>
		</div>
		</c:if>
		<c:if test="${not empty cartlist}">
			<div>
			<div class="nFlowBox">
				<!--  border="0" cellpadding="5"
					cellspacing="1" bgcolor="#dddddd" -->
				<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1">
					<tr class="c6">
						<th>商品信息</th>
						<th>单价（元）</th>
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
					<tr>
						<td colspan="5" height="15px"
							style="border: 0 none; background: #FFF"></td>
					</tr> 
					<!-- 这里使用了jstl标签-->
					<c:forEach var="ce" items="${cartlist}"> 
						<tr>
							<td bgcolor="#ffffff" align="center"><a href="goodsDetail?id=${ce.id}"> <img
									style="width: 100px; height: 100px;"
									src="logos/${ce.gpicture}" border="0"
									title="${ce.gname}" />
							</a><br/><a style="text-decoration: none;" href="goodsDetail?id=${ce.id}" class="f6">${ce.gname}</a></td>
							<td bgcolor="#ffffff" width="110px" align="center"><span>${ce.grprice}</span></td>
							<td align="center" bgcolor="#ffffff" width="115px"
								valign="middle"><input type="text" name="goods_number"
								value="${ce.shoppingnum}" size="4"
								class="inputBg"
								style="text-align: center; width: 36px; color: #999999" /></td>
							<td align="center" bgcolor="#ffffff" width="115px">￥&nbsp;<span>${ce.smallsum}</span>&nbsp;
							</td>
							<td align="center" bgcolor="#ffffff" width="185px"><a
								style="text-decoration: none;" href="javaScript:deleteAgoods('${ce.id}')"
								class="d1" title="删除">删除
							</a></td>
						</tr>
						<!-- 间隔行 -->
						<tr>
						<td colspan="5" height="15px"
							style="border: 0 none; background: #FFF"></td>
						</tr> 
					</c:forEach>
				</table>
				<div class="blank20"></div>
				<div class="car_bot">
				<div class="botrl">
					<a class="fresh" style="cursor: pointer;" href="javascript:godelete()">
						清空购物车
					</a>
				</div>
				<div class="botrg">
					<div>
					总价(不含运费)&nbsp;:&nbsp;
					<span id="stotal"><i>￥</i>${total}元</span>
					</div>
					<a class="order" style="cursor: pointer;" href="javascript:goOrderConfirm()">
						去结算
					</a>
				</div>
				</div>
					<!-- 
			<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1">	
					<tr>
						<td bgcolor="#ffffff" colspan="4" align="right"
							style="padding: 5px; padding-left: 2px; border-right: 0 none">
							<a href="before"> <img src="images/before/jxgw.jpg" alt="continue" />
						</a>
						</td>
					 	<td align="center" bgcolor="#ffffff"><input type="button"
							value="清空购物车" onclick="godelete()" class="bnt_blue_1" id="bnt11" />
						</td>
					 	<td align="right" bgcolor="#ffffff" colspan="4" height="41px;"
							style="border-left: 0 none;"><font
							style="color: #333333; font-size: 12px;  letter-spacing: 0px;">
								总价(不含运费)&nbsp;:&nbsp;
								<span id="stotal"><i>￥</i>${total}元</span>
						</font>
						</td>
						<td bgcolor="#ffffff" align="center"
							style="border-left: 0 none; padding: 5px; padding-right: 2px;">
							<a class="order" style="cursor: pointer;" href="javascript:goOrderConfirm()">
								去结算
						</a>
						</td>
					</tr>	
			</table>
					 -->
			</div>
		</div>
		</c:if>

	</div>
</body>
<jsp:include page="bottom.jsp"></jsp:include>
</html>
