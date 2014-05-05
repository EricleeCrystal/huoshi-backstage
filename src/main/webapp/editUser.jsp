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
  	<title>账号编辑</title>
    <meta charset="UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" href="static/css/base.css">
    <script src="static/script/jquery-2.1.0.min.js" type="text/javascript"></script>

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
      .body {
        font-family: arial, sans-serif;
        width: 80%;
        min-width: 1100px;
        position: relative;
        height: 100%;
        margin-left: 10%;
        text-align: center;
      }
      .title {
        margin-top: 10px;
        margin-bottom: 20px;
        width: 100%;
        font-size: 14pt;
        height: auto;
      }
      form{
        position: relative;
        float: left;
        min-width: 500px;
        width: 40%;
        margin-left: 35%;
        text-align: center;
      }
      form *{
        font-size: 14px;
      }
      form div{
        width: 100%;
        margin-top: 5px;
      }
      form div span{
        width: 150px;
      }
      .modify{
        margin-top: 30px;
        margin-left: 150px;
      }
    </style>

  	</head>
  	<body>
      <div class="body">
        <div class="title">内部账号管理</div>
        <%
          int sort = ((Integer)request.getAttribute("sort")).intValue();
          int pageNo = ((Integer)request.getAttribute("pageNo")).intValue();
          int pageSize = ((Integer)request.getAttribute("pageSize")).intValue();
          UserVo userVo = (UserVo)request.getAttribute("userVo");
        %>
        <form action="modifyUser">
          <input name="sort" value="<%=sort%>" readOnly="true" type="hidden">
          <input name="pageNo" value="<%=pageNo%>" readOnly="true" type="hidden">
          <input name="pageSize" value="<%=pageSize%>" readOnly="true" type="hidden">
          <input name="seqId" value="<%=userVo.getSeqId()%>" readOnly="true" type="hidden">

          <div class="userId"><span>userId</span><input name="userId" value="<%=userVo.getUserId()%>" readOnly="true"></div>
          <div class="userName"><span>用户名</span><input name="userName" value="<%=userVo.getUserName()%>"></div>
          <div class="regTime"><span>注册时间</span><input name="regTime" value="<%=userVo.getRegisterTime()%>"></div>
          <div class="loginTime"><span>最后登录时间</span><input name="loginTime" value="<%=userVo.getLoginTime()%>" readOnly="true"></div>
          <div class="loginip"><span>登 录 ip</span><input name="loginip" value="<%=userVo.getLoginAddr()%>"></div>
          <div class="loginAddr"><span>登 录 地 址</span><input value="<%=userVo.getAddr()%>" readOnly="true"></div>
          <div><input class="modify" value="修改" type="submit"></div>
        </form>
      </div>
  	</body>
</html>
 