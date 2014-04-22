
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.huoshi.im.vo.*"%>
<%@ page import="java.util.List.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   	<base href="<%=basePath%>">
   	<title>图片管理</title>
    <meta charset="UTF-8">
		<meta http-equiv="pragma" launcherth="no-cache">
		<meta http-equiv="cache-control" launcherth="no-cache">
		<meta http-equiv="expires" launcherth="0">    
		<meta http-equiv="keywords" launcherth="keyword1,keyword2,keyword3">
		<meta http-equiv="description" launcherth="This is my page">
    
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
        min-width: 1100px;
        position: relative;
        height: 100%;
        margin-left: 10%;
        text-align: center;
      }
      .launchers *{
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
      .title a{
        position: relative;
        float: left;
        margin-left: 30px;
      }
      .title .all{
        margin-left: 70%;
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
      .launcherId{
        width: 100px;
      }
      .launcherName{
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
        margin-top: -4px;
        width: 100px;
      }
      .edit a{
        height: 27px;
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
    </style>

	</head>
	
	<body>
    <div class="body">
        <div class="title">启动图片管理</div>
        <div class="title">
          <%
            int sort = ((Integer)request.getAttribute("sort")).intValue();
            if(sort == 1){
            %>
              <a class="all" href="./launcher?sort=0&pageNo=1&pageSize=12">全部</a>
              <a class="selected" href="./launcher?sort=1&pageNo=1&pageSize=12">无效</a>
              <a href="./launcher?sort=2&pageNo=1&pageSize=12">有效</a>
            <%
            }else if(sort == 2){
            %>
              <a class="all" href="./launcher?sort=0&pageNo=1&pageSize=12">全部</a>
              <a href="./launcher?sort=1&pageNo=1&pageSize=12">无效</a>
              <a class="selected" href="./launcher?sort=2&pageNo=1&pageSize=12">有效</a>
            <%
            }else{
            %>
              <a class="all" class="selected" href="./launcher?sort=0&pageNo=1&pageSize=12">全部</a>
              <a href="./launcher?sort=1&pageNo=1&pageSize=12">无效</a>
              <a href="./launcher?sort=2&pageNo=1&pageSize=12">有效</a>
            <%
            }
          %>
          <a href="./addLauncher" class="button">添加</a>
        </div>

        <table class="launchers">
          <tr class="th">
            <th class="seqId">编号</th>
            <th class="mode">模式</th>
            <th class="title">文字内容</th>
            <th class="source">来源</th>
            <th class="image">图片</th>
            <th class="revealDate">展示日期</th>
            <th class="exceed">是否延期展示</th>
            <th class="valid">是否有效</th>
            <th class="operaterName">操作员</th>
            <th class="createTime">创建时间</th>
            <th class="edit"></th>
          </tr>
          
          <%
          Page<launcherVo> data = (Page<launcherVo>)request.getAttribute("page");
            for(launcherVo launcherVo:data.getList()){
              %>
              <tr class="td">
                <td class="seqId"><%=launcherVo.getSeqId()%></td>
                <td class="mode"><%=launcherVo.getlauncherId()%></td>
                <td class="title"><%=launcherVo.getlauncherName()%></td>
                <td class="source"><%=launcherVo.getRegisterTime()%></td>
                <td class="image"><%=launcherVo.getLoginTime()%></td>
                <td class="revealDate"><%=launcherVo.getLoginAddr()%></td>
                <td class="exceed"><%=launcherVo.getAddr()%></td>
                <td class="valid"><%=launcherVo.getAddr()%></td>
                <td class="operaterName"><%=launcherVo.getAddr()%></td>
                <td class="createTime"><%=launcherVo.getAddr()%></td>
                <td class="edit">
                <%
                  if(launcherVo.getImei().length()==0){
                %> 
                    <a class="button" href="./editlauncher?launcherId=<%=launcherVo.getlauncherId()%>&sort=<%=sort%>&pageNo=<%=data.getPageNo()%>&pageSize=<%=data.getPageSize()%>">修改</a>
                <%
                  }
                %>
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
          String href = "./launcher?sort=" + sort + "&pageSize=" + data.getPageSize() + "&pageNo=";
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
