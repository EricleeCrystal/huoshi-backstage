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
    	<title>内容</title>
      
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
      .body{
        width: 100%;
        min-width: 1000px;
        position: relative;
        height: 100%;
        margin-left: 100px;
        text-align: center;
      }
      .title{
        position: relative;
        float: left;
        margin-top: 50px;
        width: 100%;
        text-align: center;
      }
      .title div{
        position: relative;
        width: 100%; 
        margin-bottom: 5px;
      }
      .sections{
        position: relative;
        float: left;
        width: 80%;
        left: 0;
        margin-top: 10px;
      }
      .section{
        margin-top: 5px;
        position: relative;
        float: left;
        width: 100%;
        border-bottom: solid 1px gray;
        text-align: left;
      }
    </style>
  	</head>
  	<body>
      <div class="body">

        <div class="title">
          <div><s:property value="book.getBookName()"/></div>
          <div>第<s:property value="chapter.getChapterNo()"/>章</div>
        </div>

        <div class="sections">
        <%
          List<Section>sectionList = (List<Section>)request.getAttribute("sectionList");
          for(Section section:sectionList){
            %>
              <div class="section">
                <%
                  if(section.getTitle()==1){//主标题
                      
                  }else if(section.getTitle()==2){//副标题

                  }else{//内容

                  }
                %>
                <s:property value="#section.getSectionNo()"/>
              </div>
            <%
          }
        %>
        </div>

        <s:iterator id="section" value="sectionList">
          <div class="sections">
            <div class="section">
              <s:property value="#section.getSectionNo()"/>
              <s:property value="#section.getSectionText()"/>
            </div>
          </div>
        </s:iterator>

        </div>
      </div>
  	</body>
</html>
