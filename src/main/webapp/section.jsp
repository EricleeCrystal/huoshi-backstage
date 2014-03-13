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
    	<title>${book.getBookName()} 第${chapter.getChapterNo()}章</title>
      
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
      .title a{
        position: relative;
        float: left;
        margin-left: 10px;
      }
      .sections{
        position: relative;
        float: left;
        width: 100%;
        left: 0;
        margin-top: 10px;
        margin-bottom: 20px;
      }
      .section{
        margin-top: 10px;
        position: relative;
        float: left;
        width: 100%;
        text-align: left;
      }
      .sectionTitle{
        position: relative;
        float: left;
        font-size: 14pt;
        margin-left: 5px;
      }
      .sectionNo{
        position: relative;
        float: left;
        width: 2%;
        text-align: right;
      }
      .sectionText{
        position: relative;
        float: left;
        width: 95%;
        margin-left: 10px;
      }
    </style>
  	</head>
  	<body>
      <div class="body">
        <div class="title">
          <div class="book"><s:property value="book.getBookName()"/></div>
          <div class="chapter">第<s:property value="chapter.getChapterNo()"/>章</div>
          <a href="./commentary?chapterId=${chapter.getSeqId()}">注解</a>
          <a href="./comment?chapterId=${chapter.getSeqId()}">评论</a>
        </div>

        <div class="sections">
        <%
          List<Section>sectionList = (List<Section>)request.getAttribute("sectionList");
          for(Section section:sectionList){
            %>
              <div class="section">
                <%
                  if(section.getTitle()==1){//主标题
                      %>
                        <div class="sectionTitle"><%=section.getSectionText()%></div>
                      <%
                  }else if(section.getTitle()==2){//副标题
                      %>
                        <div class="sectionTitle"><%=section.getSectionText()%></div>
                      <%
                  }else{//内容
                      %>
                      <div class="sectionNo"><%=section.getSectionNo()%></div>
                      <div class="sectionText"><%=section.getSectionText()%></div>
                      <%
                  }
                %>
              </div>
            <%
          }
        %>
        </div>
      </div>
  	</body>
</html>
