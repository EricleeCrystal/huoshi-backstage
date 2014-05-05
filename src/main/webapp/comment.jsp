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
  <%
    BookVo bookVo = (BookVo)request.getAttribute("bookVo");
    ChapterVo chapterVo = (ChapterVo)request.getAttribute("chapterVo");
    Page<CommentVo>data = (Page<CommentVo>)request.getAttribute("page");
    int sort = ((Integer)request.getAttribute("sort")).intValue();
  %>
	<head>
  	<base href="<%=basePath%>">
  	<title><%=bookVo.getBookName()%> 第<%=chapterVo.getChapterNo()%>章 评论</title>     
    <meta charset="UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" href="static/css/comment.css">

    <script src="static/script/jquery-2.1.0.min.js" type="text/javascript"></script>
    <style type="text/css">
      .title a{
        position: relative;
        float: left;
        margin-left: 30px;
      }
      .title > a:first-child{
        margin-left: 70%;
      }
      .vote{
        margin-left: 40px;
      }
      /*分页*/
      .page{
          width: 100%;
          height: 50px;
          margin-top: 10px;
          font-size: 12px;
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

      <div class="title">
        <div class="chapter"><%=bookVo.getBookName()%> <br> 第<%=chapterVo.getChapterNo()%>章</div>
      </div>
      <div class="title">
        <%
          if(sort == 0){
          %>
            <a class="selected" href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=0&pageNo=1&pageSize=12">最近</a>
            <a href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=1&pageNo=1&pageSize=12">最前</a>
            <a href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=2&pageNo=1&pageSize=12">点赞</a>
          <%
          }else if(sort == 1){
          %>
            <a href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=0&pageNo=1&pageSize=12">最近</a>
            <a class="selected" href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=1&pageNo=1&pageSize=12">最前</a>
            <a href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=2&pageNo=1&pageSize=12">点赞</a>
          <%
          }else{
          %>
            <a href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=0&pageNo=1&pageSize=12">最近</a>
            <a href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=1&pageNo=1&pageSize=12">最前</a>
            <a class="selected" href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=2&pageNo=1&pageSize=12">点赞</a>
          <%
          }
        %>
        <a href="./postComment?chapterId=<%=chapterVo.getSeqId()%>&sort=<%=sort%>&pageNo=<%=data.getPageNo()%>&pageSize=<%=data.getPageSize()%>" class="button">添加评论</a>
      </div>

      <div id="msg" hidden="true">添加成功</div>

      <div class="comments">
        <%
          for(CommentVo c:data.getList()){
          %>
          <div class="comment" commentid="<%=c.getSeqId()%>">
          <div class="index">
            <span class="user"><%=c.getUserName()%></span>
            <span class="time"><%=c.getCreateTime()%></span>
            <span class="floor"><%=c.getFloorNo()%>楼</span>
            <span class="vote">赞 <%=c.getTotalVote()%></span>
            <%
              if(c.isForbid()){
              %>
                <span class="forbid warn" isforbid="1">屏蔽</span>
              <%
              }else{
              %>
                <span class="forbid" isforbid="0">显示</span>
              <%
              }
            %>
          </div>
          <div class="content"><%=c.getContent()%></div>
          <a class="button edit" href="./editComment?cid=<%=c.getSeqId()%>&sort=<%=sort%>&pageNo=<%=data.getPageNo()%>&pageSize=<%=data.getPageSize()%>">修改</a>
          </div>
        <%
          }
        %>

      </div>

      <!--分页-->
      <div class="page">
        <%

        int pageTotal = data.getPageTotal();
        if(pageTotal > 1){
          int pageNo = data.getPageNo();
          String href = "./comment?chapterId=" + chapterVo.getSeqId() + "&sort=" + sort + "&pageSize=" + data.getPageSize() + "&pageNo=";
          if(pageNo > 1){
          %>
            <a class="pageBtn" href="<%=href%>">第一页<a>
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
