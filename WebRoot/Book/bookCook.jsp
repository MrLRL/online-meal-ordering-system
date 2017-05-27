<!-- 商品详情页（作者：周华） -->
<%@ page language="java" import="java.util.*,dao.*,entity.*" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
.style21 {
	font-weight: bold 
}
#pinglun a{
color:blue;
text-decoration:underline;
}
#pinglun a:hover{
color:red;
text-decoration:underline;
}
#pinglun{
font-size:15px;
}
-->
</style>
<link href="../css/css.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript">
	function add() {		
	var zhengshu=/^[1-9]\d*$/;
	var shuliang=document.getElementById("shuliang").value;
	if(!zhengshu.test(shuliang)){
	alert("您输入的数量有问题，请重新输入！");
	document.getElementById("shuliang").focus();
	document.getElementById("shuliang").value="";
	return false;
	}
		var objForm = document.bookCook;
		objForm.submit();
		return true;
	}
	function show() {		
	var zhengshu=/^[1-9]\d*$/;
	var shuliang=document.getElementById("shuliang").value;
	if(!zhengshu.test(shuliang)){
	alert("您输入的数量有问题，请重新输入！");
	document.getElementById("shuliang").focus();
	document.getElementById("shuliang").value="";
	return false;
	}
		var objForm = document.bookCook;
		objForm.action="../do/doLiji.jsp";
		objForm.submit();
		return true;
	}
</script>
<%
    //获得商品ID
    String id="1";
    if(request.getParameter("gId")!=null){
    id=request.getParameter("gId");
    }
   //保存当前页面信息
    session.setAttribute("THIS", "Book/bookCook.jsp?gId="+id);
    GoodsDao dao=new GoodsDao();
    GoodsInfo info=dao.xiangxi(id);
%>
<title>快乐订餐 欢迎你的到来</title>
</head>

<body>
<jsp:include page="../includeFile/shippingTop.jsp" />
<table width="955" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td height="10"></td>
	</tr>

	<tr>
		<td height="8"></td>
	</tr>
	<tr>
		<td height="400" valign="top">

		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="40" align="center">
				<font size="4px"><%=info.getgName() %> 详细信息 欢迎选购</font>
				</td>
			</tr>
			<tr>
				<td height="1" bgcolor="#E9E9E9"></td>
			</tr>
			<tr>
				<td height="12" background="../images/xian.gif"></td>
			</tr>
			<tr>
				<td>

				<form name="bookCook" action="../do/doCart.jsp" method="post">
				<table width="95%" height="334" border="0" align="center"
					cellpadding="0" cellspacing="0">
					<tr valign="top">
						<td width="40%" height="225" align="center"><img width="260" height="240"
							src="../img/<%=info.getgImage() %>" /> <br><br>
							<div id="pinglun"><a href="Pinglun.jsp?gId=<%=info.getgId() %>">查看评论</a></div>
						<td width="60%">
						<p>单价：<%=Double.parseDouble(info.getgPrice()) %> 元</p>
						<p>已经销售：<%=info.getgNum() %> 份</p>
						<p>所属菜系：<%=info.getgCaixi() %></p>
						<p>所用食材：<%=info.getgFood() %></p>
						<p>菜肴简介：<%=info.getgDetails() %></p>
						<p>选购数量： <input name="num" type="text" value="1"
							style="width:20px;" onkeypress="shuzi()" id="shuliang"> 份</p>
						<p><font style="vertical-align:top">其它要求：</font> <textarea name="notice" id="order_notic"
							cols="30"></textarea></p>
						<input type="hidden" name="gId" value="<%=info.getgId() %>">
						<a href="#"><img src="../images/ship_now.png" onclick="show()" /></a>
						<a href="#"><img src="../images/addingShipping.png" onclick="add()" /></a>
						<a href="../caidanList.jsp"><img src="../images/m.gif" align="top"/></a>
						</td>

					</tr>
				</table>
				</form>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<div align="center">
<br><br>
<iframe src="../includeFile/shippingBottom.jsp" width="1050"
					height="100" marginheight="0" marginwidth="0" frameborder="0"
					scrolling="no"></iframe>

</div>
</body>
</html>
