<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    <base href="<%=basePath%>">
    <title>login</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
    <style type="text/css">
      body {
        width: 100%;
        position: relative;
        float: left;
        margin: 0;
        background-color: #F5F5F5;
        font-size: 62.5%;
        font-family:"Trebuchet MS", "Arial", "Helvetica", "Verdana", "sans-serif";
        text-align: center;
      }
      .body {
        font-family: arial, sans-serif;
        width: 80%;
        min-width: 1100px;
        position: relative;
        height: 100%;
        margin-left: 10%;
        text-align: center;
      }
      .title {
        margin-top: 10px;
        margin-bottom: 20px;
        width: 100%;
        font-size: 14pt;
        height: auto;
      }
      form{
        position: relative;
        float: left;
        min-width: 500px;
        width: 40%;
        margin-left: 30%;
        text-align: center;
      }
      form *{
        font-size: 14px;
      }
      form div{
        width: 100%;
        margin-top: 5px;
      }
      form div span{
        width: 150px;
      }
      input{
        width: 200px;
      } 
      #msg{
        height: 50px;
        margin-top: 10px;
        margin-bottom: 10px;
        color: red;
        margin-left: -20px;
      }
      .save{
        margin-top: 30px;
        width: 70px;
      }
    </style>
  	</head>
  	<body>
        <%
          String msg = (String)request.getParameter("msg");
          if(msg == null){
            msg = "";
          }
        %>
      <div class="body">
        <div class="title">内部账号登陆</div>
        <form action="login" method="post">
          <div id="msg"><%=msg%></div>
          <div><span>用户名:<span> <input type="text" name="opName" size="30"></div><br>
          <div><span>密 码:<span> <input type="password" name="password" size="50"></div><br>
          <input class="save" type="submit" value="登陆">
        </form>
      </div>

  	</body>
</html>