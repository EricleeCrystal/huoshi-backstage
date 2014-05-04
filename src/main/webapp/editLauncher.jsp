<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>启动图片管理</title>
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
        margin-left: 5%;
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
        margin-top: 5px;
        margin-bottom: 5px;
        width: 150px;
      }
      select, input{
        width: 180px;
      }
      .exceed, .valid{
        width:180px;
      }
      .exceed *, .valid *{
        float: left;
        position: relative;
      }
      .exceed tt, .valid tt{
        margin-left: 10px;

      }
      .exceed input, .valid input{
        width: 20px;
      }

      .save{
        width: 80px;
        margin-top: 30px;
        margin-left: 150px;
      }
      #preview{
        border:1px solid #000;
        overflow:hidden;
        width: 400px;
        height: 400px;
        text-align: center;
        vertical-align: center;
      }
      #imgArea{
        display: block;
        max-width: 400px;
        max-height: 400px;
        margin: auto 0;
      }
      #msg{
        height: 50px;
        margin-top: 10px;
        margin-bottom: 10px;
        color: red;
      }
    </style>
      <%
        int sort = ((Integer)request.getAttribute("sort")).intValue();
        int pageNo = ((Integer)request.getAttribute("pageNo")).intValue();
        int pageSize = ((Integer)request.getAttribute("pageSize")).intValue();
        int seqId = 0;
        Integer seqIdObj = (Integer)request.getAttribute("seqId");
        if(seqIdObj != null){
          seqId = seqIdObj.intValue();
        }
        int mode = 1;
        Integer modeObj = (Integer)request.getAttribute("mode");
        if(modeObj != null){
          mode = modeObj.intValue();
          if(mode < 1 || mode > 3){
            mode = 1;
          }
        }
        String title = (String)request.getAttribute("title");
        if(title == null){
          title = "";
        }else{
          title = title.trim();
        }
        String source = (String)request.getAttribute("source");
        if(source == null){
          source = "";
        }else{
          source = source.trim();
        }
        String image = (String)request.getAttribute("image");
        if(image == null){
          image = "";
        }else{
          image = image.trim();
        }        
        String revealDate = (String)request.getAttribute("revealDate");
        if(revealDate == null){
          revealDate = "";
        }else{
          revealDate = revealDate.trim();
        }
        int exceed = 0;
        Integer exceedObj = (Integer)request.getAttribute("exceed");
        if(exceedObj != null){
          exceed = exceedObj.intValue();
          if(exceed < 0){
            exceed = 0;
          }else if(exceed > 1){
            exceed = 1;
          }
        }
        int valid = 0;
        Integer validObj = (Integer)request.getAttribute("valid");
        if(validObj != null){
          valid = validObj.intValue();
          if(valid < 0){
            valid = 0;
          }else if(valid > 1){
            valid = 1;
          }
        }        
        String bgcolor = (String)request.getAttribute("bgcolor");
        if(bgcolor == null){
          bgcolor = "";
        }else{
          bgcolor = bgcolor.trim();
        }
        String msg = (String)request.getAttribute("msg");
        if(msg == null){
          msg = "";
        }else{
          msg = msg.trim();
        }        
      %>
    <script type="text/javascript">
      $(function(){
        function previewImage(file){
          var MAXWIDTH  = 400;
          var MAXHEIGHT = 400;
          var div = document.getElementById('preview');
          if (file.files && file.files[0]){
            div.innerHTML = "<img id='imgArea'>";
            var img = document.getElementById('imgArea');
            img.onload = function(){
              var rect = reSize(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
              img.width = rect.width;
              img.height = rect.height;
              img.style.marginLeft = rect.left+'px';
              img.style.marginTop = rect.top+'px';
              if(img.width == MAXWIDTH){
                $("#imgArea").css("border-left",'solid 2px red');
              }else{
                $("#imgArea").css("border-top",'solid 2px red');
              }
            }
            var reader = new FileReader();
            reader.onload = function(evt){
              img.src = evt.target.result;
            }
            reader.readAsDataURL(file.files[0]);
            img.style.display= "block";
          }else{
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = "<img id='imgArea'>";
            var img = document.getElementById('imgArea');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = reSize(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id='imgArea' style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;margin-left:"+rect.left+"px;"+sFilter+src+"\"'></div>";
          }
        }
        
        function reSize(maxWidth, maxHeight, width, height){
          var param = {top:0, left:0, width:width, height:height};
          if( width > maxWidth || height > maxHeight ){
              rateWidth = width / maxWidth;
              rateHeight = height / maxHeight;
              if( rateWidth > rateHeight ) {
                param.width =  maxWidth;
                param.height = Math.round(height / rateWidth);
              }else {
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;                
              }
          }
          param.left = Math.round((maxWidth - param.width) / 2);  
          param.top = Math.round((maxHeight - param.height) / 2);  
          return param;  
        }

        $("#uploadImage").change(function(event) {
          previewImage(this);
        });
        $("#bgcolor").on('input',function(event){
          var bgcolor = $(this).val();
          $("#preview").css("background-color",'#'+bgcolor+'');
        });
        function init(){
          //将原有信息填充
          $("option[value='<%=mode%>']").attr("selected","selected");
          $("input[name='title']").attr("value", "<%=title%>");
          $("input[name='source']").attr("value", "<%=source%>");
          $("input[name='bgcolor']").attr("value", "<%=bgcolor%>");
          $("#preview").css("background-color",'#<%=bgcolor%>');
          $("input[name='revealDate']").attr("value", "<%=revealDate%>");
          $("input[name='exceed'][value='<%=exceed%>']").attr("checked", "true");
          $("input[name='valid'][value='<%=valid%>']").attr("checked", "true");
          $("#msg").html("<%=msg%>");          
        }
        init();
      });
    </script>

  </head>

  <body>
    <div class="body">
      <div class="title">启动页添加</div>

      <form action="modifyLauncher" method="post" enctype="multipart/form-data">
          <div id="msg">错误消息</div>
          <input type="hidden" name="seqId" value="<%=seqId%>">
          <input type="hidden" name="pageNo" value="<%=pageNo%>">          
          <input type="hidden" name="pageSize" value="<%=pageSize%>">
          <input type="hidden" name="sort" value="<%=sort%>">
          <div><span>模&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;式</span>
            <select name="mode">
              <option value="1">图片模式</option>
              <option value="2">文字模式</option>
              <option value="3">图文组合模式</option>
            </select>
          </div>
          <div>
            <span>标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题</span>
            <input type="text" name="title"/>
          </div>
          <div>
            <span>来&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;源</span>
            <input type="text" name="source"/>
          </div>
          <div>
            <span>背&nbsp;景&nbsp;色 6位数字</span>
            <input id="bgcolor" type="text" name="bgcolor" maxlength="6"/>
          </div>
          <div>
            <span>展&nbsp;示&nbsp;日&nbsp;期&nbsp;yyyy-MM-dd</span>
            <input type="text" name="revealDate"/>
          </div>
          <div>
            <span>延&nbsp;&nbsp;&nbsp;&nbsp;期&nbsp;&nbsp;&nbsp;&nbsp;显&nbsp;&nbsp;&nbsp;&nbsp;示</span>
              <div  class="exceed">
                <tt>是</tt><input type="radio" name="exceed" value="1" checked="true"/>
                <tt>否</tt><input type="radio" name="exceed" value="0"/>
              </div>
          </div>
          <div>
            <span>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态</span>
              <div  class="valid">
                <tt>有效</tt><input type="radio" name="valid" value="1" checked="true"/>
                <tt>无效</tt><input type="radio" name="valid" value="0"/>
              </div>
          </div>          
          <div>
            <span>图&nbsp;片&nbsp;1280X720</span>
            <input id="uploadImage" type="file" name="image"/>
          </div>
          <div>
            <input class="save" type="submit" value="保存修改"/>
          </div>
      </form>

      <div id="preview">
        <img id="imgArea" src="<%=image%>"/>
      </div>
    </div>
  </body>
</html>
