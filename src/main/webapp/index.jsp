<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<title>huoshi 后台</title> 
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
	      .menu{
	      	margin-top: 50px;
	      	width: 100%;
	      }
	      .menu *{
	      	font-size: 14px;
	      }
	      .menu a{
	      	position: relative;
	      	float: left;
	      	width: 100%;
	      	margin-top: 20px;
	      }
	  	</style>
	</head> 
	<body>
      <div class="body">
        <div class="title">内部账号登陆</div>
        <div class="menu">
        	<a href="./book">圣经</a>
        	<a href="./launcher">启动页管理</a>
        	<a href="./user">账号管理</a>
        </div>
      </div>
	</body> 
</html> 