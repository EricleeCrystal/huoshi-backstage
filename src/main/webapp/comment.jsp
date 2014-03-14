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
    <script src="static/script/jquery-2.1.0.min.js" type="text/javascript"></script> 
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
        background-color: #F5F5F5;
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
      .form{
        position: relative;
        float: left;
        width: 100%;
      }
      .form .input{
        position: relative;
        float: left;
        width: 100%;
        margin-top: 10px;
      }
      .form .input .desc{
        position: relative;
        float: left;
        width: 70px;
        font-size: 14px;
      }
      .contentEdit{
        position: relative;
        float: left;
         border: 1px solid rgba(0, 0, 0, 0.1);
        margin:0;
        padding: 4px 6px 4px;
        text-align: left;
        font-size: 13px;
        font-family: arial,sans-serif;
      }
      #userName{
        width: 150px;
        min-height: 20px;
      }

      #content{
        width: 400px;
        min-height: 100px;
      }
      #submit{
        position: relative;
        float: left;
        cursor: pointer;
        border: 1px solid rgba(0, 0, 0, 0.1);
        background-color: #F5F5F5;
        font-family: arial,sans-serif;
        font-size: 11px;
        font-weight: bold;
        height: 29px;
        line-height: 27px;
        margin: 10px 250px;
        min-width: 54px;
        padding: 0 8px;
        text-align: center;
      }
    </style>

    <script type="text/javascript">
      $(function(){
        $("#submit").click(function(){
          $.post("saveComment",
            {},
            function(data){

          }, "json");
        });        
      });
    </script>
  </head>
	<body>
    <div class="body">
      <div class="title">
        <div class="chapter"><%=chapter.getBook().getBookName()%> 第<%=chapter.getChapterNo()%>章</div>
      </div>
      <div class="form">
        <div class="input">
          <div class="desc">用户名</div>
          <div class="contentEdit" contenteditable="true" id="userName"></div>
        </div>
        <div class="input">
          <div class="desc">内  容</div>
          <div class="contentEdit" contenteditable="true" id="content"></div>
        </div>
        <div class="input">
          <div id="submit" class="button">提交</div>
        </div>
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

    </div>
	</body>
</html>
