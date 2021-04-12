<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登录页面</title>
	<link href="css/before/daohang_kz.css" rel="stylesheet" type="text/css" />
	<link href="css/before/common_kz.css" rel="stylesheet" type="text/css" />
	<link href="css/before/style_kz.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
table {
	text-align: center;
}

.textSize {
	width: 200px;
	height: 20px;
}

/*登录框*/
.login_div {
	background: url(images/before/login_bg.jpg) center no-repeat;
	height:570px;
}


.login_r {
	width: 400px;
	height: 360px;
	background-color: white;  
	position: absolute;   
    top: 50%;   
    left:50%;   
    margin: -50px 0 0 150px;  
}

.login_r h1 {
	color: orange;
	text-shadow: 0 0 10px;
	letter-spacing: 1px;
	text-align: center;
	font-size: 2em;
	margin: 0.67em 0;
}

.login_r input {
	width: 278px;
	height: 18px;
	margin-bottom: 10px;
	outline: none;
	padding: 10px;
	font-size: 13px;
	color: black;
	border-top: 1px solid #312E3D;
	border-left: 1px solid #312E3D;
	border-right: 1px solid #312E3D;
	border-bottom: 1px solid #56536A;
	border-radius: 4px;
	background-color: white;
	/*
	margin-left: 50px;
	*/
}

.login_bt {
	width: 300px;
	min-height: 20px;
	display: block;
	background-color: #f60;
	color: #fff;
	padding: 9px 14px;
	font-size: 15px;
	line-height: normal;
	border-radius: 5px;
	margin-top: 10px;
	/*
	margin-left: 45px;
	*/

}
</style>
	<script type="text/javascript">
		//确定按钮
		function gogo() {
			document.loginform.submit();
		}
		//取消按钮
		function cancel() {
			document.loginform.action = "";
		}
		function refreshCode() {
			document.getElementById("code").src = "validateCode?"
					+ Math.random();
		}
	</script>
  </head>
  <body>
  	<center>
  	<!--  
  	<div class="login_div">
  	<form:form action="user/login" method="post" modelAttribute="buser"  name = "loginform">
	<table>
		<tr>
			 <td colspan="2"><img src="images/admin/login.gif"></td>
		</tr>
		<tr>
			<td>E-Mail：</td>
			<td><input type="text" name="bemail" value="${buser.bemail }"  class="textSize"/></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="password" name="bpwd" class="textSize"/></td>
		</tr>		
		<tr>
			<td>验证码：</td>
			<td><input type="text" name="code" class="textSize"/></td>
		</tr>		
		<tr>
			<td>
				<img id="code" src="validateCode"/>
			</td>
			<td class="ared">
				<a href="javascript:refreshCode();"><font color="blue">看不清，换一个！</font></a>
			</td>
		</tr>		
		<tr>
			<td colspan="2">
				<input type="image" src="images/admin/ok.gif" onclick="gogo()">
				<input type="image" src="images/admin/cancel.gif" onclick="cancel()">
			</td>
		</tr>
	</table>
	</form:form>
	${msg }
  	</div>
  	-->
  	<div class="clearfix">
  		<div class="blank20"></div>
  	 <div class="login_div">
        <div class="login_r">
            <form:form action="user/login" method="post" modelAttribute="buser"  name = "loginform">
          <table>
              <tr>
                <h1>用户登录</h1> 
              </tr>
              <tr>
                  <td><input type="text" name="bemail"  class="textSize" placeholder="E-mail"/></td>
              </tr>
              <tr>
                  <td><input type="password" name="bpwd" class="textSize" placeholder="密码"/></td>
              </tr>		
              <tr>
                  <td><input type="text" name="code" class="textSize" placeholder="验证码"/></td>
              </tr>		
              <tr>
                  <td >
                      <img id="code" src="validateCode"/>
                      <a href="javascript:refreshCode();"><font color="blue">看不清，换一个！</font></a>
                  </td>
                  <td class="ared">
                  </td>
              </tr>		
              <tr><td colspan="5" height="15px" style="border: 0 none; background: #FFF"></td></tr>
              <tr>
                  <td colspan="2">
                     <button class="login_bt" type="submit">登录</button>  
                  </td>
              </tr>
          </table>
          </form:form>
          <font color="red">${msg }</font>
            </div>
    </div>
  	
  	</div>
  	
  	</center>
  </body>
  <jsp:include page="bottom.jsp"></jsp:include>
</html>
