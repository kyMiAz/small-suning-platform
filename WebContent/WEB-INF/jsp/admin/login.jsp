<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
//http://localhost:8080/ch20/
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>  
  <base href="<%=basePath%>">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台登录</title>
	<style type="text/css">
	   、
	html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,dl,dt,dd,ol,nav ul,nav li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline;}
	article, aside, details, figcaption, figure,footer, header, hgroup, menu, nav, section {display: block;}
	ol,ul{list-style:none;margin:0px;padding:0px;}
	blockquote,q{quotes:none;}
	blockquote:before,blockquote:after,q:before,q:after{content:'';content:none;}
	table{border-collapse:collapse;border-spacing:0;}

	a{text-decoration:none;}
	.txt-rt{text-align:right;}
	.txt-lt{text-align:left;}
	.txt-center{text-align:center;}
	.float-rt{float:right;}
	.float-lt{float:left;}
	.clear{clear:both;}
	.pos-relative{position:relative;}
	.pos-absolute{position:absolute;}
	.vertical-base{vertical-align:baseline;}
	.vertical-top{vertical-align:top;}
	nav.vertical ul li{display:block;}
	nav.horizontal ul li{display: inline-block;}
	img{max-width:100%;}

body {
	background:url('images/admin/back_bg.jpg') no-repeat 0px 0px;
	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	background-attachment: fixed;
    background-position: center;
}

body a {
	transition: 0.5s all;
	-webkit-transition: 0.5s all;
	-moz-transition: 0.5s all;
	-o-transition: 0.5s all;
	-ms-transition: 0.5s all;
}

h1 {
	color: #F60;
	text-align: center;
	letter-spacing: 6px;
	font-size: 40px;
	margin-top: 75px;
}

.container {
	width: 32%;
	margin: 50px auto;
	text-align: center;
	background:rgba(0, 0, 0, 0.43);
	-webkit-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
	-moz-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
	box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
}

h2 {
	font-size:	30px;
	color: #FFF;
	padding-top: 45px;
	letter-spacing:3px;
}
form {
	padding: 65px;
}

form span {
    width: 23%; 
    /*
    float: left;*/
    background: #fed14e;
    padding: 10.2px 10px;
    position: relative;
    color: #005377;
    font-size: 15px;
    letter-spacing: 1px;
}
/*
form span:after {
    content: '';
    position: absolute;
    width: 0;
    height: 0;
    right: -11px;
    border-top: 6px solid rgba(0, 0, 0, 0);
    border-left: 11px solid #fed14e;
    border-bottom: 6px solid rgba(0, 0, 0, 0);
    top: 14px;
}
*/
input.name {
	width: 65%;
	padding:10px 10px 10px 15px;
	border: none;
	outline: none;
	font-size: 17px;
	letter-spacing: 1px;
	margin-bottom: 35px;
    /*
	float:left;
    */
}

input.password {
	width: 65%;
	padding:10px 10px 10px 15px;
	border: none;
	outline: none;
	font-size: 17px;
	letter-spacing: 1px;
	margin-bottom: 35px;
}


.login-w3{
	width:50%;
	float:left;
    margin-left: 85px;
}
input[type="submit"]{
	background-color:#005377;
	color:#fff;
	padding:11px;
	outline: none;
	border:none;
	font-size: 17px;
	width:50%;
	cursor:pointer;
	margin-top:5px;
		transition: 0.5s all;
	-webkit-transition: 0.5s all;
	-moz-transition: 0.5s all;
	-o-transition: 0.5s all;
	-ms-transition: 0.5s all;
}
input[type="submit"]:hover{
	background:#fed14e;
	color:#000;

}
.footer-w3l{
	margin-top: 150px;
	margin-bottom: 20px;
}
.footer-w3l p {
	color:white;
	text-align:center;
	font-size:13px;
	letter-spacing:1px;
}
.footer-w3l a{
	color:white;
	text-decoration:none;
}
.footer-w3l a:hover{
	text-decoration:underline;
}
@media screen and (max-width: 1440px) {
	form span {
		font-size:14px;
		padding:10.5px 10px;
	}
	input.name{
		width: 63%;
	}
	input.password {
		width: 63%;
	}
	
}
@media screen and (max-width: 1366px) {
	.container {
		width: 37%;
	}
	
}

