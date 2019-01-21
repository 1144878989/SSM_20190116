<%--
  Created by IntelliJ IDEA.
  User: tengda.wang
  Date: 2019/1/17
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css"	href="ui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="ui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="ui/demo.css">
    <script type="text/javascript" src="js/page.js"></script>
    <script type="text/javascript" src="ui/jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="ui/jquery/jquery.easyui.min.js"></script>
</head>
<body>
<div class="easyui-layout" fit=true>
    <div data-options="region:'north',height:50">
    </div>
    <div data-options="region:'west',width:200" style="padding: 20px">
        <ul class="easyui-tree" id="airport_tree"
            data-options="url:'airport/getCityAirportTree.do',method:'get',animate:true,lines:true,onClick:myPortTreeClick">
        </ul>
    </div>
    <div data-options="region:'south',height:20"></div>
    <div data-options="region:'center'">
        <div style="margin: 20px 0;"></div>
        <input class="easyui-validatebox textbox" type="text" id="url_airport_id"value="1" hidden></input>
        <input class="easyui-validatebox textbox" type="text" id="cityName"placeholder="请输入要添加的城市名"></input>
        <input class="easyui-validatebox button" type="button" value="添加城市"	onclick="AddCity()"></input><br><br>

        <input class="easyui-validatebox button" type="button" value="添加机场"	onclick="AddPort()"></input>
        <br><br>
        <table id="terminal_datagrid" class="easyui-datagrid" title="Terminals"
               style="width: 820px; height: 270px"
               data-options="singleSelect:true,
				collapsible:true,
				rownumbers:true,
				url:'airport/getTerminalsOfAirport.do?airportNo=1',
				method:'get',
				pagination:true,
				pageList:[10],
				pageSize:10,
				loadFilter:pagerFilter,
				toolbar:terminal_toolbar
                ">
            <thead>
            <tr>
                <th data-options="field:'terminalName',width:80,halign:'center'">航站楼名称</th>
                <th data-options="field:'terminalAddress',width:180,halign:'center'">航站楼地址</th>
                <th data-options="field:'airportAddress',width:180,halign:'center'">机场地址</th>
                <th data-options="field:'_operate',width:80,align:'center',formatter:terminalOper">操作</th>
            </tr>
            </thead>
        </table>
        <div id="win_editTerminal" class="easyui-window" title="编辑航站楼"
             data-options="modal:true,iconCls:'icon-save',closed:true"
             style="width: 300px; height: 200px; padding: 10px; left: 544.5px; top: 194px;">
            <form id="ff_editTerminal" method="post" action="airport/updateTerminal.do">
                <table cellpadding="5">
                    <tr>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="terminalNo" data-options="required:true" hidden></input></td>
                    </tr>
                    <tr>
                        <td>航站楼名称:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="terminalName" ></input></td>
                    </tr>
                    <tr>
                        <td>航站楼地址:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="terminalAddress" ></input></td>
                    </tr>
                </table>
                <div style="text-align: center; padding: 20px">
                    <a href="javascript:void(0)" class="easyui-linkbutton"
                       onclick="editTerminal()">确认更改</a>
                </div>
            </form>
        </div>
        <div id="win_addAirport" class="easyui-window" title="添加机场"
             data-options="modal:true,iconCls:'icon-save',closed:true"
             style="width: 300px; height: 200px; padding: 10px; left: 544.5px; top: 194px;">

            <form id="ff_addAirport" method="post" action="airport/insertNewAirport.do">
                <table cellpadding="5">
                    <tr>
                        <td>所在城市:</td>
                        <td>  <input class="easyui-combobox" id="cityNo"name="cityNo"
                                     data-options="valueField:'id',textField:'text',url:'airport/getCityList.do'"></input></td>
                    </tr>
                    <tr>
                        <td>机场名称 :</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="airportName" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>机场地址 :</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="airportAddress" data-options="required:true"></input></td>
                    </tr>
                </table>
                <div style="text-align: center; padding: 20px">
                    <a href="javascript:void(0)" class="easyui-linkbutton"
                       onclick="addAirport()">确认添加</a>
                </div>
            </form>
        </div>
        <div id="win_addTerminal" class="easyui-window" title="添加航站楼"
             data-options="modal:true,iconCls:'icon-save',closed:true"
             style="width: 300px; height: 200px; padding: 10px; left: 544.5px; top: 194px;">
            <form id="ff_addTerminal" method="post" action="airport/insertNewTerminal.do">
                <table cellpadding="5">
                    <tr>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="airportNo" data-options="required:true" hidden></input></td>
                    </tr>
                    <tr>
                        <td>航站楼名称:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="terminalName" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>航站楼地址:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="terminalAddress" data-options="required:true"></input></td>
                    </tr>
                </table>
                <div style="text-align: center; padding: 20px">
                    <a href="javascript:void(0)" class="easyui-linkbutton"
                       onclick="addTerminal()">确认添加</a>
                </div>
            </form>
        </div>

    </div>
