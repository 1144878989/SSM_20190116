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
    <div data-options="region:'west',width:50" style="padding: 10px">
    </div>
    <div data-options="region:'center'">
        <div style="margin: 20px 0;"></div>
        <table id="ticket_datagrid" class="easyui-datagrid" title="Tickets"
               style="width: 840px; height: 270px"
               data-options="singleSelect:true,
				collapsible:true,
				rownumbers:true,
				url:'ticket/findTicketByCondition.do?',
				method:'get',
				pagination:true,
				pageList:[10],
				pageSize:10,
				loadFilter:pagerFilter,
				toolbar:ticket_toolbar
                ">
            <thead>
            <tr>
                <th data-options="field:'flightCode',width:80,halign:'center'">航班编号</th>
                <th data-options="field:'ticketCrsName',width:80,halign:'center'">机票代理人</th>
                <th data-options="field:'logicalShip',width:80,halign:'center'">逻辑舱位</th>
                <th data-options="field:'ticketDate',width:80,halign:'center'">起飞时间</th>
                <th data-options="field:'ticketTax',width:80,halign:'center'">税费</th>
                <th data-options="field:'ticketSellmoney',width:80,halign:'center'">机票销售价格</th>
                <th data-options="field:'ticketBooking',width:80,halign:'center'">余票</th>
                <th data-options="field:'_operate',width:180,align:'center',formatter:ticketOper">操作</th>
            </tr>
            </thead>
        </table>
        <div id="win_editTicket" class="easyui-window" title="编辑航班"
             data-options="modal:true,iconCls:'icon-save',closed:true"
             style="width: 400px; height: 300px; padding: 10px; left: 544.5px; top: 194px;">
            <form id="ff_editTicket" method="post" action="ticket/updateTicket.do">
                <table cellpadding="5">
                    <tr>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="ticketNo" data-options="required:true" hidden></input></td>
                    </tr>
                    <tr>
                        <td>价格:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="ticketSellmoney" ></input></td>
                    </tr>
                    <tr>
                        <td>税费:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="ticketTax" ></input></td>
                    </tr>
                    <tr>
                        <td>余票数:</td>
                        <td><input class="easyui-validatebox textbox" type="number"
                                   name="ticketBooking" ></input></td>
                    </tr>
                </table>
                <div style="text-align: center; padding: 20px">
                    <a href="javascript:void(0)" class="easyui-linkbutton"
                       onclick="editTicket()">确认更改</a>
                </div>
            </form>
        </div>
        <div id="win_addTicket" class="easyui-window" title="添加机票"
             data-options="modal:true,iconCls:'icon-save',closed:true"
             style="width: 300px; height: 200px; padding: 10px; left: 544.5px; top: 194px;">
            <form id="ff_addTicket" method="post" action="ticket/insertNewTicket.do">
                <table cellpadding="5">
                    <tr>
                        <td>航班号:</td>
                        <td><input class="easyui-combobox" id="flightNo"name="flightNo"
                                   data-options="valueField:'id',textField:'text',url:'flight/getFlightTree.do'"></input></td>
                    </tr>
                    <tr>
                        <td>逻辑舱室:</td>
                        <td><input class="easyui-combobox" id="logicalShip"name="logicalShip"
                                   data-options="valueField:'id',textField:'text',data:ship"></input></td>
                    </tr>
                    <tr>
                        <td>代理商名称:</td>

                        <td><input class="easyui-combobox" id="ticketCrsName"name="ticketCrsName"
                                   data-options="valueField:'id',textField:'text',data:crs"></input></td>
                    </tr>
                    <tr>
                        <td>日期:</td>
                        <td><input class="easyui-datebox" data-options="formatter:formatter"
                                   name="ticketDate"  style="width:150px"></td>
                    </tr>
                    <tr>
                        <td>价格:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="ticketSellmoney" ></input></td>
                    </tr>
                    <tr>
                        <td>税费:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="ticketTax" ></input></td>
                    </tr>
                    <tr>
                        <td>余票数:</td>
                        <td><input class="easyui-validatebox textbox" type="text"
                                   name="ticketBooking" ></input></td>
                    </tr>
                </table>
                <div style="text-align: center; padding: 20px">
                    <a href="javascript:void(0)" class="easyui-linkbutton"
                       onclick="addTicket()">确认添加</a>
                </div>
            </form>
        </div>

    </div>
</div>
<script type="text/javascript">
    var crs = [{ "id":"官方直营","text":"官方直营" }, { "id":"同程特惠","text":"同程特惠" },{ "id":"行程无忧","text":"行程无忧" },{ "id":"商旅优选","text":"商旅优选" }];
    var ship = [ { "id":"头等舱","text":"头等舱" },{ "id":"公务舱","text":"公务舱" }, { "id":"经济舱","text":"经济舱" }];
    var ticket_toolbar=[{
        text:'Add',
        iconCls:'icon-add',
        handler:function(){
            $("#ff_addTicket").form("clear");
            $("#win_addTicket").window("open");
        }
    }]
    //修改日历框的显示格式
    function formatter(date) {
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var day = date.getDate();
        month = month < 10 ? '0' + month : month;
        day = day < 10 ? '0' + day : day;
        return year + "-" + month + "-" + day ;
    }
    function addTicket() {//添加机票
        //alert($("#ticketDate").currentText);
        $('#ff_addTicket').form('submit', {
            success : function(data) {
                if (data.indexOf('ticketInsertOk') >= 0) {
                    alert("添加成功");
                    $('#win_addTicket').window('close');
                    ticketDatagridReload();
                } else {
                    alert("添加失败，失败原因"+data);
                }
            }
        });
    }
    function editTicket() {//修改航班
        $('#ff_editTicket').form('submit', {
            success : function(data) {
                if (data.indexOf('ticketUpdateOk') >= 0) {
                    alert("更改成功");
                    $('#win_editTicket').window('close');
                    ticketDatagridReload();
                } else {
                    alert("更改失败，失败原因"+data);
                }
            }
        });
    }
    function editTic(TicketNo) {//打开编辑航班窗口
        //alert(TicketNo);
        $.ajax({
            url : "ticket/selectByPrimaryKey.do?ticketNo=" + TicketNo,
            type : 'post',
            async : true, //异步
            error : function() {
                alert('error');
            },
            success : function(jsonData) {
                $('#ff_editTicket').form('load', {
                    ticketNo : jsonData.ticketNo,
                    ticketTax:jsonData.ticketTax,
                    ticketSellmoney : jsonData.ticketSellmoney,
                    ticketBooking : jsonData.ticketBooking,
                });
                $("#win_editTicket").window("open");
            }
        });
    }
    function ticketOper(value, row, index) {
        return '<input class="easyui-validatebox button" type="button" value="编辑" ' +
            'onclick="editTic('+ row.ticketNo + ')" >';
    }
    function ticketDatagridReload(){//刷新机票表格数据
        /*alert($('#url_airport_id').val());*/
        var url = "ticket/findTicketByCondition.do?";
        /*alert(url);*/
        $.ajax({
            url : url,
            type : 'post',
            async : true, //异步
            error : function() {
                alert('error');
            },
            success : function(jsonData) {
                $('#ticket_datagrid').datagrid('loadData', {
                    'total' : eval(jsonData).length,
                    rows : jsonData
                });
            }
        });
    }
</script>
</body>
</html>