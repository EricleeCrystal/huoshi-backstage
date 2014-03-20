<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.huoshi.im.vo.*"%>
<%@ page import="com.huoshi.im.bean.*"%>
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
    	<title>${bookVo.getBookName()} 第${chapterVo.getChapterNo()}章 评论</title>     
    <meta charset="UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" href="static/css/jquery.ui.all.css">
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

    <style type="text/css">
      body{
        width: 100%;
        position: relative;
        float: left;
        margin: 0;
        background-color: #F5F5F5;
        font-size: 62.5%;
        font-family: "Trebuchet MS", "Arial", "Helvetica", "Verdana", "sans-serif";
        text-align: center;
      }
      a{
        cursor: pointer;
        text-decoration: none;
        color: #000000;
      }
      a:hover{
        color: #6E6E6E;
      }
      .body{
        font-family: arial,sans-serif;
        width: 80%;
        min-width: 800px;
        position: relative;
        height: 100%;
        margin-left: 10%;
        text-align: center;
      }
      .title{
        position: relative;
        float: left;
        margin-top: 10px;
        margin-bottom: 20px;
        width: 100%;
        font-size: 14pt;
        text-align: center;
      }
      .title .book{
        position: relative;
        width: 100%; 
        margin-bottom: 5px;
      }
      .title .chapter{
        position: relative;
        float: left;
        margin-left: 46%;
        margin-bottom: 5px;
      }
      
      .button{
        cursor: pointer;
        border: 1px solid rgba(0, 0, 0, 0.1);
        background-color: #F5F5F5;
        font-family: arial,sans-serif;
        font-size: 11px;
        font-weight: bold;
        height: 29px;
        line-height: 27px;
        min-width: 54px;
        padding: 0 8px;
        text-align: center;
      }

      .comments{
        position: relative;
        float: left;
        width: 100%;
        left: 0;
        margin-top: 10px;
        margin-bottom: 20px;
        border-top: 1px solid rgba(0, 0, 0, 0.1);
      }
      .comment{
        position: relative;
        float: left;
        width: 100%;
        text-align: left;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
      }
      .index{
        position: relative;
        float: left;
        width: 100%;
        margin-top: 5px;
        font-size: 12px;
      }

      .index .user{
        font-size: 13px;
        padding: 0 15px;
      }
      .index .time{
        font-size: 13px;
        padding-left: 20px;
      }
      .index .floor{
        position: relative;
        float: right;
        margin-right: 200px;
      }
      .index .forbid{
        position: relative;
        float: right;
        margin-right: 250px;
      }
      .warn{
        color: red;
      }
      .content{
        position: relative;
        float: left;
        width: 80%;
        margin: 15px 0;
        padding: 5px;
        left: 10px;
      }
      .edit{
        position: relative;
        float: right;
      }
      #loadmsg{
        position: relative;
        float: left;
        width: 100%;
        margin-bottom: 10px;
        display: block;
      }
      .loadbt{
        position: relative;
        float: left;
        width: 100%;
        margin-bottom: 10px;
        display: block;
        margin-bottom: 100px;
        text-align: center;
      }
      #load{
        padding: 5px 20px;
        width: 200px;
        margin-left: auto;
        margin-right: auto;
      }

      table {
        font-size: 1em;
      }
      .ui-draggable, .ui-droppable {
        background-position: top;
      }

      label, input { display:block; }
      input.text { margin-bottom:12px; width:95%; padding: .4em; }
      fieldset { padding:0; border:0; margin-top:25px; }
      h1 { font-size: 1.2em; margin: .6em 0; }
      div#users-contain { width: 350px; margin: 20px 0; }
      div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
      div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
      .ui-dialog .ui-state-error {
        padding: .3em;
        position: fixed;
      }
      .validateTips { border: 1px solid transparent; padding: 0.3em; }

      .form{
        position: relative;
        float: left;
        width: 100%;
      }
      .form .input{
        position: relative;
        float: left;
        width: 100%;
        margin-top: 10px;
      }
      .form .input *{
        position: relative;
        float: left;
      }
      .form .input .desc{
        position: relative;
        float: left;
        width: 70px;
        font-size: 14px;
      }
      .contentEdit{
        border: 1px solid rgba(0, 0, 0, 0.1);
        margin:0;
        padding: 4px 6px 4px;
        text-align: left;
        font-size: 13px;
        font-family: arial,sans-serif;
      }
      #userName{
        width: 150px;
        min-height: 20px;
      }

      #content{
        width: 400px;
        min-height: 100px;
      }

      #updateUserName,#updateTime,#updateFloor{
        position: relative;
        float: left;
        width: 150px;
        min-height: 20px;
        margin-top: -5px;
      }
      #updateContent{
        position: relative;
        float: left;
        width: 400px;
        min-height: 100px;
        overflow-x: hidden;
        overflow-y: auto;
      }
      .form .input .remark{
        margin-left: 10px;
      }
      #save{
        position: relative;
        float: right;
        margin: 10px 0;
      }
    </style>

    <script type="text/javascript">
      $(function(){
        $("#load").click(function(event) {
          var pageNoVar = parseInt($("#load").attr("pageno"));
          var pageTotalVar = parseInt($("#load").attr("pasgetotal"));
          $("#loadmsg").css('display','block'); 
          if(pageNoVar < pageTotalVar){
            pageNoVar = pageNoVar + 1;
            $("#loadmsg").html("正在加载···");
            $.post(
                "pullComment",
                {
                  chapterId:${chapterVo.getSeqId()},
                  pageNo:pageNoVar,
                },
                function(data){
                  if(data.rtn == 0){
                    var arr=eval(data.data.list);
                    var htmlArr = new Array();
                    for(var i = 0; i < arr.length; i++){
                      var forbidHtml = "";
                      if(arr[i].forbid == true){
                        forbidHtml = "<span class=\"forbid warn\" isforbid=\"1\">屏蔽</span>";
                      }else{
                        forbidHtml = "<span class=\"forbid\" isforbid=\"0\">显示</span>";
                      }
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
                        htmlArr.push(html);
                    }
                    $(".comments").append(htmlArr.join(""));
                    $("#load").attr("pageNo",pageNoVar);
                    $("#loadmsg").html("加载完成");
                    $("#loadmsg").css('display','none'); 
                  }else{
                      $("#loadmsg").html("加载失败 请重试");
                      $("#loadmsg").css('display','none'); 
                  }
                },
                "json"
              );
          }else{
            $("#loadmsg").html("已经到最后");
            $("#loadmsg").animate({opacity: 1.0}, 2000).fadeOut("slow",function(){ 
               $("#loadmsg").css('display','none');
            });
          }
        });

        var userName = $( "#userName" ),
        content = $( "#content" ),

        allFields = $( [] ).add( userName ).add( content ),

        tips = $(".validateTips");
        //拖拽
        function updateTips(t) {
            tips.text(t).addClass("ui-state-highlight");
            setTimeout(function() {
              tips.removeClass( "ui-state-highlight", 1500 );
            }, 500 );
        }
        //更新字段提示
        function checkLength( o, n, min, max ) {
          if ( o.html().trim().length > max ||  o.html().trim().length < min ) {
            o.addClass( "ui-state-error" );
            updateTips( "Length of " + n + " must be between " +
              min + " and " + max + "." );
            return false;
          } else {
            return true;
          }
        }

        function checkRegexp( o, regexp, n ) {
          if (!( regexp.test(o.val()))) {
            o.addClass("ui-state-error");
            updateTips(n);
            return false;
          } else {
            return true;
          }
        }

        $(window).scroll(function () {
          $('.ui-dialog').css('position', "fixed");
        });

        $(".edit").click(function(event) {
          var cid = $(this).attr("cid");
          var content = $(this).prev().html();
          var index = $(this).prev().prev();
          var userName = $(index).children("span[class='user']").html();
          var time = $(index).children("span[class='time']").html();
          var floorNoText = $(index).children("span[class='floor']").html();
          var floorNo = $(index).children("span[class='floor']").attr("floorNo");
          var isforbid = parseInt($(index).children("span[class^='forbid']").attr("isforbid"));
          if(isforbid == 1){
            $("#forbid").prop("checked",'checked');
          }else{
            $("#forbid").removeAttr("checked");
          }
          $("#dialog-update").attr("cid",cid);
          $("#updateUserName").html(userName);
          $("#updateTime").html(time);
          $("#updateFloor").html(floorNoText);
          $("#updateFloor").attr("floorNo",floorNo);        
          $("#updateContent").html(content);
          $("#dialog-update").dialog("open");
        });

        $( "#dialog-update" ).dialog({
          autoOpen: false,
          height: 400,
          width: 600,
          modal: true,
          position:['center','top'],    // 赋值弹出坐标位置
          buttons: {
            "保存修改": function() {
              var bValid = true;
              allFields.removeClass( "ui-state-error" );
              bValid = bValid && checkLength($("#updateUserName"), "username", 3, 30 );
              
              var forbidText = 0;
              if($("#forbid").is(':checked') == true){
                forbidText = 1;
              }
              //验证字段合法性 如果不合法 则提示
              if ( bValid ) {
                //更新界面内容
                $.post(
                  "updateComment",
                  {
                    cid: $("#dialog-update").attr("cid"),
                    userName: $("#updateUserName").html(),
                    createTime:$("#updateTime").html(),
                    floorNo:$("#updateFloor").attr("floorNo"),
                    content:$("#updateContent").html(),
                    forbid:forbidText
                  },
                  function(data){
                    if(data.rtn == 0){
                      var forbidHtml = "";
                      if(data.data.forbid == true){
                        forbidHtml = "<span class=\"forbid warn\" isforbid=\"1\">屏蔽</span>";
                      }else{
                        forbidHtml = "<span class=\"forbid\" isforbid=\"0\">显示</span>";
                      }
                      var htmlText = "<div class=\"index\"><span class=\"user\">"
                        + data.data.userName
                        + "</span><span class=\"time\"> "
                        + data.data.createTime
                        + "</span><span class=\"floor\" floorno=\""+ data.data.floorNo +"\">"
                        + data.data.floorNo
                        + " 楼</span>" + forbidHtml + "</div><div class=\"content\">"
                        + data.data.content
                        + "</div><div class=\"button edit\" cid=\""
                        + data.data.seqId
                        + "\">修改</div>";
                        $("div[commentId="+ data.data.seqId + "]").html(htmlText);
                    }else{
                        $("#msg").html(data.data);
                    }
                  },
                  "json"
                );
                $(this).dialog("close");
              }
            },
            Cancel: function() {
              $(this).dialog("close");
            }
          },
          close: function() {
            allFields.val("").removeClass("ui-state-error");
          }
        });

        $( "#dialog-save" ).dialog({
          autoOpen: false,
          height: 400,
          width: 600,
          modal: true,
          position:['center','top'],    // 赋值弹出坐标位置
          buttons: {
            "添加": function() {
              var bValid = true;
              allFields.removeClass( "ui-state-error" );
              bValid = bValid && checkLength($("#userName"), "username", 3, 30 );
              bValid = bValid && checkLength($("#content"), "content", 1, 1000 );              
              var userNameText = $.trim($("#userName").text());
              var contentText = $.trim($("#content").text());
              //验证字段合法性 如果不合法 则提示
              if ( bValid ) {
                $.post(
                    "saveComment",
                    {
                      chapterId:${chapterVo.getSeqId()},
                      userName:userNameText,
                      content:contentText
                    },
                    function(data){
                      if(data.rtn == 0){
                        var html = "<div class=\"comment\" commentid=\""
                          + data.data.seqId
                          + "\"><div class=\"index\"><span class=\"user\">"
                          + data.data.userName
                          + "</span><span class=\"time\">"
                          + data.data.createTime
                          + "</span><span class=\"floor\">"
                          + data.data.floorNo
                          + " 楼</span><span class=\"forbid\" isforbid=\"0\">显示</span></div><div class=\"content\">"
                          + data.data.content
                          + "</div><div class=\"button edit\" cid=\""
                          + data.data.seqId
                          + "\">修改</div></div>";
                          $(".comments").prepend(html);
                      }else{
                          $("#msg").html(data.data);
                      }
                    },
                    "json"
                  );
                $(this).dialog("close");
              }
            },
            Cancel: function() {
              $(this).dialog("close");
            }
          },
          close: function() {
            allFields.val("").removeClass("ui-state-error");
          }
        });

        $("#save").click(function(event){
          $("#dialog-save").dialog("open");
        });

      });
    </script>
  </head>
	<body>
    <div id="dialog-update" title="修改评论" cid="0">
      <p class="validateTips"></p>
      <div class="form">
        <div class="input">
          <div class="desc">用户名</div>
          <div class="contentEdit" contenteditable="true" id="updateUserName"></div>
        </div>
        <div class="input">
          <div class="desc">评论时间</div>
          <div class="contentEdit" id="updateTime"></div>
        </div>
        <div class="input">
          <div class="desc">楼层</div>
          <div class="contentEdit" id="updateFloor" floorNo="0"></div>
        </div>
        <div class="input">
          <div class="desc">内  容</div>
          <div class="contentEdit" contenteditable="true" id="updateContent"></div>
        </div>
        <div class="input">
          <div class="desc">禁止</div>
          <input type="checkbox" id="forbid"><span class="remark">禁止后该评论对用户不可见</span>
        </div>
      </div>
    </div>

    <div id="dialog-save" title="添加评论" cid="0">
      <p class="validateTips"></p>
      <div class="form">
        <div class="input">
          <div class="desc">用户名</div>
          <div class="contentEdit" contenteditable="true" id="userName"></div>
        </div>
        <div class="input">
          <div class="desc">内  容</div>
          <div class="contentEdit" contenteditable="true" id="content"></div>
        </div>
        <div class="input">
          <div class="desc">禁止</div>
          <input type="checkbox" id="forbid"><span class="remark">禁止后该评论对用户不可见</span>
        </div>
      </div>
    </div>

    <div class="body">
      <div class="title">
        <div class="chapter">${bookVo.getBookName()} 第${chapterVo.getChapterNo()}章</div>
      </div>

      <div class="button" id="save">
        添加评论
      </div>

      <div id="msg" hidden="true">添加成功</div>
      <%
        Page<CommentVo> data = (Page<CommentVo>)request.getAttribute("page");
      %>
      <div class="comments">
        <%
          for(CommentVo commentVo:data.getList()){
            %>
              <div class="comment" commentid="<%=commentVo.getSeqId()%>">
                <div class="index">
                  <span class="user"><%=commentVo.getUserName()%></span>
                  <span class="time"><%=commentVo.getCreateTime()%></span>
                  <span class="floor" floorNo="<%=commentVo.getFloorNo()%>"><%=commentVo.getFloorNo()%> 楼</span>                  
                  <% if(commentVo.isForbid()){
                    %><span class="forbid warn" isforbid="1">屏蔽</span><%
                  }else{
                    %><span class="forbid" isforbid="0">显示</span><%
                  }
                  %>                  
                </div>
                <div class="content"><%=commentVo.getContent()%></div>
                <div class="button edit" cid="<%=commentVo.getSeqId()%>">
                  修改
                </div>
              </div>
            <%
          }
        %>
      </div>
      <div id="loadmsg">加载完成</div>
      <div class="loadbt">
        <div id="load" class="button" pagetotal="<%=data.getPageTotal()%>" pageno="<%=data.getPageNo()%>">加载更多</div>
      </div>
    </div>
	</body>
</html>
