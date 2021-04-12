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
<title>订单确认</title>
<link href="css/before/daohang_kz.css" rel="stylesheet" type="text/css" />
<link href="css/before/common_kz.css" rel="stylesheet" type="text/css" />
<link href="css/before/style_kz.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function submitorder(total){
		if(window.confirm("是否真的提交订单，提交后不可再修改订单信息！")){
			window.location.href="/ch20/order/orderSubmit?amount=" + total;
			return true;
		}
		return false;
	}
</script> 
<style>
	.cr{
		float: right;
		display: inline-block;
		text-decoration: none;
		background-color: #f60;
	    border-radius: 2px;
	    color: #FFF;
	    font-family: "Microsoft YaHei";
	    width: 105px;
	    height: 40px;
	    margin: 0 0 0 10px;
	    line-height: 40px;
	    font-size: 18px;
	    font-weight: 700;
	    text-align: center;
	}
	
	.cl{
		float: right;
		font-size: 14px;
    	font-family: "Microsoft YaHei";
	}
	.cl span{
	    text-align: right;
	    color: #F90;
	    clear: both;
	    line-height: 40px;
	}
	.cl span i{
		margin-top: -2px;
    	vertical-align: middle;
        margin-right: 5px;
        display: inline-block;
	    width: 16px;
	    height: 16px;
	    background: url(images/before/icons4.png) no-repeat;
        background-position: -34px -136px;
        position: relative;
	    right: 0;
	    top: 0;
        
	}
	.pricetype{
		font-family: tahoma;
		color:#f60;
		font-size: 22px;
		font-weight: 700;
	}
	.priceto{
		color: #999;
	    font-size: 14px;
	    font-family: "Microsoft YaHei";
	}
	
	.top_right{
	    float: right;
        margin-top: 26px;
    	background: url(images/before/confirm.png) 60px 0 no-repeat;
	}
	.top_right ul li{
		position: relative;
	    float: left;
	    width: 144px;
	    text-align: center;
	    list-style: none;
	}
	.top_right ul li i{
		position: relative;
	    display: block;
	    width: 24px;
	    height: 24px;
	    margin: 0 auto 6px;
	    line-height: 24px;
	    font-weight: 700;
	    color: #BBB;
	    z-index: 10;
	    right: 0px;
    	top: 0px;
    	font-size:12px;
	}
	.top_right ul li .finish{
		color: #FFF;
	}
	.top_right ul li span{
	   color: #333;
	   font-family: "Microsoft YaHei";
	   font-size: 14px;
    }

    
    .top_right ul li b{
       	position: absolute;
	    display: inline-block;
	    height: 24px;
	    top: 0;
	    background: url(images/before/conbg.png) no-repeat;
    }
    .top_right ul .finish01 b{
    	width: 25px;
	    left: 60px;
	    background-position: 0 0;
    }
    
    .top_right ul .finish02 b{
    	width: 158px;
	    left: -74px;
	    background-position: -10px -26px;
    }
    h6{
    	background:#f6f6f6;
    }

	
</style>
</head>
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
						</td>
						<td><span class="xx">|</span><a href="userCenter">用户中心</a><span
							class="xx">|</span></td>
						<!-- 没有登录 -->
						<c:if test="${bruser!= null}">	
						<td><a href="user/exit">退出</a><span
							class="xx">|</span></td>
						</c:if>
					</tr>
				</table>
			</div>
		</div>
		<!--end-->
		<!--logo 搜索-->
		<div class="all_zong_logo">
			<div class="all_zong_logo2">
				<a href="before"><img src="images/before/logo.png" width="190px" height="90px" /></a>
			</div>
			<div class="top_right">
				<ul>
					<li class="finish01">
						<i class="finish">1</i>
						<span>我的购物车</span>
						<b></b>
					</li>
					<li class="finish02">
						<i class="finish">2</i>
						<span>确认订单</span>
						<b></b>
					</li>
					<li class="finish03">
						<i>3</i>
						<span>付款</span>
						<b></b>
					</li>
					<li class="finish04">
						<i>4</i>
						<span>支付成功</span>
						<b></b>
					</li>
				</ul>
			</div>
		</div>
  
  
	<div class="blank"></div>
	<div class="block clearfix"><!--当前位置-->
	<div class="location ared">当前位置：<a href="">首页</a> > 购物流程 > 确认订单信息</div>
	<div class="blank"></div>
			<div class="nFlowBox">
   <form action="" method="post">
    <h6 >商品列表</h6>
             <table width="100%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
            <tr>
              <th bgcolor="#ffffff">商品名称</th>
              <th bgcolor="#ffffff">市场价格</th>
              <th bgcolor="#ffffff">购买数量</th>
              <th bgcolor="#ffffff">小计</th>
            </tr> 
           <c:forEach var="ce" items="${cartlist}"> 
            <tr>
              <td bgcolor="#ffffff" align="center">
                  	${ce.gname}
              </td>
              <td align="center" bgcolor="#ffffff">${ce.grprice}</td>
              <td align="center" bgcolor="#ffffff">
                ${ce.shoppingnum}
              </td>
              <td align="center" bgcolor="#ffffff">￥&nbsp;${ce.smallsum}&nbsp;元 </td>
            </tr>
       	  </c:forEach>
       	  	<tr><td colspan="5" height="15px" style="border: 0 none; background: #FFF"></td></tr>
       	  	<tr>
       	  		<td bgcolor="#ffffff" colspan="4" align="right">
       	 			<span class="priceto">应付金额：</span>
       	 			<font class="pricetype" >￥${total}</font>  	
              </td>
          </tr>   	
        </table>  
        <div align="center" style="margin:8px auto;">
			<a class="cr" onclick="submitorder(${total})" href="javascript:void(0);">提交订单</a>
			<div class="cl">
				<span>
					<i></i>
					提交订单后尽快支付，商品才不会被人抢走哦！
				</span>
			</div>
			
        	<!--  
       		 <img style="cursor:pointer;"  onclick="submitorder(${total})" src="images/before/bnt_subOrder.gif" />
        	-->
    	</div> 
    	<input type="hidden" name="goodsamount" value="20"/>
    </form>
</div>
</div>
</body>
</html>




