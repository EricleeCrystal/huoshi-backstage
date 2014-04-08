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
      body{
        position: relative;
        float: left;
        margin: 0;
      }
      .msg{
        position: relative;
        float: left;
        margin-left: 100px;
      }
      form{
        position: relative;
        float: left;
        margin-left: 50px;
        margin-top: 30px;
      }
      form div{
        position: relative;
        float: left;
        width: 700px;
      }
      form span{
        float: left;
        left: 100px;
        width: 100px;
      }
      form div input{
        float: left;
        left: 200px;
      }
    </style>

  	</head>
  	<body>

      <div class="msg">
        <%
          if(request.getAttribute("msg") != null){
        %>
          <%=request.getAttribute("msg")%>
        <%
          }
        %>
      <div>

      <form action="login" method="post">
        <div><span>opName:<span> <input type="text" name="opName" size="30"></div><br>
        <div><span>password:<span> <input type="password" name="password" size="50"></div><br>
        <input type="submit" value="submit">
      </form>
  	</body>
</html>