@media screen and (max-width: 1080px) {
	.container {
		width: 46%;
	}
	
	
}
@media screen and (max-width: 991px) {
	h1{
		margin-top:50px;
	}
	.container {
		width: 52%;
	}

}


@media screen and (max-width: 800px) {
	.container {
		width: 63%;
	}
	form {
		padding: 55px;
	}

}

@media screen and (max-width: 736px) {
	h1 {
		letter-spacing: 4px;
		font-size: 35px;
	}
	h2 {
		font-size: 28px;
		padding-top: 35px;
		letter-spacing: 2px;
	}

}
@media screen and (max-width: 667px) {
	.container {
		width: 66%;
	}
	form {
		padding: 53px;
	}

}
@media screen and (max-width: 640px) {
	form {
		padding: 42px;
	}
}
@media screen and (max-width: 600px) {
	.container {
		width: 70%;
	}
}
@media screen and (max-width: 568px) {
	.container {
		width: 74%;
	}
}
@media screen and (max-width: 480px) {
	h1 {
		letter-spacing: 2px;
		font-size: 31px;
	}
	.container {
		width: 78%;
	}
	form {
		padding: 30px;
	}
	input.name {
		width: 62%;
	}
	input.password{
		width: 62%;
	}
	input[type="submit"] {
		margin-top:8px;
	}
}
@media screen and (max-width: 414px) {
	.container {
		width: 85%;
	}
	form span {
		font-size: 12px;
	}
	input.name {
		width: 58.5%;
		padding: 9px 9px 9px 15px;
	}
	input.password{
		width: 58.5%;
		padding: 9px 9px 9px 15px;
	}
	.footer-w3l p {
		letter-spacing:0;
	}
}

@media screen and (max-width: 384px) {
	form span {
		width: 25%;
	}
	input.name {
		width: 57.5%;
	}
	input.password{
		width: 57.5%;
	}
}

@media screen and (max-width: 375px) {
	h1 {
		font-size: 27px;
	}
	h2 {
		font-size: 24px;
	}
	input.name {
		width: 57%;
	}
	input.password{
		width: 57%;
	}
	form span{
		padding-left:5px;
	}

}
@media screen and (max-width: 320px) {
	h1 {
		font-size: 23px;
		letter-spacing:1px;
	}
	h2 {
		font-size: 19px;
		letter-spacing:1px;
		padding-top:25px;
	}
	form {
		padding: 20px;
	}
	form span {
		font-size: 11px;
		width:27%;
	}
	input.name {
		padding: 8px 9px 8px 15px;
		width:55%;
	}
	input.password {
		padding: 8px 9px 8px 15px;
		width:55%;
	}
	.rem-for-agile{
		font-size:11px;
	}
	input[type="submit"] {
		padding: 9px;
		font-size: 16px;
		width: 60%;
		margin-top:10px;
	}
}
	</style>
	<script type="text/javascript">
	//确定按钮
	function gogo(){
		document.forms[0].submit();
	}
	//取消按钮
	function cancel(){
		document.forms[0].action = "";
	}
	</script>
  </head>
  <body>
  	<h1>苏宁公司后台登录系统</h1>
    <div class="container w3">
        <h2>管理员登录</h2>
		<form:form action="admin/login" modelAttribute="auser" method="post">
			<div class="username">
				<span class="username" style="height:19px">用户:</span>
				<form:input path="aname" class="name"/>
				<!-- 
				<input type="text" name="name" class="name" placeholder="" required>
				 -->
				<div class="clear"></div>
			</div>
			<div class="password-agileits">
				<span class="username"style="height:19px">密码:</span>
				<form:password path="apwd" name="password" class="password"/>
				<!-- 
				<input type="password" name="password" class="password" placeholder="" required>
				 -->				
				<div class="clear"></div>
			</div>
			<div class="login-w3">
					<font color="red">${msg }</font>
					<input type="submit" class="login" value="Login">
			</div>
			<div class="clear"></div>
		</form:form>
		
	</div>
	<div class="footer-w3l">
		<p> 苏宁公司后台登录系统</p>
	</div>
	
  </body>
</html>