</div>
<script type="text/javascript">
    var terminal_toolbar=[{
        text:'Add',
        iconCls:'icon-add',
        handler:function(){
            var airportNo=$('#url_airport_id').val();
            $('#ff_addTerminal').form('load', {
                airportNo:airportNo
            });
            $("#win_addTerminal").window("open");
        }
    }]
    function addTerminal() {//添加航站楼
        $('#ff_addTerminal').form('submit', {
            success : function(data) {
                if (data.indexOf('terminalInsertOk') >= 0) {
                    alert("添加成功");
                    $('#win_addTerminal').window('close');
                    terminalDatagridReload();
                } else {
                    alert("更改失败，失败原因"+data);
                }
            }
        });
    }
    function addAirport() {//添加机场
        $('#ff_addAirport').form('submit', {
            success : function(data) {
                if (data.indexOf('airportInsertOk') >= 0) {
                    alert("添加成功");
                    $('#win_addAirport').window('close');
                    $("#airport_tree").tree('reload');
                    terminalDatagridReload();
                } else {
                    alert("添加失败，失败原因"+data);
                }
            }
        });
    }
    function editTerminal() {//修改航站楼
        $('#ff_editTerminal').form('submit', {
            success : function(data) {
                if (data.indexOf('terminalUpdateOk') >= 0) {
                    alert("更改成功");
                    $('#win_editTerminal').window('close');
                    terminalDatagridReload();
                } else {
                    alert("更改失败，失败原因"+data);
                }
            }
        });
    }
    function editTer(terminalNo) {//编辑航站楼信息
        //alert(terminalNo);
        $.ajax({
            url : "airport/selectByPrimaryKey.do?terminalNo=" + terminalNo,
            type : 'post',
            async : true, //异步
            error : function() {
                alert('error');
            },
            success : function(jsonData) {
                $('#ff_editTerminal').form('load', {
                    terminalNo : jsonData.terminalNo,
                    terminalName : jsonData.terminalName,
                    terminalAddress : jsonData.terminalAddress
                });
                $("#win_editTerminal").window("open");
            }
        });
    }
    function AddCity() {//添加城市

        var cityName=$("#cityName").val();
        /*alert(cityName);*/
        $.ajax({
            url : "airport/insertNewCity.do?"+"cityName="+cityName,
            type : 'post',
            async : true, //异步
            error : function() {
                alert("error");
            },
            success : function(jsonData) {
                if(jsonData.indexOf("cityExist")>=0){
                    alert("该城市已存在");
                }
                if(jsonData.indexOf("cityEmptyError")>=0){
                    alert("输入了空的城市名");
                }
                if(jsonData.indexOf("airportNullPoint")>=0){
                    alert("请输入城市名");
                }
                if(jsonData.indexOf("cityInsertOk")>=0){
                    $("#airport_tree").tree('reload');
                    terminalDatagridReload();
                    $("#cityId").combobox('reload');
                }
            }
        });
    }
    function AddPort(){//添加机场
        $("#cityId").combobox("clear");
        $("#win_addAirport").window("open");
    }
    function terminalOper(value, row, index) {
        return '<input class="easyui-validatebox button" type="button" value="编辑" ' +
            'onclick="editTer('+ row.terminalNo + ')" >';
    }
    function terminalDatagridReload(){//刷新航站楼表格数据
        /*alert($('#url_airport_id').val());*/
        var url = "airport/getTerminalsOfAirport.do?airportNo="+$('#url_airport_id').val();
        /*alert(url);*/
        $.ajax({
            url : url,
            type : 'post',
            async : true, //异步
            error : function() {
                alert('error');
            },
            success : function(jsonData) {
                $('#terminal_datagrid').datagrid('loadData', {
                    'total' : eval(jsonData).length,
                    rows : jsonData
                });
            }
        });
    }
    function myPortTreeClick(node) {/*点击机场节点后，表格刷新成该机场的所有航站楼*/
        var url = "airport/getTerminalsOfAirport.do?";
        if (node.attributes != "city") {
            if(node.attributes=="airport"){
                url = url + "airportNo=" + node.id;
                $('#url_airport_id').val(node.id);
                $.ajax({
                    url : url,
                    type : 'post',
                    async : true, //异步
                    error : function() {
                        alert('error');
                    },
                    success : function(jsonData) {
                        $('#terminal_datagrid').datagrid('loadData', {
                            'total' : eval(jsonData).length,
                            rows : jsonData
                        });
                    }
                });
            }
        }
    }
</script>
</body>
</html>