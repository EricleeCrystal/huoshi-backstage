<!--
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    	<base href="<%=basePath%>">
    	<title>圣经目录</title>
    <meta charset="UTF-8">
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

      .books{
        width: 100%;
        min-width: 1000px;
        position: relative;
        height: 100%;
        margin-top: 100px;
        text-align: center;
      }

      .book{
        position: relative;
        float: left;
        width: 50%;
        left: 100px;
        margin-bottom: 50px;
      }
    </style>
  	</head>
  	<body>
      <div class="books">
        <div class="book"><a href="">创世纪</a></div>
        <div class="book"><a href="">创世纪</a></div>
        <div class="book"><a href="">创世纪</a></div>
      </div>
  	</body>
</html>
