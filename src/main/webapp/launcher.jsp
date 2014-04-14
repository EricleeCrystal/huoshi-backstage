
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.huoshi.im.vo.*"%>
<%@ page import="java.util.List.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
      body *{
        float: left;
        position: relative;
      }
      a{
        width: 100%;
      }
      .content{
        width: 80%;
        float: left;
        margin-left: 10%;
        min-width: 1100px;
      }
      .content *{
        position: relative;
        float: left;
      }
      .header{
        width: 100%;
        border-top: solid 1px;
        border-bottom: solid 1px;
      }
      .header div{
        text-align: center;
      }
      .launcher{
        border-bottom: solid 1px;
        font-size: 12px;     
      }
      .launcher div{
        text-align: center;
        margin-top: 5px;
        margin-bottom: 5px;
        vertical-align: middle;           
      }
      .seqId{
        margin-left: 10px;
        width: 50px;
      }
      .title{
        width: 100px;
      }
      .desc{
        width: 150px;
      }
      .image{
        width: 150px;
      }
      .image img{
        width: 140px;
      }
      .md5{
        width: 150px;
      }
      .href{
        width: 100px;
      }
      .priority{
        width: 100px;
      }
      .effectiveTime, .expireTime, .createTime{
        width: 100px;
      }
      .opName{
        width: 50px;
      }
    </style>

	</head>
	
	<body>
    <a href="./addLauncher">添加</a>
    <div class="content">
      <div class="header">
        <div class="seqId">编号</div>
        <div class="title">标题</div>
        <div class="desc">描述</div>
        <div class="image">图片</div>
        <div class="href">链接</div>
        <div class="priority">优先级</div>        
        <div class="effectiveTime">生效时间</div>
        <div class="expireTime">失效时间</div>
        <div class="createTime">更新时间</div>
        <div class="opName">操作员</div>
      </div>

      <%
        Page<LauncherVo> data = (Page<LauncherVo>)request.getAttribute("page");
          for(LauncherVo lv:data.getList()){
      %>
        <div class="launcher">
          <div class="seqId"><%=lv.getSeqId()%></div>
          <div class="title"><%=lv.getTitle()%></div>
          <div class="desc"><%=lv.getDesc()%></div>
          <div class="image"><img src="<%=lv.getImage()%>"></div>
          <div class="href"><%=lv.getHref()%></div>
          <div class="priority"><%=lv.getPriority()%></div>
          <div class="effectiveTime"><%=lv.getEffectiveTime()%></div>
          <div class="expireTime"><%=lv.getExpireTime()%></div>
          <div class="createTime"><%=lv.getCreateTime()%></div>
          <div class="opName"><%=lv.getOpName()%></div>
        </div>
      <%
        }
      %>
    </div>
  </body>
</html>
