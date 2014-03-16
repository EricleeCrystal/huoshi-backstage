<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.huoshi.im.vo.*"%>
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
        ChapterVo chapterVo = (ChapterVo)request.getAttribute("chapterVo");
      %>
    	<title><%=chapter.getBook().getBookName()%> 第<%=chapter.getChapterNo()%>章</title>
      
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
      .commentarys{
        position: relative;
        float: left;
        width: 100%;
        left: 0;
        margin-top: 10px;
        margin-bottom: 20px;
      }
      .commentary{
        margin-top: 15px;
        position: relative;
        float: left;
        width: 100%;
        text-align: left;
      }
      .content{
        position: relative;
        float: left;
        width: 90%;
        margin-left: 10px;
      }
      .index{
        position: relative;
        float: left;
        margin-left: 5px;
        margin-right: 10px;
      }
    </style>
  	</head>
  	<body>
      <div class="body">
        <div class="title">
          <div class="chapter"><%=chapter.getBook().getBookName()%> 第<%=chapter.getChapterNo()%>章</div>
        </div>
        <div class="commentarys">
        <%
          List<Commentary>commentaryList = (List<Commentary>)request.getAttribute("commentaryList");
          for(Commentary commentary:commentaryList){
            %>
              <div class="commentary">
                <div class="index">[<%=commentary.getFromIndex()%>-<%=commentary.getToIndex()%>]</div>
                <%=commentary.getContent()%>
              </div>
            <%
          }
        %>
        </div>
      </div>
  	</body>
</html>
