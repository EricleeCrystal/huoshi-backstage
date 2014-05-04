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

    <link rel="stylesheet" href="static/css/jquery.ui.all.css">
    <link rel="stylesheet" href="static/css/comment.css">

    <script src="static/script/jquery-2.1.0.min.js" type="text/javascript"></script>

    <script src="static/script/ui/jquery.ui.core.js"></script>
    <script src="static/script/ui/jquery.ui.widget.js"></script>
    <script src="static/script/ui/jquery.ui.mouse.js"></script>
    <script src="static/script/ui/jquery.ui.button.js"></script>
    <script src="static/script/ui/jquery.ui.draggable.js"></script>
    <script src="static/script/ui/jquery.ui.position.js"></script>
    <script src="static/script/ui/jquery.ui.resizable.js"></script>
    <script src="static/script/ui/jquery.ui.button.js"></script>
    <script src="static/script/ui/jquery.ui.dialog.js"></script>
    <script src="static/script/ui/jquery.ui.effect.js"></script>

    <script type="text/javascript">
      $(function(){
        $("#userselector").change(function(event) {
          displayUser();
        });
        //展现用户信息
        function displayUser(){
          var userId = $("#userselector").val();
          var loginAddr = $("option[value="+userId+"]").attr("loginAddr");
          var addr = $("option[value="+userId+"]").attr("addr");
          // $("#userInfo").html("&nbsp;&nbsp;用户Id:&nbsp;" + userId + " &nbsp;&nbsp;用户名:" + userName + " &nbsp;&nbsp;ip地址:&nbsp;"+loginAddr + "&nbsp;&nbsp;地理位置:"+addr);
          $("#userInfo>div[class='userId']>div").html(userId);
          $("#userInfo>div[class='ip']>div").html(loginAddr);
          $("#userInfo>div[class='addr']>div").html(addr);
        }
        displayUser();
      });
    </script>
  </head>
	<body>
    <div class="body">

      <div class="title">
        <div class="chapter"><%=bookVo.getBookName()%> <br> 第<%=chapterVo.getChapterNo()%>章</div>
        <div class="user">
          <span>切换用户</span>
          <select id="userselector">
            <%
              List<UserVo> userVoList = (List<UserVo>)request.getAttribute("userVoList");
              for(UserVo userVo:userVoList){
            %>
              <option value ="<%=userVo.getUserId()%>" loginAddr="<%=userVo.getLoginAddr()%>" addr="<%=userVo.getAddr()%>"><%=userVo.getUserName()%></option>
            <%
              }
            %>
          </select>
          <div id="userInfo">
            <div class="userId">
              <span>Id:</span>
              <div></div>
            </div>
            <div class="ip">
              <span>IP:</span>
              <div></div>
            </div>
            <div class="addr">
              <span>addr:</span>
              <div></div>           
            </div>
          </div>
        </div>
        <div class="title">
          <%

            if(sort == 1){
            %>
              <a class="selected" href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=0&pageNo=1&pageSize=12">最近</a>
              <a href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=1&pageNo=1&pageSize=12">最前</a>
              <a href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=2&pageNo=1&pageSize=12">点赞</a>
            <%
            }else if(sort == 2){
            %>
              <a class="all" href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=0&pageNo=1&pageSize=12">最近</a>
              <a class="selected" href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=1&pageNo=1&pageSize=12">最前</a>
              <a href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=2&pageNo=1&pageSize=12">点赞</a>
            <%
            }else{
            %>
              <a class="all" href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=0&pageNo=1&pageSize=12">最近</a>
              <a href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=1&pageNo=1&pageSize=12">最前</a>
              <a class="selected" href="./comment?chapterId=<%=chapterVo.getChapterNo()%>&sort=2&pageNo=1&pageSize=12">点赞</a>
            <%
            }
          %>
          <a href="./addLauncher" class="button">添加</a>
        </div>
      </div>

      <div class="button" id="save">
        添加评论
      </div>

      <div id="msg" hidden="true">添加成功</div>

      <div class="comments">
        <%
          for(CommentVo c:data.getList()){

          }
        %>
                          var html = "<div class=\"comment\" commentid=\""
                    + arr[i].seqId
                    + "\"><div class=\"index\"><span class=\"user\">"
                    + arr[i].userName
                    + "</span><span class=\"time\">"
                    + arr[i].createTime
                    + "</span><span class=\"floor\">"
                    + arr[i].floorNo
                    + "楼</span>"
                    + forbidHtml
                    + "</div><div class=\"content\">"
                    + arr[i].content
                    + "</div><div class=\"button edit\" cid=\""
                    + arr[i].seqId
                    + "\">修改</div></div>";
      </div>

      <!--分页-->
      <div class="page">
        <%

        int pageTotal = data.getPageTotal();
        if(pageTotal > 1){
          int pageNo = data.getPageNo();
          String href = "./launcher?sort=" + sort + "&pageSize=" + data.getPageSize() + "&pageNo=";
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
