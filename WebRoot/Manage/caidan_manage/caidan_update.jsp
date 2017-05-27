<!-- 修改菜单 (作者：徐辉)-->
<!-- 页面已修改 -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*,dao.*,entity.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="../../css/order_style.css" rel="stylesheet" type="text/css" />
</head>
<% 
  //获得当前商品的ID
  	String gId="1";
     //获得传递过来的参数gId
     if(request.getParameter("gId")!=null){
     	gId=request.getParameter("gId");
     } 
     //调用方法，根据传递过来的gId
     CaidanDao dao=new CaidanDao();
     GoodsInfo info=dao.getGoodById(gId);
    %>
<body>
<jsp:include page="../orderMange/manageTop.jsp"/>
	<form method="post" action="../../do/doUpCaidan.jsp">
		  <table width="694" border="0" align="center">
    <tr>
      <td height="55" colspan="2"><div align="center"><font size="5">修改菜单</font></div></td>
    </tr>
    
    <tr>
      <td width="261"><div align="right">菜名：</div></td>
      <td width="423"><input type="text" name="menu.menu_name" id="name" value="<%=info.getgName() %>"></td>
    </tr>  
    <tr><td height="8px"></td></tr>
    <tr>  
    <tr>
      <td width="261"><div align="right">菜系：</div></td>
      <td width="423"><select name="menu.menu_caixi" id="select" style="width:175px;height:25px;">
  <option selected="selected"><%=info.getgCaixi() %></option>
   <option value="湘菜">湘菜</option>
  <option value="川菜">川菜</option>
  <option value="苏菜">苏菜</option>
  <option value="鲁菜">鲁菜</option>
  <option value="粤菜">粤菜</option>
  <option value="闽菜">闽菜</option>
  <option value="浙菜">浙菜</option>
  <option value="徽菜">徽菜</option>
  <option value="其他">其他</option>
</select></td>
    </tr>
    <tr><td height="8px"></td></tr>
    <tr>
      <td><div align="right">金额：</div></td>
      <td><input type="text" name="menu.menu_price" id="price" value="<%=info.getgPrice() %>">
      元</td>
    </tr>
    <tr><td height="8px"></td></tr>
    <tr>
      <td><div align="right">已售数量：</div></td>
      <td><input type="text" name="menu.menu_count" id="count" value="<%=info.getgNum() %>">
      份</td>
    </tr>
    <tr><td height="8px"></td></tr>
    <tr>
      <td width="261"><div align="right">食材：</div></td>
      <td width="423"><input type="text" name="menu.menu_food" id="food" value="<%=info.getgFood() %>"></td>
    </tr>
    <tr><td height="8px"></td></tr>
    <tr>
      <td width="261"><div align="right">图片：</div></td>
      <td width="423"><input type="text" name="menu.menu_images" id="images" value="<%=info.getgImage()%>"></td>
      <td>
		<div align="left"><span id="gImages"></span></div>
	</td>
    </tr>
    <tr><td height="8px"></td></tr>
    <tr>
    <tr>
      <td><div align="right">简介：</div></td>
      <td><textarea name="menu.menu_content" cols="40" rows="4" ><%=info.getgDetails() %></textarea></td>
    </tr>
    <tr><td height="8px"></td></tr>
      <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="button" id="button" value="提交">
              <input type="hidden" name="txtgId" value="<%=info.getgId() %>" />
      <div align="right"><a href="caidan_index.jsp"><img src="../../images/fanhui.gif" border="0"/></a></div></td>
    </tr>
    	 
  </table>
	</form>
	<jsp:include page="../manageBottom.jsp"/>
</body>
</html>