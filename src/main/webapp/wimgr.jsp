
<!--
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   	<base href="<%=basePath%>">
   	<title>图片管理</title>
    <meta charset="UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

    <style type="text/css">
      .content{
        min-width: 1100px;
      }
      .header,.wi{
        margin-top: 20px;
        float: left;
        position: relative;
        width: 100%;
        border-bottom: solid 1px;
      }
      .header div{
        float: left;
        position: relative;
        left: 50px;
        margin-left: 50px;
      }

      .wi div{
        float: left;
        position: relative;
        left: 50px;
        margin-left: 50px;
      }

    </style>

	</head>
	
	<body>
    <a>添加</a>
    <div class="content">
      <div class="header">
        <div>编号</div>
        <div>标题</div>
        <div>描述</div>
        <div>图片</div>
        <div>MD5</div>
        <div>是否时效</div>
        <div>生效时间</div>
        <div>失效时间</div>
        <div>更新时间</div>
        <div>操作员</div>
      </div>

      <div class="wi">
        <div>编号</div>
        <div>标题</div>
        <div>描述</div>
        <div>图片</div>
        <div>MD5</div>
        <div>是否时效</div>
        <div>生效时间</div>
        <div>失效时间</div>
        <div>更新时间</div>
        <div>操作员</div>
      </div>


    </div>
  </body>
</html>
