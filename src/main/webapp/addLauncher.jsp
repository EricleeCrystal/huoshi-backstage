<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  	<head>
    	<base href="<%=basePath%>">
    	<title>启动图片管理</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="static/css/base.css">
    <script src="static/script/jquery-2.1.0.min.js" type="text/javascript"></script>
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
        margin-left: 35%;
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
      .save{
        margin-top: 30px;
        margin-left: 150px;
      }
    </style>    
	</head>

	<body>
    <div class="body">
      <div class="title">启动页添加</div>
  		<form action="saveLauncher" method="post" enctype="multipart/form-data">
          <div><span>模式</span><input type="text" name="mode"></div>
          <div><span>标题</span><input type="text" name="title"></div>
          <div><span>来源</span><input type="text" name="source"></div>
          <div><span>展示日期</span><input type="text" name="revealDate"></div>
          <div><span>延期显示</span><input type="text" name="exceed"></div>
          <div><span>图片</span><input type="file" name="image"></div>
    			<div><input class="save" type="submit" value="保存"></div>
  		</form>
    </div>
  </body>
</html>
