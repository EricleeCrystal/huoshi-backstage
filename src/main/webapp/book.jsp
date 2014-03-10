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
    	<title>圣经目录</title>
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

      .title{
        width: 100%;        
        text-align: center;
        margin-top: 20px;
      }
      .books{
        width: 100%;
        min-width: 1000px;
        position: relative;
        height: 100%;
        margin-top: 100px;
        text-align: center;
      }

      .book{
        position: relative;
        float: left;
        width: 20%;
        left: 10px;
        margin-bottom: 20px;
      }
    </style>
  	</head>
  	<body>
      <div class="title">圣经</div>
      <div class="books">
        <s:iterator id="book" value="bookList">
          <div class="book">
            <a href="./book?bookId=${book.getSeqId()}">
              <s:property value="#book.getBookName()"/>
            </a>
          </div>
        </s:iterator>
      </div>
  	</body>
</html>
