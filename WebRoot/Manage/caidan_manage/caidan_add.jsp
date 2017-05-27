<!-- 添加菜单 (作者：徐辉)-->
<!-- 页面已修改 -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*,dao.*,entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="../../css/order_style.css" rel="stylesheet" type="text/css" />
 
</head>
<body>
<jsp:include page="../orderMange/manageTop.jsp"/>
<form  method="post" action="../../do/doAddCaidan.jsp">
  
  <table width="694" border="0" align="center">
    <tr>
      <td height="55" colspan="2"><div align="center"><font size="5">添加菜单</font></div></td>
    </tr>
    
    <tr>
      <td width="261"><div align="right">菜名：</div></td>
      <td width="423"><input type="text" name="menu.menu_name" id="name"></td>
      <td>
		<div align="left"><span id="gname"></span></div>
	</td>
    </tr>  
    <tr><td height="8px"></td></tr>
    <tr>  
    <tr>
      <td width="261"><div align="right">菜系：</div></td>
      <td width="423"><select name="menu.menu_caixi" id="select" style="width:175px;height:25px;">
  <option value="湘菜" selected="selected">湘菜</option>
  <option value="川菜">川菜</option>
  <option value="苏菜">苏菜</option>
  <option value="鲁菜">鲁菜</option>
  <option value="粤菜">粤菜</option>
  <option value="闽菜">闽菜</option>
  <option value="浙菜">浙菜</option>
  <option value="徽菜">徽菜</option>
  <option value="其他">其他</option>
</select></td>
 <td>
		<div align="left"><span id="gcaixi"></span></div>
	</td>
    </tr>
    <tr><td height="8px"></td></tr>
    <tr>
      <td><div align="right">金额：</div></td>
      <td><input type="text" name="menu.menu_price" id="price">
      元</td>
      <td>
		<div align="left"><span id="gprice"></span></div>
	</td>
    </tr>
    <tr><td height="8px"></td></tr>
    <tr>
    <tr>
      <td width="261"><div align="right">食材：</div></td>
      <td width="423"><input type="text" name="menu.menu_food" id="food"></td>
      <td>
		<div align="left"><span id="gfood"></span></div>
	</td>
    </tr>
    
    <tr><td height="8px"></td></tr>
    <tr>
      <td width="261"><div align="right">图片：</div></td>
      <td width="423"><input type="file" name="menu.menu_images" id="images"></td>
      <td>
		<div align="left"><span id="gImages"></span></div>
	</td>
    </tr>
    <tr><td height="8px"></td></tr>
    <tr>
      <td><div align="right">简介：</div></td>
      <td><textarea name="menu.menu_content" cols="40" rows="4" ></textarea></td>
      <td>
		<div align="left"><span id="gdetails"></span></div>
	</td>
    </tr>
    <tr><td height="8px"></td></tr>
      <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="button" id="button" value="添加">
      <div align="right"><a href="caidan_index.jsp"><img src="../../images/fanhui.gif" border="0"/></a></div></td>
    </tr>
  </table>
</form>
	<jsp:include page="../manageBottom.jsp"/>
</body>
</html>