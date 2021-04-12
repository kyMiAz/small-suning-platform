<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的订单页面</title>
<link href="css/before/daohang_kz.css" rel="stylesheet" type="text/css" />
<link href="css/before/common_kz.css" rel="stylesheet" type="text/css" />
<link href="css/before/style_kz.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
	function toMain(){
		window.top.location='/ch20/before';
	}
	
	function godelete(id){
		if(window.confirm("真的删除订单吗？")){
			window.location.href="/ch20/deleteOrder?id="+id;
			return true;
		}
		return false;
	}
	function toPay(id){
		if(window.confirm("确认支付？")){
			window.top.location='/ch20/order/toPay?ordersn='+id;
			return true;
		}
		return false;
	}
	
	
</script>
<style>
	.empty-box{
		padding: 100px 0;
    	text-align: center;
	}
	.emp-txt{
		font-weight: bold;
	    font-size: 14px;
	    height: 30px;
	    line-height: 30px;
	}
	.emp-go{
		font-family: "Microsoft YaHei";
	    color: #333;
	    font-size: 12px;
	    line-height: 1.4;
	}
</style>
<body>
<div class="block clearfix">
	<div class="location ared">
		我的订单
	</div>
	<div class="blank"></div>
	<div>
		<div class="nFlowBox">
			<c:if test="${empty myOrder }">
					<div class="empty-box">
						<p> <img src="images/before/noorder.png"> </p>
						<p class="emp-txt">嗷~这里木有订单~</p>
						<p class="emp-go">
							推荐您去：
							<a style="text-decoration: none;color: #28e;" href="javascript:void(0);" onclick="toMain()">首页</a>
							逛逛
						</p>			
			</c:if>
			<c:if test="${not empty myOrder }">
			<table width="99%" align="center" border="0" cellpadding="5"
				cellspacing="1" bgcolor="#f5f5f5">
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
						<a style="text-decoration: none;" class="f6" href="javascript:void(0);" onclick="toPay(${mo.id})">支付订单</a>
						</c:if>
						<c:if test="${mo.status == 1}" >已付款</c:if>
						</td>
						<td align="center" bgcolor="#ffffff">
						<a style="text-decoration: none;" class="f6" href="orderDetail?ordersn=${mo.id}">详情</a>
						<br>
						<a style="text-decoration: none;" class="f6" href="javascript:void(0);" onclick="godelete(${mo.id})">删除</a>
						</td>
					</tr>
					<tr><td colspan="5" height="15px" style="border: 0 none; background: #FFF"></td></tr>
				</c:forEach>
			</table>
			</c:if>
		</div>
	</div>
</div>
</body>
</html>