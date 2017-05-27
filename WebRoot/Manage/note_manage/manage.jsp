<!-- 留言管理(作者：徐辉) -->
<!-- 页面已修改 -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"   import="java.util.*,dao.*,entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理留言板</title>
<link href="../../css/order_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function selectAll()  
	{ 
	    var flag=true;
	  if (document.myform.selectButton.value=="全部选择") 
		{ 
  			document.myform.selectButton.value="取消全选"; 
  		    flag=true;
		} 
		else 
		{ 
 			 document.myform.selectButton.value="全部选择"; 
 			 flag=false;
		} 
		//alert(flag);
		for (var i=0;i<document.getElementsByName("messages").length;i++) { 
			var temp=document.getElementsByName("messages")[i]; 
			//alert(flag);
			temp.checked=flag; 
		} 
		
	}
	
	
	function delAll()  
	{ 
	var lId="";
	var mes=document.getElementsByName("messages");
	for(var i=0; i<mes.length;i++){
	if(mes[i].checked==true){
	    lId=lId+mes[i].value+",";
	}
	}
  location.href="../../do/doDelLiuyan.jsp?lId="+lId;
	}
</script>

</head>

<% 
//保存当前页面信息
session.setAttribute("THIS", "note_manage/manage.jsp");
  int currPages=1;  //当前页数
 if(request.getParameter("pages")!=null){
  	currPages=Integer.parseInt(request.getParameter("pages"));
  }
  LiuyanDao dao=new LiuyanDao();  //调用方法，显示当前页，每页显示10条
  List<LiuyansInfo> list =  dao.selectLiuyan(currPages);
  int sum=dao.getCount();  //获得总条数
  if(sum==0){//如果总数为0，就让它默认为1.
  sum=1;
  }
  int n=0;   //总页数
  if(sum%10==0){
  	 n=sum/10;
  }else{
     n=sum/10+1;
  }
   %>
<body>
		<jsp:include page="../orderMange/manageTop.jsp"/>
		<table align="center"><tr><td height="10px"></td></tr></table>
		<center><font size="5" >管理留言板</font></center>
		 	
		<form action=" ../../do/doDelLiuyan.jsp" name="myform" method="post">
		<table width="550px" align="center">
		<tr class="tr_sty"><th width="80px"></th><th>编号</th><th width="150px">主题</th><th>作者</th><th>时间</th> </tr>
		<%
                 if(list!=null){
                 for(int i=0;i<list.size();i++){
  	              LiuyansInfo info=list.get(i);     
           %>
		<tr class=" " height="25px">
		<td align="center"><input type="checkbox" name="messages" value="<%=info.getlId() %>" ></td>
		<td align="center"><%=(i+1) %></td><td align="center"><a href="onemessage.jsp?lId=<%=info.getlId() %>"><%=info.getlBiaoti()  %> </a> </td>
		<td align="center"><%=info.getuPetName() %></td> <td align="center"><%=info.getlTime() %></td> 
		</tr>	
			<%}
	                } %>
		</table>
		<center><div style="width:550px;"><hr/></div>
		<input name="selectButton" type="button" value="全部选择" onclick="selectAll()">&nbsp;&nbsp;
		<input type="button" value="删除已选项"  onclick="delAll()"></center>
		</form>
		
		<!-- -------------------------------以下是实现分页显示------------------------------------ -->
<p>&nbsp;</p><%
 if(n==1){  //如果只有一页
 %>
 <div align="center" >首页  &nbsp;上一页 &nbsp;  下一页 &nbsp; 末页 </div>
<%}else if(currPages==1){  //如果是首页%> 
 <div align="center">首页  &nbsp;上一页 &nbsp;  <a href="manage.jsp?pages=<%=currPages+1%>">下一页</a>&nbsp; <a href="manage.jsp?pages=<%=n%>">末页</a></div>
 <%
}else if(currPages==n){  //如果是末页
 %>
 <div align="center"><a href="manage.jsp?pages=1">首页</a>  &nbsp;<a href="manage.jsp?pages=<%=currPages-1%>">上一页</a> &nbsp;  下一页 &nbsp; 末页 </div>
 <%}else{ %>
 <div align="center"><a href="manage.jsp?pages=1">首页</a>  &nbsp;<a href="manage.jsp?pages=<%=currPages-1%>">上一页</a> &nbsp;  <a href="manage.jsp?pages=<%=currPages+1%>">下一页</a>&nbsp; <a href="manage.jsp?pages=<%=n%>">末页</a></div>
 <%} %><br/>
		
	<jsp:include page="../manageBottom.jsp"/>
</body>
</html>