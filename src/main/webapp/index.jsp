<%--
  Created by IntelliJ IDEA.
  User: tengda.wang
  Date: 2019/1/15
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css"
          href="ui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="ui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="ui/demo.css">
    <script type="text/javascript" src="js/page.js"></script>
    <script type="text/javascript" src="ui/jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="ui/jquery/jquery.easyui.min.js"></script>
</head>
<body>
<div class="easyui-layout" fit=true>
    <div data-options="region:'north',height:70"></div>
    <div
            data-options="region:'west',width:180,title:'管理系统',href:'menu.jsp'"></div>
    <div data-options="region:'south',height:60"></div>
    <div data-options="region:'center'">
        <div class="easyui-tabs" fit="true" id="desktop"></div>
    </div>
</div>
</body>

</html>
