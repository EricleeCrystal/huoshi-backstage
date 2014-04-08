<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  	<head>
    	<base href="<%=basePath%>">
    	<title>图片管理</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	</head>
	
	<body>
  		<form action="addWelcomeImageAction" method="post" enctype="multipart/form-data">
    			title:<input type="text" name="title"><br>
    			image:<input type="file" name="image"><br>
    			desc:<input type="text" name="desc"><br>
    			expire:<input type="checkbox" name="expire" checked><br>
    			effectiveTime<input type="text" name="effectiveTime"><br>
    			expireTime<input type="text" name="expireTime"><br>
    			<input type="submit" value="submit"><br>
  		</form>
  	</body>
</html>
