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
<title>搜索结果</title>
<link href="css/before/daohang_kz.css" rel="stylesheet" type="text/css" />
<link href="css/before/common_kz.css" rel="stylesheet" type="text/css" />
<link href="css/before/style_kz.css" rel="stylesheet" type="text/css" />
</head>
<style>
a{
	text-decoration: none;
}
    .search_list li{
        position: relative;
        width: 270px;
        height: 400px;
        margin-left: 25px;
        margin-bottom: 14px;
        float: left;

    }
    .search_list li:hover{
        -webkit-box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            box-shadow: 0.5px 15px 30px rgba(0,0,0,0.1);
            -webkit-transform: translate3d(0, -2px, 0);
            transform: translate3d(0, -2px, 0);
       }


    .price_box{
        text-align: center;
        position: relative;
        width: 270px;
        height: 20px;
        margin: 12px 0 0 0;
        overflow: hidden;
        font-family: Tahoma;
        height: 20px;
        line-height: 18px;
        font-size: 20px;
        color: #F60;
        font-weight: bold;
    }

    .price_box i{
        font-style: normal;
        font-size: 15px;
        font-family: arial;
        margin-right: 3px;
        font-weight: normal;
    }
    .search_title{
        margin-top: 8px;
        text-align: center;
    }
    .search_title a{
        font-size: 14px;
        color: #333;
    }

    .search_bot{
        margin-top: 8px;
        text-align: center;
    }
    .search_bot i{
    	top:0;
    	right:0;
    	position: relative;
        display: inline-block;
        margin: 0 2px 0 0;
        vertical-align: top;
        overflow: hidden;
        width: 12px;
        height: 12px;
        background: url(images/before/icons.png) no-repeat;
    }
    
    .no-find{
    	height: 174px;
    	padding: 0 0 0 40px;
    	margin: 20px auto;
	    font-size: 12px;
	    color: #666;
	    background: #F8F8FA;
	    font-family: "Microsoft YaHei";
    }
    .no-find i{
    	display: block;
	    float: left;
	    background: url(images/before/icons2.png) -165px -153px no-repeat;
	    width: 82px;
	    height: 99px;
	    margin: 20px 43px 0 0;
	    background-position: -169px -398px;
	    position: relative;
	    right: 0;
	    top: 0;
    }
    .no-find h3{
    	padding: 20px 0 10px 0;
    	font-size: 16px;
   		color: #666;
    }
    .mykey{
    	color: #F60;
    }
    
</style>
<script type="text/javascript">
	function goCart(id) {
		var name = "putcartform"+id;
		var form = document.getElementsByName(name);
		form[0].submit();
	}
	function gofocus(gno) {
		window.location.href = "/ch20/cart/searchfocus?id=" + gno+"&mykey=${mykey}";
	}
	
	function isfoc(){
		var isfocus = "${isfocus}";
		if(isfocus == true){
			alert("${msg}");
		}
		else
			return;
	}
	
	window.onload = isfoc();
	
</script>
<body>
	<!-- 
	<div class="blank"></div>
	<div class="block clearfix">
		<div class="location ared">当前位置： <a href="before?id=0">首页</a> > 搜索结果</div>
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
					<c:forEach items="${searchlist }" var="mf">
						<tr>
							<td bgcolor="#ffffff" align="center">${mf.id }</td>
							<td bgcolor="#ffffff" align="center">${mf.gname }</td>
							<td align="center" bgcolor="#ffffff" height="60px"><img
								style="width: 50px; height: 50px;"
								src="logos/${mf.gpicture }" border="0" title="${mf.gname }" />
							</td>
							<td align="center" bgcolor="#ffffff">${mf.grprice }</td>
							<td align="center" bgcolor="#ffffff"><a
								style="text-decoration: none;" class="f6"
								href="goodsDetail?id=${mf.id}">去看看</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	 -->
	<div class="blank"></div>
	<div class="block clearfix">
		<div class="location ared">当前位置： <a href="before?id=0">首页</a> > 搜索结果</div>
		<div class="blank20"></div>
		<div>
			<c:if test="${empty searchlist }">
				<div class = "no-find">
					<i></i>
					<div>
						<h3>非常抱歉！没有找到与' <span class="mykey">${mykey }</span> ' 相关的商品。</h3>
						<dl>
							<dt>建议您:</dt>
							<dd>1.检查输入的文字是否有误</dd>
							<dd>2.调整关键词输入，如“海尔冰箱BCD-312WDK”调整为“海尔冰箱”或“海尔冰箱312升”</dd>
						</dl>
					</div>
				</div>
			</c:if>
			<div class="nFlowBox">
                <ul class="search_list">
                <c:forEach items="${searchlist }" var="mf">
                <form action="cart/putCart" name="putcartform${mf.id}" method="post">
                		<input type="hidden" name="id" value="${mf.id }"/>
                		<input type="hidden" name="shoppingnum" value="1"/>
						<li>
							<div class="search_img">
								<a href="goodsDetail?id=${mf.id}"> <img
									style="width: 240px; height: 240px; margin-left: 15px; margin-top: 30px;"
									src="logos/${mf.gpicture }" border="0" title="${mf.gname }">
								</a>
							</div>
							<div class="price_box">
								<span> <i>¥</i>${mf.grprice }
								</span>
							</div>
							<p class="search_title">
								<a href="goodsDetail?id=${mf.id}">${mf.gname }</a>
							</p>
							<div class="search_bot">
								<a id="foc" href="javascript:void(0);" onclick="gofocus('${mf.id }')"> 
								<i style="background-position: -259px -212px;"></i> 关注
								</a> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<a id="car" href="javascript:void(0);" onclick="goCart('${mf.id }')"> 
								<i style="background-position: -135px -208px;"></i> 加入购物车
								</a>
							</div>
						</li>
				</form>
				</c:forEach>
               </ul>
			</div>
		</div>
    </div>
</body>
<jsp:include page="bottom.jsp"></jsp:include>
</html>
