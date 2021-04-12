<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户管理</title>
	<link href="css/admin/common.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		table{
			text-align: center;
			border-collapse: collapse;
			font-size:20px;
			font-family:华文新魏;
		}
		.bgcolor{
		  	background-color: #F08080;
		}
		.userlist{
			font-family:华文新魏;
			font-size:30px;
			text-align: center;
			height:50px;
			width:800px;
		}
	</style>
	<script type="text/javascript">
		function changeColor(obj){
			obj.className = "bgcolor";
		}
		function changeColor1(obj){
			obj.className = "";
		}
		function checkDel(id){
  			if(window.confirm("是否删除该用户？")){
  				window.location.href="/DD-OnlineShop/adminUser/deleteuserManager?id="+id;
  			}
  		}
	</script>
</head>
<body>
	<br>
	<p class="userlist">用户列表</p>
	<table border="1" bordercolor="black">
		<tr>
			<th width="200px">用户ID</th>
			<th width="200px">用户E-mail</th>
			<th width="200px">用户密码</th>
			<th width="250px">删除</th>
		</tr>
		<c:forEach var="n" items="${userList}">
		<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
			<td>${n.id}</td>
			<td>${n.bemail}</td>
			<td><input type="password" value="${n.bpwd}" readonly></td>
			<td>
				<a href="javaScript:checkDel('${n.id}')">删除</a>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="4">${msg}</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
					&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;共${totalCount}条记录&nbsp;&nbsp;共${totalPage}页&nbsp;&nbsp;
					第${pageCur}页&nbsp;&nbsp;
					<c:url var="url_pre" value="adminUser/userInfo">
						<c:param name="pageCur" value="${pageCur - 1 }"/>
					</c:url>
					<c:url var="url_next" value="adminUser/userInfo">
						<c:param name="pageCur" value="${pageCur + 1 }"/>
					</c:url>
					<!-- 第一页没有上一页 -->
					<c:if test="${pageCur != 1 }">
						<a href="${url_pre}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>
					<!-- 最后一页，没有下一页 -->
					<c:if test="${pageCur != totalPage && totalPage != 0}">
						<a href="${url_next}">下一页</a>
					</c:if>
				</td>
		</tr>
	</table>
</body>
</html>