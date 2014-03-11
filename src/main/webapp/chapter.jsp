<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.huoshi.im.vo.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    	<base href="<%=basePath%>">
    	<title>章目录</title>
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
      .book{
        position: relative;
        float: left;
        margin-top: 50px;
        width: 100%;
        text-align: center;
      }
      .chapters{
        position: relative;
        float: left;
        width: 50%;
        left: 25%;
        margin-top: 10px;
        
      }

      .chapter{
        position: relative;
        float: left;
        padding: 5px 10px;
        margin-left: 5px;
        margin-bottom: 5px;
      }
    </style>
  	</head>
  	<body>
      <div class="body">
        <div class="book">
          <s:property value="book.getBookName()"/>
        </div>
        <div class="chapters">
          <%
            Book book=(Book)request.getAttribute("book");
            int chapterCount = 0;
            if(book != null){
              chapterCount = book.getChapterCount();
            }
            for(int i = 1; i <= chapterCount; i++){%>
              <div class="chapter">
                <a href="./section?bookId=${book.getSeqId()}&chapterNo=<%=i%>">
                  <%=i%>
                </a>
              </div>
            <%}
          %>
        </div>
      </div>

  	</body>
</html>
