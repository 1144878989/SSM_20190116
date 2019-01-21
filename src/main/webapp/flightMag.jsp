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
        <ul class="easyui-tree" id="airline_tree"
            data-options="url:'flight/getAirlineTree.do',method:'get',animate:true,lines:true,onClick:myAirlineTreeClick">
        </ul>
    </div>
    <div data-options="region:'south',height:20"></div>
    <div data-options="region:'center'">
        <div style="margin: 20px 0;"></div>
        <input class="easyui-validatebox textbox" type="text" id="url_airline_id"value="1" hidden></input>
        <input class="easyui-validatebox textbox" type="text" id="airlineName"placeholder="请输入要添加的航空公司名"></input>
        <input class="easyui-validatebox button" type="button" value="添加航空公司"	onclick="AddAirline()"></input><br><br>
        <table id="flight_datagrid" class="easyui-datagrid" title="Flights"
               style="width: 840px; height: 270px"
               data-options="singleSelect:true,
				collapsible:true,
				rownumbers:true,
				url:'flight/getFlightsOfAirline.do?airlineNo=1',
				method:'get',
				pagination:true,
				pageList:[10],
				pageSize:10,
				loadFilter:pagerFilter,
				toolbar:flight_toolbar
                ">
            <thead>
            <tr>
                <th data-options="field:'flightCode',width:80,halign:'center'">航班编号</th>
                <th data-options="field:'flightTakeoffTime',width:80,halign:'center'">飞机起飞时间</th>
                <th data-options="field:'flightLandTime',width:80,halign:'center'">飞机降落时间</th>
                <th data-options="field:'flightTime',width:80,halign:'center'">飞行时间（分钟数）</th>
                <th data-options="field:'flightTakeoffPortName',width:80,halign:'center'">起飞航站楼</th>
                <th data-options="field:'flightLandPortName',width:80,halign:'center'">降落航站楼</th>
                <th data-options="field:'flightFaremoney',width:80,halign:'center'">航班公示价格</th>
                <th data-options="field:'canFly',width:80,halign:'center'">是否可飞</th>
                <th data-options="field:'_operate',width:180,align:'center',formatter:flightOper">操作</th>
            </tr>
            </thead>
        </table>
        <div id="win_editFlight" class="easyui-window" title="编辑航班"
             data-options="modal:true,iconCls:'icon-save',closed:true"
             style="width: 400px; height: 300px; padding: 10px; left: 544.5px; top: 194px;">
            <form id="ff_editFlight" method="post" action="flight/updateFlight.do">
                <table cellpadding="5">
                    <tr>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="flightNo" data-options="required:true" hidden></input></td>
                    </tr>
                    <tr>
                        <td>航班编号:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="flightCode" ></input></td>
                    </tr>
                    <tr>
                        <td>起飞时间:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="flightTakeoffTime" ></input></td>
                    </tr>
                    <tr>
                        <td>降落时间:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="flightLandTime" ></input></td>
                    </tr>
                    <tr>
                        <td>飞行时间（分钟数）:</td>
                        <td><input class="easyui-validatebox textbox" type="number"
                                   name="flightTime" ></input></td>
                    </tr>
                    <tr>
                        <td>航班公示价格:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="flightFaremoney" ></input></td>
                    </tr>
                </table>
                <div style="text-align: center; padding: 20px">
                    <a href="javascript:void(0)" class="easyui-linkbutton"
                       onclick="editFlight()">确认更改</a>
                </div>
            </form>
        </div>
        <div id="win_addFlight" class="easyui-window" title="添加航班"
             data-options="modal:true,iconCls:'icon-save',closed:true"
             style="width: 300px; height: 400px; padding: 10px; left: 544.5px; top: 194px;">
            <form id="ff_addFlight" method="post" action="flight/insertNewFlight.do">
                <table cellpadding="5">
                    <tr>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="airlineNo" data-options="required:true" hidden></input></td>
                    </tr>
                    <tr>
                        <td>航班号:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="flightCode" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>航班起飞时间:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="flightTakeoffTime" data-options="required:true"></input></td>
                    </tr>

                    <tr>
                        <td>起飞航站台:</td>
                        <td>  <input class="easyui-combobox" id="flightTakeoffPort"name="flightTakeoffPort"
                                     data-options="valueField:'id',textField:'text',url:'airport/getTerminalTree.do'"></input></td>
                    </tr>


                    <tr>
                        <td>航班降落时间:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="flightLandTime" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>降落航站台:</td>
                        <td>  <input class="easyui-combobox" id="flightLandPort"name="flightLandPort"
                                     data-options="valueField:'id',textField:'text',url:'airport/getTerminalTree.do'"></input></td>
                    </tr>
                    <tr>
                        <td>航班飞行时间（分钟数）:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="flightTime" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>航班公示价格:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="flightFaremoney" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>航班是否可用:</td>
                        <td><input class="easyui-validatebox textbox" type="checkbox"
                                   name="canFly" data-options="required:true"></input></td>
                    </tr>
                </table>
                <div style="text-align: center; padding: 20px">
                    <a href="javascript:void(0)" class="easyui-linkbutton"
                       onclick="addFlight()">确认添加</a>
                </div>
            </form>
        </div>

    </div>
