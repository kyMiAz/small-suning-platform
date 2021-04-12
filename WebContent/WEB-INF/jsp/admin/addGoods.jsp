<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>添加商品</title>
<link href="css/admin/common.css" type="text/css" rel="stylesheet">
<style type="text/css">
		table{
			position: absolute;
			left:50px;
			text-align: center;
			border-collapse: collapse;
			font-size:20px;
		}
		.bgcolor{
		  	background-color: #F08080;
		}
		p{
			font-size:20px;
		}
		.tdone{
			height:25px;
			width:100px;
		}
		.tdtwo{
			height:25px;
			width:380px;	
		}
		input{
			height:18px;
			width:300px;
			text-align: center;
		}
		.sub{
			height:30px;
			width:350px;
		}
	</style>
</head>    
<body>
	<form:form action="adminGoods/addGoods" method="post" modelAttribute="goods" enctype="multipart/form-data">
		<table border=1 style="border-collapse: collapse;font-size:20px;">
			<caption>
				<font size=6 face=华文新魏>添加商品</font>
			</caption>
			<tr>
				<td class="tdone">名称<font color="red">*</font></td>
				<td class="tdtwo">
					<form:input path="gname"/>
				</td>
			</tr>
			<tr>
				<td>原价<font color="red">*</font></td>
				<td>
					<form:input path="goprice"/>
				</td>
			</tr>
			<tr>
				<td>折扣价</td>
				<td>
					<form:input path="grprice"/>
				</td>
			</tr>
			<tr>
				<td>库存</td>
				<td>
					<form:input path="gstore"/>
				</td>
			</tr>
			<tr>
				<td>图片</td>
				<td>
					<input type="file" name="logoImage"/>
				</td>
			</tr>
			<tr>
				<td>类型</td>
				<td>
					<form:select path="goodstype_id">
         				<form:options items="${goodsType }" itemLabel="typename" itemValue="id"/>
   					</form:select>
				</td>
			</tr>
			<tr>
				<td align="center" style="height:30px">
					<input class="sub" type="submit" value="提交"/>
				</td>
				<td align="left" style="height:30px">
					<input class="sub" style="width:380px" type="reset" value="重置"/>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>
