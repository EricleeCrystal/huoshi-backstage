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
	</head>
	
	<body>
  		<form action="saveLauncher" method="post" enctype="multipart/form-data">
          <div><span>模式</span><input type="text" name="mode"></div>
          <div><span>标题</span><input type="text" name="title"></div>
          <div><span>来源</span><input type="text" name="source"></div>
          <div><span>展示日期</span><input type="text" name="revealDate"></div>
          <div><span>延期显示</span><input type="text" name="exceed"></div>
          <div><span>图片</span><input type="file" name="image"><br></div>
    			<input type="submit" value="submit"><br>
  		</form>
  	</body>
</html>