</div>
<script type="text/javascript">
    var flight_toolbar=[{
        text:'Add',
        iconCls:'icon-add',
        handler:function(){
            var airlineNo=$('#url_airline_id').val();
            //alert(airlineNo)
            $('#ff_addFlight').form('load', {
                airlineNo:airlineNo
            });
            $("#win_addFlight").window("open");
        }
    }]
    function addFlight() {//添加航班
        $('#ff_addFlight').form('submit', {
            success : function(data) {
                if (data.indexOf('flightInsertOk') >= 0) {
                    alert("添加成功");
                    $('#win_addFlight').window('close');
                    flightDatagridReload();
                } else {
                    alert("更改失败，失败原因"+data);
                }
            }
        });
    }
    function editFlight() {//修改航班
        $('#ff_editFlight').form('submit', {
            success : function(data) {
                if (data.indexOf('flightUpdateOk') >= 0) {
                    alert("更改成功");
                    $('#win_editFlight').window('close');
                    flightDatagridReload();
                } else {
                    alert("更改失败，失败原因"+data);
                }
            }
        });
    }
    function editCanFly(FlightNo,CanFly) {
        var canFly=!CanFly;
        //alert(FlightNo);
        //alert(canFly);
        $.ajax({
            url : "flight/updateFlight.do?flightNo=" + FlightNo+"&&canFly="+canFly,
            type : 'post',
            async : true, //异步
            error : function() {
                alert('error');
            },
            success : function(data) {
                if (data.indexOf('flightUpdateOk') >= 0) {
                alert("更改成功");
                flightDatagridReload();
                } else {
                    alert("更改失败，失败原因"+data);
                }
            }
        });
    }
    function editFli(FlightNo) {//打开编辑航班窗口
        //alert(FlightNo);
        $.ajax({
            url : "flight/selectByPrimaryKey.do?flightNo=" + FlightNo,
            type : 'post',
            async : true, //异步
            error : function() {
                alert('error');
            },
            success : function(jsonData) {
                //alert(jsonData.flightTime);
                $('#ff_editFlight').form('load', {
                    flightNo : jsonData.flightNo,
                    flightCode:jsonData.flightCode,
                    flightTakeoffTime : jsonData.flightTakeoffTime,
                    flightLandTime : jsonData.flightLandTime,
                    flightTime : jsonData.flightTime,
                    flightFaremoney : jsonData.flightFaremoney
                });
                $("#win_editFlight").window("open");
            }
        });
    }
    function AddAirline() {//添加航空公司

        var airlineName=$("#airlineName").val();
        //alert(airlineName);
        $.ajax({
            url : "flight/insertNewAirline.do?"+"airlineName="+airlineName,
            type : 'post',
            async : true, //异步
            error : function() {
                alert("error");
            },
            success : function(jsonData) {
                if(jsonData.indexOf("airlineInsertOk")>=0){
                    alert("添加成功");
                    $("#airline_tree").tree('reload');
                    flightDatagridReload();
                }else{
                    alert("添加失败"+jsonData);
                }
            }
        });
    }
    function flightOper(value, row, index) {
        if(row.canFly!=false){
            return '<input class="easyui-validatebox button" type="button" value="编辑" ' +
                'onclick="editFli('+ row.flightNo + ')" >'+
                '<input class="easyui-validatebox button" type="button" value="取消该航班" ' +
                'onclick="editCanFly('+ row.flightNo+','+row.canFly + ')" >';
        }else{
            return '<input class="easyui-validatebox button" type="button" value="编辑" ' +
                'onclick="editFli('+ row.flightNo + ')" >'+
                '<input class="easyui-validatebox button" type="button" value="启用该航班" ' +
                'onclick="editCanFly('+ row.flightNo+','+row.canFly + ')" >';
        }

    }
    function flightDatagridReload(){//刷新航班表格数据
        /*alert($('#url_airport_id').val());*/
        var url = "flight/getFlightsOfAirline.do?airlineNo="+$('#url_airline_id').val();
        /*alert(url);*/
        $.ajax({
            url : url,
            type : 'post',
            async : true, //异步
            error : function() {
                alert('error');
            },
            success : function(jsonData) {
                $('#flight_datagrid').datagrid('loadData', {
                    'total' : eval(jsonData).length,
                    rows : jsonData
                });
            }
        });
    }
    function myAirlineTreeClick(node) {/*点击机场节点后，表格刷新成该机场的所有航站楼*/
        var url = "flight/getFlightsOfAirline.do?";
        url = url + "airlineNo=" + node.id;
        $('#url_airline_id').val(node.id);
        $.ajax({
            url : url,
            type : 'post',
            async : true, //异步
            error : function() {
                alert('error');
            },
            success : function(jsonData) {
                $('#flight_datagrid').datagrid('loadData', {
                    'total' : eval(jsonData).length,
                    rows : jsonData
                });
            }
        });
    }
</script>
</body>
</html>