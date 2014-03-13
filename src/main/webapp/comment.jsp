<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.huoshi.im.vo.*"%>
<%@ page import="com.huoshi.im.bean.*"%>
<%@ page import="java.util.List.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    	<base href="<%=basePath%>">
      <%
        Chapter chapter = (Chapter)request.getAttribute("chapter");
        PageResult<Comment> pageResult = (PageResult<Comment>)request.getAttribute("pageResult");
      %>
    	<title><%=chapter.getBook().getBookName()%> 第<%=chapter.getChapterNo()%>章 评论</title>
      
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
      a{
        cursor: pointer;
        text-decoration: none;
        color: #000000;
      }
      a:hover{
        color: #6E6E6E;
      }
      .body{
        width: 80%;
        min-width: 800px;
        position: relative;
        height: 100%;
        margin-left: 10%;
        text-align: center;
      }
      .title{
        position: relative;
        float: left;
        margin-top: 10px;
        width: 100%;
        font-size: 14pt;
        text-align: center;
      }
      .title .book{
        position: relative;
        width: 100%; 
        margin-bottom: 5px;
      }
      .title .chapter{
        position: relative;
        float: left;
        margin-left: 46%;
        margin-bottom: 5px;
      }
      .comments{
        position: relative;
        float: left;
        width: 100%;
        left: 0;
        margin-top: 10px;
        margin-bottom: 20px;
      }
      .comment{
        margin-top: 15px;
        position: relative;
        float: left;
        width: 100%;
        text-align: left;
      }
      .index{
        position: relative;
        float: left;
        width: 100%;
      }
      .content{
        position: relative;
        float: left;
        width: 100%;
        left: 10px;
      }

    </style>
  	</head>
  	<body>
      <div class="body">
        <div class="title">
          <div class="chapter"><%=chapter.getBook().getBookName()%> 第<%=chapter.getChapterNo()%>章</div>
        </div>
        <div class="comments">
        <%
          for(Comment comment:pageResult.getList()){
            %>
              <div class="comment">
                <div class="index"><%=comment.getUser().getUserName()%> <%=comment.getCreateTime()%></div>
                <div class="content"><%=comment.getContent()%></div>
              </div>
            <%
          }
        %>
        </div>
          用户名<input type="text" name="userName">
          评论内容<div class="content" contenteditable="true"></div>
        <div>

        <div>
      </div>
  	</body>
</html>
