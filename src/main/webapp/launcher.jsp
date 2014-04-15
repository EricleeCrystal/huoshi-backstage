
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
      a {
          cursor: pointer;
          text-decoration: none;
          color: #000000;
      }
      a:hover {
        color: #6E6E6E;
      }
      .body {
        font-family: arial, sans-serif;
        width: 80%;
        min-width: 800px;
        position: relative;
        height: 100%;
        margin-left: 10%;
        text-align: center;
      }
      .body * {
        position: relative;
        float: left;
      }
      .title {
        margin-top: 10px;
        margin-bottom: 20px;
        width: 100%;
        font-size: 14pt;
        height: auto;
      }
      .title div {
        width: 100%;
        text-align: center;
        margin-bottom: 10px;
      }
      .button {
        cursor: pointer;
        border: 1px solid rgba(0, 0, 0, 0.1);
        background-color: #F5F5F5;
        font-family: arial, sans-serif;
        font-size: 11px;
        font-weight: bold;
        height: 29px;
        line-height: 27px;
        min-width: 54px;
        padding: 0 8px;
        text-align: center;
      }
      .content{
        width: 100%;
        float: left;
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
        height: auto;
        font-size: 14px;
        margin-top: 5px;
        margin-bottom: 5px;
      }
      .launcher{
        width: 100%;
        border-bottom: solid 1px;
        font-size: 12px;
      }
      .launcher div{
        text-align: center;
        margin-top: 5px;
        margin-bottom: 0px;
        height: 160px;
        font-size:12px;
      }
      .seqId{
        margin-left: 10px;
        width: 50px;
      }
      .content .title{
        width: 100px;
      }
      .desc{
        width: 120px;
      }
      .image{
        width: 150px;
      }
      .image img{
        margin-left: 5px;
        width: 140px;
      }
      .md5{
        width: 150px;
      }
      .href{
        width: 150px;
      }
      .priority{
        width: 80px;
      }
      .effectiveTime, .expireTime, .createTime{
        width: 100px;
      }
      .opName{
        width: 80px;
      }
      .pageNo{
        margin-bottom: 30px;
      }
    </style>

	</head>
	
	<body>
    <div class="body">
        <div class="title">
          <a href="./addLauncher" class="button">添加</a>
        </div>
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
            <div class="opName">
              <a class="button" href="">修改</a>
            </div>
          </div>
        <%
          }
        %>

        <div class="pageNo">
          <%
            int pageTotal = data.getPageTotal();
            if(pageTotal > 1){
              if(pageTotal <= 10){
                for(int pageNo = 1; pageNo <= pageTotal; pageNo++){
                  if(pageNo == data.getPageNo()){
                  %>
                    <a class="curr" href=""><%=pageNo%></a>
                  <%
                  }else{
                  %>
                    <a href=""><%=pageNo%></a>
                  <%
                  }
                }
              }else{

              }
            }
          %>

        </div>
      </div>
    </div>
  </body>
</html>
