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
      .th *{
        margin-bottom: 5px;
        padding: 0;

      }
      td{
        padding-top: 50px;        
      }
      .td *{
        padding-left: 0; 
        padding-right: 0;
      }
      .seqId{
        width: 50px;
      }
      .mode{
        width: 100px;
      }
      .launcerTitle{
        width: 100px;
      }
      .source{
        width: 100px;
      }
      .image{
        width: 90px;
      }
      .revealDate{
        width: 100px;
      }
      .exceed{
        width: 100px;
      }
      .operaterName{
        width: 100px;
      }
      .createTime{
        width: 100px;
      }
      .edit{
        width: 100px;
      }

      .edit a{
        height: 27px;
        margin-left: 20px;
      }
      td[class="image"]{
        margin-top: 0;
        width: 90px;
        height: 140px;
        padding-top: 0px;
      }
      .bg{
        width: 80px;
        height: 130px;
        margin-left: 5px;
        text-align:center;
        border: solid 1px gray;
      }
      img{
        max-width:72px;
        width:expression(document.body.clientWidth > 72?"72px":"auto" );
        max-height: 128;
        height:expression(document.body.clientHeight > 128?"128px":"auto" );
        display:block;
        border:0
      }

      /*下面是分页的内容*/
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
            <th class="launcerTitle">文字内容</th>
            <th class="source">来源</th>
            <th class="image">图片</th>
            <th class="revealDate">展示日期</th>
            <th class="exceed">延期展示</th>
            <th class="valid">状态</th>
            <th class="operaterName">操作员</th>
            <th class="createTime">创建时间</th>
            <th class="edit"></th>
          </tr>
          
          <%
          Page<LauncherVo> data = (Page<LauncherVo>)request.getAttribute("page");
            for(LauncherVo launcherVo:data.getList()){
              %>
              <tr class="td">
                <td class="seqId"><%=launcherVo.getSeqId()%></td>
                <td class="mode">
                  <%
                    int mode = launcherVo.getMode();
                    if(mode == 1){
                    %>
                      图片模式
                    <%
                    }else if(mode == 2){
                    %>
                      文字模式
                    <%
                    }else if(mode == 3){
                    %>
                      图文组合模式
                    <%
                    }else{
                    %>
                      未知
                    <%
                    }
                  %>
                </td>
                <td class="launcerTitle"><%=launcherVo.getTitle()%></td>
                <td class="source"><%=launcherVo.getSource()%></td>
                <td class="image">
                  <%
                    String bgcolor = launcherVo.getBgcolor();
                    if(bgcolor != null && bgcolor.length()==10){
                      bgcolor = "#"+bgcolor.substring(2,8);
                    }else{
                      bgcolor = "";
                    }
                  %>
                  <div class="bg" style="background-color:<%=bgcolor%>">
                    <img src="<%=launcherVo.getImage()%>"/>
                  </div>
                </td>
                <td class="revealDate"><%=launcherVo.getRevealDate()%></td>
                <td class="exceed">
                  <%
                    if(launcherVo.isExceed()){
                    %>
                      是
                    <%                    
                    }else{
                    %>
                      否
                    <%
                    }
                  %>
                </td>
                <td class="valid">
                  <%
                    if(launcherVo.isValid()){
                    %>
                      有效
                    <%                    
                    }else{
                    %>
                      无效
                    <%
                    }
                  %>                  
                </td>
                <td class="operaterName">
                  <%
                    String opName = launcherVo.getOpName();
                    if(opName == null || opName.length()==0){
                    %>
                      系统操作
                    <%                    
                    }else{
                    %>
                      <%=opName%>
                    <%
                    }
                  %> 
                  <%=launcherVo.getOpName()%>
                </td>
                <td class="createTime"><%=launcherVo.getCreateTime()%></td>
                <td class="edit">
                  <a class="button" href="./editLauncher?seqId=<%=launcherVo.getSeqId()%>&sort=<%=sort%>&pageNo=<%=data.getPageNo()%>&pageSize=<%=data.getPageSize()%>">修改</a>
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
          if(pageTotal > 1){
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
          }          
          %>
        </div>

      </div>
  </body>
</html>
