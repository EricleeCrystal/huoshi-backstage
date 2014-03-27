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
    <script type="text/javascript" src="static/script/comment.js"></script>

    <script type="text/javascript">
      $(function(){
        // 加载更多按钮
        $("#load").click(function(event) {
          var lastCid = parseInt($(".comments>.comment:last-child").attr("commentid"));
          var pageTotalVar = parseInt($("#load").attr("pagetotal"));
          $("#loadmsg").css('display','block'); 
          if(pageTotalVar > 1){
            $("#loadmsg").html("正在加载···");
            $.post(
                "pullComment",
                {
                  cid:lastCid,
                  bookId:${bookVo.getSeqId()},
                  chapterNo:${chapterVo.getChapterNo()},
                  refId:1
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
                        + arr[i].nickName
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
                    $("#load").attr("pagetotal",pageTotalVar);
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
            // 已经全部加载完成了
            $("#loadmsg").html("已经到最后");
            $("#loadmsg").animate({opacity: 1.0}, 2000).fadeOut("slow",function(){ 
               $("#loadmsg").css('display','none');
            });
          }
        });

        // 页面上下滚动时 浮框保持不动
        $(window).scroll(function () {
          $('.ui-dialog').css('position', "fixed");
        });

        function parseContent(content){
          //去掉html标签 将空格和回车换成相应字符
          var contentText = content.replace(/<[^>]+>/g,"").replace(/(\r)*\n/g,"<br>").replace(/\s/g,"&nbsp;");
          return contentText;
        }

        // 添加评论
        var userName = $("#userName"),
        content = $("#content"),
        allSaveFields = $([]).add(userName).add(content),
        saveTips = $(".saveValidateTips");
        //错误提示
        function updateSaveTips(t) {
            saveTips.text(t).addClass("ui-state-highlight");
            setTimeout(function() {
              saveTips.removeClass( "ui-state-highlight", 1500 );
            }, 500 );
        }
        //更新字段提示
        function checkSaveLength( o, n, min, max ) {
          if ( o.val().trim().length > max ||  o.val().trim().length < min ) {
            o.addClass( "ui-state-error" );
            updateSaveTips( "Length of " + n + " must be between " +
              min + " and " + max + "." );
            return false;
          } else {
            return true;
          }
        }

        function checkSaveRegexp( o, regexp, n ) {
          if (!( regexp.test(o.val()))) {
            o.addClass("ui-state-error");
            updateSaveTips(n);
            return false;
          } else {
            return true;
          }
        }


        $( "#dialog-save" ).dialog({
          autoOpen: false,
          height: 300,
          width: 600,
          modal: true,
          position:['center','top'],    // 赋值弹出坐标位置
          buttons: {
            "添加": function() {
              var bValid = true;
              allSaveFields.removeClass( "ui-state-error" );
              bValid = bValid && checkSaveLength(userName, "username", 3, 30 );       
              var userNameText = $.trim($("#userName").val());
              var contentText = $.trim($("#content").val());
              //验证字段合法性 如果不合法 则提示
              if ( bValid ) {
                //去掉html标签
                //contentText = parseContent(contentText);
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
            allSaveFields.val("").removeClass("ui-state-error");
          }
        });

        $("#save").click(function(event){
          $("#dialog-save").dialog("open");
        });

        //更新评论操作
        var updateUserName = $("#updateUserName"),
        updateContent = $("#updateContent"),
        allUpdateFields = $([]).add(updateUserName),
        updateTips = $(".updateValidateTips");
        //错误提示
        function updateTips(t) {
            updateTips.text(t).addClass("ui-state-highlight");
            setTimeout(function() {
              updateTips.removeClass( "ui-state-highlight", 1500 );
            }, 500 );
        }
        function checkUpdateLength( o, n, min, max ) {
          if ( o.val().trim().length > max ||  o.val().trim().length < min ) {
            o.addClass( "ui-state-error" );
            updateSaveTips( "Length of " + n + " must be between " +
              min + " and " + max + "." );
            return false;
          } else {
            return true;
          }
        }
        
        $('body div.edit').on('click', function(event) {
          console.log(2);
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
          $("#updateUserName").val(userName);
          $("#updateTime").html(time);
          $("#updateFloor").html(floorNoText);
          $("#updateFloor").attr("floorNo",floorNo);        
          $("#updateContent").val(content);

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
              allUpdateFields.removeClass( "ui-state-error" );
              bValid = bValid && checkUpdateLength($("#updateUserName"), "username", 3, 30 );
              var userNameText = $("#updateUserName").val();
              var contentText = $("#updateContent").val();
              //contentText = parseContent(contentText);

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
                    userName: userNameText,
                    createTime:$("#updateTime").html(),
                    floorNo:$("#updateFloor").attr("floorNo"),
                    content:contentText,
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
            updateTips.val("").removeClass("ui-state-error");
          }
        });


      });
    </script>
  </head>
	<body>
    <div id="dialog-save" title="添加评论" cid="0">
      <p class="saveValidateTips"></p>
      <div class="form">
        <div class="input">
          <div class="desc">用户名</div>
          <input class="contentEdit" id="userName">
        </div>
        <div class="input">
          <div class="desc">内  容</div>
          <textarea class="contentEdit" id="content"></textarea>
        </div>
      </div>
    </div>

    <div id="dialog-update" title="修改评论" cid="0">
      <p class="updateValidateTips"></p>
      <div class="form">
        <div class="input">
          <div class="desc">用户名</div>
          <input class="contentEdit" id="updateUserName">
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
          <textarea class="contentEdit" id="updateContent"></textarea>
        </div>
        <div class="input">
          <div class="desc">禁止</div>
          <input type="checkbox" id="forbid"><span class="remark">禁止后该评论对用户不可见</span>
        </div>
      </div>
    </div>

    <div class="body">
      <div class="title">
        <div class="chapter">${bookVo.getBookName()} <br> 第${chapterVo.getChapterNo()}章</div>
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
                  <span class="user"><%=commentVo.getNickName()%></span>
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
        <!-- 这里不能用pageNo来完成分页 需要用最后一个id来实现动态加载 -->
        <div id="load" class="button" pagetotal="<%=data.getPageTotal()%>">加载更多</div>
      </div>
    </div>
	</body>
</html>
