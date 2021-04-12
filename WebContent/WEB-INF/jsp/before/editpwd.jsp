<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<link href="css/before/daohang_kz.css" rel="stylesheet" type="text/css" />
<link href="css/before/common_kz.css" rel="stylesheet" type="text/css" />
<link href="css/before/style_kz.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function reLogin(){
		var isEdit = '${isEdit}';
		if(isEdit == true){
			alert("修改成功，请重新登录！");
			window.top.location='/ch20/toLogin';
		}
		else return;
	}
	window.onload = reLogin();
	
	//刷新验证码
	function refreshCode(){
		document.getElementById("code").src = "validateCode?" + Math.random();
    }
	//表单验证
	function checkForm(){
		var bpwd = document.editForm.bpwd.value;
		var nbpwd = document.editForm.nbpwd.value;
		if(bpwd == nbpwd){
			alert("新密码与旧密码不能一致！");
			return false;
		}
		if(nbpwd.length < 5){
			alert("密码长度必须大于5！");
			return false;
		}
		document.editForm.submit();
		return true;
	}
</script>
</head>
<body>
	<div class="clearfix">
		<div class="blank20"></div>
		<div class="box4">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="100%" valign="bottom">
						<h2>修改用户密码</h2>
					</td>
				</tr>
			</table>
		</div>
		<div class="blank10"></div>
		<div class="box4">
			<div class="case_ll clearfix">
				<div class="regist">
					<form:form action="user/editPwd" method="post" modelAttribute="buser"  name="editForm">
						<input type="hidden" name="bemail" value="${bruser.bemail}">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="ttbb2">
							<tr>
								<td width="16%" align="right"><span class="cl_f30">*</span>
									E-mail：</td>
								<td width="59%"><input type="text"
									id="textfield" class="my_txt_350" value="${bruser.bemail}" disabled="disabled" />
								</td>
							</tr> 
							<tr>
								<td align="right">&nbsp;</td>
								<td colspan="2" style="font-size: 12px; padding-bottom: 25px;">
									（E-mail地址无法修改）</td>
							</tr>
							<tr>
								<td align="right"><span class="cl_f30">*</span> 旧密码：</td>
								<td><input type="password" name="bpwd" id="textfield2"
									class="my_txt_350" /></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td colspan="2" style="font-size: 12px; padding-bottom: 25px;">
									（输入您以前的密码，验证您的身份）
								</td>
								<td width="25%" style="color:red;">${msg }</td>
							</tr>
							<tr>
								<td align="right"><span class="cl_f30">*</span> 新密码：</td>
								<td><input type="password" name="nbpwd" id="textfield3"
									class="my_txt_350" /></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td colspan="2" style="font-size: 12px; padding-bottom: 25px;">
									（为了您帐户的安全，建议使用字符+数字等多种不同类型的组合，且长度大于5位）</td>
							</tr>				
							<tr>
								<td align="right"><span class="cl_f30">*</span> 验证码：</td>
								<td class="ared"><input type="text" name="code"
									id="textfield5" class="my_txt_120" />
									<img id="code" src="validateCode" /> 
									<a href="javascript:refreshCode();"><font color="blue">看不清，换一个！</font></a>
								</td>
								<td style="color:red;">${codeError}</td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td colspan="2" class="cl_f30" style="font-size: 12px; padding-bottom: 25px;"></td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td height="50"><input type="button" name="button" id="button" onclick="checkForm()" value="修改密码" class="my_ann1" /></td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</form:form>
					<div class="blank20"></div>
				</div>
			</div>
		</div>
		<div class="blank10"></div>
	</div>
</body>
</html>
