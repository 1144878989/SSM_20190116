<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="ui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="ui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="ui/demo.css">
<script type="text/javascript" src="ui/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="ui/jquery/jquery.easyui.min.js"></script>
</head>
<body>
<ul class="easyui-tree" data-options="url:'menu.json',onClick:myTreeClick"></ul>
<script type="text/javascript">
function myTreeClick(node){
	//添加tabs页;
     if ($("#desktop").tabs('exists',node.text)){
     	 var tab=$("#desktop").tabs('getTab',node.text);
    	 $("#desktop").tabs("update",{
    		 tab: tab,
   			options: {
   				title:node.text,
   	 			href:node.attributes,
   	 			closable:true
   			}
 		});
        $("#desktop").tabs('select', node.text);
    }else{
    	if(node.attributes!=null){
    		$("#desktop").tabs("add",{
    			title:node.text,
    			href:node.attributes,
    			closable:true
    		});
    	}
    }
}
</script>
</body>
</html>