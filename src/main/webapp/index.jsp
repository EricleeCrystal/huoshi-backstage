<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/ 
xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
	<head> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<title>Grid</title> 
	
	<link rel="stylesheet" type="text/css" href="static/css/ui-lightness/jquery-ui-1.8.2.custom.css"/> 
	<link rel="stylesheet" type="text/css" href="static/css/ui.jqgrid.css"/> 
	<script src="static/script/jquery.js" type="text/javascript"></script> 
	<script src="static/script/i18n/grid.locale-cn.js" type="text/javascript"></script> 
	<script src="static/script/jquery.jqGrid.min.js" type="text/javascript"></script> 
	<script type="text/javascript">
		$("#list").jqGrid({ 
		    caption: '评论列表', 
		    url:'server.php', 
		    datatype: "json", 
		       colNames:['编号','用户名','评论内容'], 
		       colModel:[ 
		        	{name:'seqId',index:'seqId', width:80,align:'center'}, 
		           	{name:'userName',index:'userName', width:180}, 
		           	{name:'content',index:'content', width:120}   
		       ], 
		       rowNum:10, 
		       rowList:[10,20,30], 
		       pager: '#pager', 
		       sortname: 'id', 
		    autowidth: true, 
		    height:280, 
		    viewrecords: true, 
		    multiselect: true, 
		    multiselectWidth: 25, 
		    sortable:true, 
		    sortorder: "asc" 
	 }); 
	</script>

	</head> 
	<body> 
		<table id="list"></table> 
		<div id="pager"></div> 
	</body> 
</html> 