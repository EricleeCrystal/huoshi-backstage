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
    <%
      int sort = ((Integer)request.getAttribute("sort")).intValue();
      int pageNo = ((Integer)request.getAttribute("pageNo")).intValue();
      int pageSize = ((Integer)request.getAttribute("pageSize")).intValue();
      ChapterVo chapterVo = (ChapterVo)request.getAttribute("chapterVo");
      BookVo bookVo = (BookVo)request.getAttribute("bookVo");
      CommentVo commentVo = (CommentVo)request.getAttribute("commentVo");
      int userId = ((Integer)request.getAttribute("userId")).intValue();
      String userName = (String)request.getAttribute("userName");
      int userType = ((Integer)request.getAttribute("userType")).intValue();

      String msg = (String)request.getAttribute("msg");
      if(msg == null){
        msg = "";
      }else{
        msg = msg.trim();
      }
      String content = (String)request.getAttribute("content");
      if(content == null || content.trim().length() == 0){
        content = commentVo.getContent();
      }
    %>
  	<base href="<%=basePath%>">
  	<title>发布评论</title>
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
      /*显示当前使用哪个用户进行操作*/
      .user {
          width: 300px;
          text-align: center;
          font-size: 12px;
          margin-top: 10px;
          float: right;
      }
      .user span{
          width: 60px;
      }
      .user select{
          margin-left: 10px;
          width: 100px;
      }
      .user #userInfo{
        width: 100%;
      }
      #userInfo .userId{
        width: 100%;
      }
      #userInfo .ip{
        width: 100%;
      }
      #userInfo .addr{
        width: 100%;
      }
      .user #userInfo span{
          width: 60px;
      }
      .user #userInfo div{
          margin-left: 5px;
      }
      form{
        position: relative;
        float: left;
        min-width: 500px;
        width: 40%;
        margin-left: 25%;
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
      input{
        width: 300px;
      }
      .fobid{
        width: 200px;
        margin-top: 10px;
      }
      .forbid div{
        width: 200px;
      }
      .forbid div input{
        width: 50px;
      }      
      .fobid input{
        width: 50px;
      }
      .modify{
        margin-top: 30px;
        margin-left: 250px;
        width: 70px;
      }
      #msg{
        height: 50px;
        margin-top: 10px;
        margin-bottom: 10px;
        color: red;
        margin-left: -20px;
      }
    </style>
    <script type="text/javascript">
      $(function(){
        <%
          if(userType == 1){
        %>
            $("#userselector").change(function(event) {
              displayUser();
            });
            //展现用户信息
            function displayUser(){
              var userId = $("#userselector").val();
              var text = $("option[value="+userId+"]").text();
              var loginAddr = $("option[value="+userId+"]").attr("loginAddr");
              var addr = $("option[value="+userId+"]").attr("addr");
              $("#userInfo>div[class='userId']>div").html(userId);
              $("#userInfo>div[class='ip']>div").html(loginAddr);
              $("#userInfo>div[class='addr']>div").html(addr);
              $("input[name='userName']").attr("value", text);
              $("input[name='userId']").attr("value", userId);
            }
            displayUser();
        <%
          }
        %>
        function handleForbid(){
          var forbidValue=0;
          if(<%=commentVo.isForbid()%> == true){
            forbidValue = 1;
          }
          $("input[name='forbid'][value='" + forbidValue + "']").attr("checked","true");
          console.log(forbidValue);
        }
        handleForbid();
      });
    </script>
  	</head>
  	<body>
      <div class="body">
        <div class="title">编辑评论</div>

        <%
          if(userType == 1){
        %>
          <div class="user">
            <span>切换用户</span>
            <select id="userselector">
              <%
                List<UserVo> userVoList = (List<UserVo>)request.getAttribute("userVoList");
                for(UserVo userVo:userVoList){
                  if(userId == 0){
                    userId = userVo.getUserId();
                    userName = userVo.getUserName();
                  }
              %>
                <option value ="<%=userVo.getUserId()%>" loginAddr="<%=userVo.getLoginAddr()%>" addr="<%=userVo.getAddr()%>"
                  <%
                    if(userVo.getUserId() == userId){
                    %>
                      selected="selected"
                    <%
                    }
                  %>
                  ><%=userVo.getUserName()%></option>
              <%
                }
              %>
            </select>
            <div id="userInfo">
              <div class="userId">
                <span>userId:</span>
                <div></div>
              </div>
              <div class="ip">
                <span>IP:</span>
                <div></div>
              </div>
              <div class="addr">
                <span>地址:</span>
                <div></div>
              </div>
            </div>
          </div>
        <%
          }
        %>

        <form action="modifyComment" method="post">
          <div id="msg"><%=msg%></div>
          <input name="cid" value="<%=commentVo.getSeqId()%>" readOnly="true" type="hidden">
          <input name="sort" value="<%=sort%>" readOnly="true" type="hidden">
          <input name="pageNo" value="<%=pageNo%>" readOnly="true" type="hidden">
          <input name="pageSize" value="<%=pageSize%>" readOnly="true" type="hidden">
          <input name="userId" value="<%=userId%>" readOnly="true" type="hidden">
          <input name="userType" value="<%=userType%>" readOnly="true" type="hidden">
          <div class="bookName"><span>书名</span><input name="bookName" value="<%=bookVo.getBookName()%>" readOnly="true" disabled="disabled"></div>
          <div class="chapterNo"><span>章节</span><input name="chapterNo" value="<%=chapterVo.getChapterNo()%>" readOnly="true" disabled="disabled"></div>
          <div class="userName"><span>用户名</span><input name="userName" value="<%=userName%>" readOnly="true" disabled="disabled"></div>
          <div class="forbid">
            <span>状态</span>
            <div>
              <tt>显示</tt><input type="radio" name="forbid" value="0"/>
              <tt>禁止</tt><input type="radio" name="forbid" value="1"/>
            </div>
          </div>
          <div class="content"><span>内容</span>
            <textarea name="content" rows="10" cols="38"
            <%
              if(userType == 0){
              %>
                readOnly="true"
              <%  
              }
            %>><%=content%></textarea>
          </div>
          <div><input class="modify" value="保存修改" type="submit"></div>
        </form>
      </div>
  	</body>
</html>
 