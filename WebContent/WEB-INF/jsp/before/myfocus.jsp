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
<title>我的关注页面</title>
<link href="css/before/daohang_kz.css" rel="stylesheet" type="text/css" />
<link href="css/before/common_kz.css" rel="stylesheet" type="text/css" />
<link href="css/before/style_kz.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
	function toMain(){
		window.top.location='/ch20/before';
	}
	function toDetail(id){
		window.top.location='/ch20/goodsDetail?id='+id;
	}
	function godelete(id){
		if(window.confirm("真的取消关注吗？")){
			window.location.href="/ch20/deleteFocus?id="+id;
			return true;
		}
		return false;
	}
</script>
<style>
	.empty-box{
		height: 150px;
	    font-size: 16px;
	    text-align: center;
	    padding-top: 50px;
	}
	.empty-box i{
		display: inline-block;
	    width: 74px;
	    height: 100px;
	    background: url(images/before/nofocus.png) no-repeat;
	    vertical-align: middle;
	    margin-right: 26px;
        position: relative;
	    right: 0;
	    top: 0;
	}
	.empty-box span{
	    font-size: 16px;
    	text-align: center;
    	font-family: "Microsoft Yahei";
	    line-height: 1.5;
	    color: #333;
	}
	.empty-box a{
		text-decoration: none;
		color:#f60
	}
	
	
</style>
<body>
<div class="block clearfix">
		<div class="location ared">
			我的关注
		</div>
		<div class="blank"></div>
		<div>
			<div class="nFlowBox">
				<c:if test="${empty myFocus }">
					<div class="empty-box">
						<i></i>
						<span>您还没有关注商品，赶紧去<a href="javascript:void(0);" onclick="toMain()">首页</a>逛逛吧</span>
					</div>
			
				</c:if>
				<c:if test="${not empty myFocus }">
									<table width="99%" align="center" border="0" cellpadding="5"
					cellspacing="1" bgcolor="#f5f5f5">
					<tr>
						<th>商品编号</th>
						<th>商品名称</th>
						<th>商品图片</th>
						<th>商品价格</th>
						<th>查看详情</th>
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
								<a style="text-decoration: none;" class="f6" href="javascript:void(0);" onclick="toDetail(${mf.id})">查看详情</a>
								<br>
								<a style="text-decoration: none;" class="f6" href="javascript:void(0);" onclick="godelete(${mf.fid})">取消关注</a>
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