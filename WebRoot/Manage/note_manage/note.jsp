<!-- 留言回复(作者：徐辉) -->
<!-- 新增页面 -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,dao.*,entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理留言板</title>
<link href="../../css/css.css" rel="stylesheet" type="text/css">
</head>
<% 
  //获得当前商品的ID
  	String lId="1";
     //获得传递过来的参数lId
     if(request.getParameter("lId")!=null){
     	lId=request.getParameter("lId");
     } 
     //调用方法，根据传递过来的gId
     LiuyanDao dao=new LiuyanDao();
     LiuyansInfo info=dao.getLiuyanById(lId);
    %>
<body>
		<jsp:include page="../orderMange/manageTop.jsp"/>
    <br>
    <center><font size="5" >回复留言</font></center>
	<center>
	<form action="../../do/doAddHuifu.jsp" method="post" name="mainForm">
		<table>
			<tr height="30px">
				<td width="60px">回复主题:</td>
  				<td align="left">
					<input id="subject" name="message.subject" disabled="disabled" type="text" value="<%=info.getlBiaoti() %>">
					<br>
				</td>
				<td>
					<span id="mgsubject"></span>
				</td>
			</tr>
			<tr height="30px">
				<td>作者:</td>
				<td align="left">					
					<input name="message.username" type="text" disabled="disabled" value="<%=info.getuPetName() %>"/>
				
				</td>
			</tr>
			<tr>
				<td>回复内容:</td>
				<td align="left">
					<textarea id="content" name="message.content" cols="40" rows="6"  onblur="checkContent()"></textarea>
				
				</td>
				<td>
					<span id="mgcontent"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
		      <input name="" type="submit" value="回复" onClick="getSub()">
		      <input type="hidden" name="lId" value="<%=info.getlId() %>" />
				</td>
		  </tr>
		</table>
	</form>
	</center>
		<jsp:include page="../manageBottom.jsp"/>
</body>
</html>