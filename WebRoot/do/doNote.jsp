<%@ page language="java" import="java.util.*,dao.*,entity.*,java.text.*" pageEncoding="UTF-8"%>
<%
//留言操作（作者：周华）
request.setCharacterEncoding("UTF-8");//设置字符编码
String biaoti=request.getParameter("message.subject");//获得留言标题
String neirong=request.getParameter("message.content");//获得留言内容
//判断用户是否登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("../Book/shipping_Step1.jsp");
return;
}
  //获取用户相关信息
  UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");
      //获得当前时间
    Date date=new Date();
    DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String time=format.format(date);
  //添加留言
  NoteDao dao=new NoteDao();
  LiuyansInfo l=new LiuyansInfo(null,user.getuId(),biaoti,neirong,time);
  int res=dao.addNote(l);
    if(res>0){
    session.setAttribute("404","留言成功！");
    response.sendRedirect("../index/404.jsp");
    }else{
    session.setAttribute("404","留言失败！");
    response.sendRedirect("../index/404.jsp");
    }
  %>
