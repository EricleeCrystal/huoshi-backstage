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
  	<title>账号管理</title>
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
      a {
          cursor: pointer;
          text-decoration: none;
          color: #000000;
      }
      a:hover {
        color: #6E6E6E;
      }
      .body {
        font-family: arial, sans-serif;
        width: 80%;
        min-width: 800px;
        position: relative;
        height: 100%;
        margin-left: 10%;
        text-align: center;
      }

      .users *{
        position: relative;
        float: left;
        text-align: center;
      }
      .title {
        margin-top: 10px;
        margin-bottom: 20px;
        width: 100%;
        font-size: 14pt;
        height: auto;
      }
      tr{
        border-bottom: solid 1px;
        margin-bottom: 5px;
        width: 100%;
      }
      .th{
        margin-bottom: 5px;
      }
      .seqId{
        width: 50px;
      }
      .userId{
        width: 100px;
      }
      .userName{
        width: 100px;
      }
      .regTime, .loginTime{
        width: 200px;
      }
      .loginip{
        width: 100px;
      }
      .loginAddr{
        width: 200px;
      }
      .edit{
        width: 100px;
      }

      .page{
        width: 100%;
        height: 50px;
        margin-top: 10px;
        font-size: 12px;
      }

      .page{
        font-family: arial,sans-serif;
        padding-left: 150px;
      }
      .page *{
        position: relative;
        float: left;
        font-size: 11px;
        margin-left: 10px;
      }
      .page .curr{
        font-weight: bold;
        height: 29px;
        line-height: 27px;
        min-width: 21px;
        padding: 0 8px;
        text-align: center;
      }

      .page .pageBtn{
        position: relative;        
        float: left;
        cursor: pointer;
        background-color: #F5F5F5;
        border: 1px solid rgba(0, 0, 0, 0.1);
        height: 29px;
        line-height: 27px;
        min-width: 21px;
        padding: 0 8px;
        text-align: center;
      }
      .page .pageNo{

      }

    </style>



    <script type="text/javascript">
      $(function(){
      });
    </script>
  	</head>
  	<body>
      <div class="body">
        <div class="title">账号管理</div>

        <table class="users">
          <tr class="th">
            <th class="seqId">编号</th>
            <th class="userId">userId</th>
            <th class="userName">用户名</th>
            <th class="regTime">注册时间</th>
            <th class="loginTime">最后登录时间</th>
            <th class="loginip">最后登录ip</th>
            <th class="loginAddr">最后登录地址</th>
            <th class="edit"></th>
          </tr>
          
          <%
          Page<UserVo> data = (Page<UserVo>)request.getAttribute("page");
            for(UserVo userVo:data.getList()){
              %>
              <tr class="td">
                <td class="seqId"><%=userVo.getSeqId()%></td>
                <td class="userId"><%=userVo.getUserId()%></td>
                <td class="userName"><%=userVo.getUserName()%></td>
                <td class="regTime"><%=userVo.getRegisterTime()%></td>
                <td class="loginTime"><%=userVo.getLoginTime()%></td>
                <td class="loginip"><%=userVo.getLoginAddr()%></td>
                <td class="loginAddr"><%=userVo.getAddr()%></td>
                <td class="edit">
                  <a class="button" href="./">修改</a>
                </td>
              </tr>
              <%
            }
          %>
        </table>

        <!--分页-->
        <div class="page">
          <%
          int pageTotal = data.getPageTotal();
          int pageNo = data.getPageNo();
          String href = "./user?pageSize=" + data.getPageSize() + "&pageNo=";
          if(pageNo > 1){
          %>
            <a class="pageBtn" href="<%=href%>1">第一页<a>
            <a class="pageBtn" href="<%=href%><%=(pageNo-1)%>">&lt; 上一页<a>
          <%
          }
          if(pageTotal <= 10){
            for(int i = 1; i <= pageTotal; i++){
              if(i == pageNo){
              %>
                <a href="<%=href%><%=i%>" class="curr"><%=i%><a>
              <%
              }else{
              %>
                <a href="<%=href%><%=i%>" class="pageBtn"><%=i%><a>
              <%
              }
            }
          }else{
            if(pageNo <= 5){
              for(int i = 1; i <= 10; i++){
                if(i == pageNo){
                %>
                  <a class="curr"><%=i%><a>
                <%
                }else{
                %>
                  <a href="<%=href%><%=i%>" class="pageBtn"><%=i%><a>
                <%
                }
              }
            }else{
              if(pageTotal - pageNo >= 5){
                for(int i = pageNo - 4; i <= pageNo + 5; i++){
                  if(i == pageNo){
                  %>
                    <a class="curr"><%=i%><a>
                  <%
                  }else{
                  %>
                    <a href="<%=href%><%=i%>" class="pageBtn"><%=i%><a>
                  <%
                  }
                }
              }else{
                for(int i = pageTotal - 9; i <= pageTotal; i++){
                  if(i == pageNo){
                  %>
                    <a href="<%=href%><%=i%>" class="curr"><%=i%><a>
                  <%
                  }else{
                  %>
                    <a href="<%=href%><%=i%>" class="pageBtn"><%=i%><a>
                  <%
                  }
                }
              }
            }
          }
          if(pageNo < pageTotal){
          %>
            <a class="pageBtn" href="<%=href%><%=(pageNo+1)%>">下一页 &gt;<a>          
            <a class="pageBtn" href="<%=href%><%=pageTotal%>">最后一页<a>
          <%
          }
          %>
        </div>


      </div>
  	</body>
</html>
 