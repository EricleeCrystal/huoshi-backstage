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
    			标题:<input type="text" name="title"><br>
    			图片:<input type="file" name="image"><br>
          链接:<input type="text" name="href"><br>
    			描述:<input type="text" name="desc"><br>
    			优先级:<input type="text" name="priority"><br>
    			生效时间<input type="text" name="effectiveTime"><br>
    			失效时间<input type="text" name="expireTime"><br>
    			<input type="submit" value="submit"><br>
  		</form>
  	</body>
</html>
