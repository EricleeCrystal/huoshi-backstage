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
  	<title>${bookVo.getBookName()} 第${chapterVo.getChapterNo()}章</title>
    <meta charset="UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" href="static/css/jquery.ui.all.css">
    <link rel="stylesheet" href="static/css/base.css">
    <link rel="stylesheet" href="static/css/section.css">

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
        // 页面上下滚动时 浮框保持不动
        $(window).scroll(function () {
          $('.ui-dialog').css('position', "fixed");
        });

        $('.section').on('click', '.edit', function(event) {
          var section = $(this).parent();
          var sid = $(section).attr("sid");
          var text = $(section).children("div[class='text']");
          var sectionText = text.children("div[class='sectionText']").children("div").html();
          var noteText = text.children("div[class='sectionNote']").children("div").html();
          if(noteText == "暂无注释"){
            noteText = "";
          }
          $("#dialog-update").attr("sid",sid);
          $("#updateSection").val(sectionText);
          $("#updateNote").val(noteText);
          $("#dialog-update").dialog("open");
        });

        $( "#dialog-update" ).dialog({
          autoOpen: false,
          height: 350,
          width: 600,
          modal: true,
          position:['center','top'],
          buttons: {
            "保存修改": function() {
              var sid = $("#dialog-update").attr("sid");
              var sectionText = $("#updateSection").val();
              var sectionNote = $("#updateNote").val();
              //更新界面内容
              $.post(
                "modifySection",
                {
                  sid:sid,
                  section:sectionText,
                  note:sectionNote
                },
                function(data){
                  if(data.rtn == 0){
                    var text = $(".section[sid='" + sid + "']").children("div[class='text']");
                    text.children("div[class='sectionText']").children("div").html(data.data.zhSection);
                    if(data.data.zhSection.length == 0){
                      sectionNote = "暂无注释"
                    }
                    text.children("div[class='sectionNote']").children("div").html(sectionNote);
                  }else{
                      $("#msg").html(data.data);
                  }
                },
                "json"
              );
              $(this).dialog("close");
            },
            Cancel: function() {
              $(this).dialog("close");
            }
          },
          close: function() {
          }
        });
      });
    </script>
  	</head>
  	<body>
       <div id="dialog-update" title="修改" sid="0">
        <div class="form">
          <div class="input">
            <div class="desc">经 文</div>
            <textarea class="contentEdit" id="updateSection"></textarea>
          </div>
          <div class="input">
            <div class="desc">注 释</div>
            <textarea class="contentEdit" id="updateNote"></textarea>
          </div>
        </div>
      </div>

      <div class="body">
        <div class="title">
            <div class="chapter">${bookVo.getBookName()} 第${chapterVo.getChapterNo()}章</div>
            <div><a href="./comment?chapterId=${chapterVo.getSeqId()}">评论</a></div>
        </div>
        
        <div id="msg" hidden="true">修改成功</div>
        
        <div class="sections">
        <%
          List<SectionVo>sectionVoList = (List<SectionVo>)request.getAttribute("sectionVoList");
          for(SectionVo sectionVo:sectionVoList){
            %>
              <div class="section" sid="<%=sectionVo.getSeqId()%>">
                <%
                  if(sectionVo.getTitle()==1){//主标题
                      %>
                        <div class="sectionTitle"><%=sectionVo.getZhSection()%></div>
                      <%
                  }else if(sectionVo.getTitle()==2){//副标题
                      %>
                        <div class="sectionTitle"><%=sectionVo.getZhSection()%></div>
                      <%
                  }else{//内容
                      %>
                      <div class="sectionNo"><%=sectionVo.getSectionNo()%></div>
                      <div class="text">
                        <div class="sectionText">
                          <span>经文</span>
                          <div><%=sectionVo.getZhSection()%></div>
                        </div>
                        <div class="sectionNote">
                          <span>注释</span>
                          <%
                            if(sectionVo.getZhNote().length() == 0){
                              %><div class="empty">暂无注释</div><%
                            }else{
                              %><div><%=sectionVo.getZhNote()%></div><%
                            }
                          %>
                        </div>

                      </div>
                      <div class="button edit">修改</div>
                      <%
                  }
                %>
              </div>
            <%
          }
        %>
        </div>
      </div>
  	</body>
</html>
