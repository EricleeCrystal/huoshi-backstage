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
    	<title>${bookVo.getBookName()} 第${chapterVo.getChapterNo()}章</title>
      
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
      .text{
        position: relative;
        float: left;
        width: 90%;
        margin-left: 10px;
      }
      .text *{
        position: relative;
        float: left;
        padding: 5px 0 5px 5px;
        margin-bottom: 5px;
      }
      .text span{
        width: 5%;
        margin-left: 5px;
      }
      .text textarea{
        width: 90%;
        border: 1px solid rgba(0, 0, 0, 0.1);

      }
      .sectionText{
        overflow-y:visible;
        height:50px;
      }
      .sectionNote{
        overflow-x: hidden;
        overflow-y: auto;
        height: 80px;
        border: 1px solid rgba(0, 0, 0, 0.1);
      }
      .button{
        cursor: pointer;
        border: 1px solid rgba(0, 0, 0, 0.1);
        background-color: #F5F5F5;
        font-family: arial,sans-serif;
        font-size: 11px;
        font-weight: bold;
        height: 29px;
        line-height: 27px;
        min-width: 54px;
        padding: 0 8px;
        text-align: center;
      }
      .edit{
        position: relative;
        float: left;
        margin-top: 60px;
      }
    </style>
  	</head>
  	<body>
      <div class="body">
        <div class="title">
          <div class="book"><s:property value="bookVo.getBookName()"/></div>
          <div class="chapter">第<s:property value="chapterVo.getChapterNo()"/>章</div>
          <a href="./comment?chapterId=${chapterVo.getSeqId()}">评论</a>
        </div>

        <div class="sections">
        <%
          List<SectionVo>sectionVoList = (List<SectionVo>)request.getAttribute("sectionVoList");
          for(SectionVo sectionVo:sectionVoList){
            %>
              <div class="section" id="<%=sectionVo.getSeqId()%>">
                <%
                  if(sectionVo.getTitle()==1){//主标题
                      %>
                        <div class="sectionTitle"><%=sectionVo.getZhSection()%></div>
                      <%
                  }else if(sectionVo.getTitle()==2){//副标题
                      %>
                        <div class="sectionTitle"><%=sectionVo.getZhSection()%></div>
                      <%
                  }else{//内容
                      %>
                      <div class="sectionNo"><%=sectionVo.getSectionNo()%></div>
                      <div class="text">
                        <span>经文</span>
                        <textarea class="sectionText" disabled="disabled"><%=sectionVo.getZhSection()%></textarea>

                        <span>注释</span>
                        <textarea  class="sectionNote" disabled="disabled"><%=sectionVo.getZhNote()%></textarea >
                      </div>
                      <div class="button edit">修改</div>
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
