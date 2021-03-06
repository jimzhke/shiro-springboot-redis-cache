<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../../../jsp/common/resource.jsp" %>
    <%@ include file="../../../../jsp/common/tags.jsp" %>

    <title>用户月嫂满意度管理</title>
    <link href="${ctx}/static/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=${webVersion}" rel="stylesheet">
    <link href="${ctx}/static/css/paginate.css" rel="stylesheet">

    <!-- Custom styles for this template -->
</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- **********************************************************************************************************************************************************
    TOP BAR CONTENT & NOTIFICATIONS
    *********************************************************************************************************************************************************** -->
    <!--header start-->
    <jsp:include page="../../../header.jsp"/>
    <!--header end-->

    <!-- **********************************************************************************************************************************************************
    MAIN SIDEBAR MENU
    *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <jsp:include page="../../../aside.jsp"/>
    <!--sidebar end-->

    <!-- **********************************************************************************************************************************************************
    MAIN CONTENT
    *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <div class="layui-body">


        <div class="form-panel">
            <div class="panel-heading">
                <h5 class="mb"><i class="fa fa-list-ul"></i>用户月嫂满意度管理</h5>
            </div>
            <div class="form-horizontal style-form layui-form">
                <div class="form-group">
                    <div class="col-xs-10">
                        <div class="form-group">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-xs-3  control-label">客户姓名</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" id="userName" name="userName" type="text" maxlength="50"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3  control-label">提交日期</label>
                                    <div class="col-xs-9">
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" autocomplete="false" id="satisStartTime" name="satisStartTime" />
                                        </div>
                                        ~
                                        <div class="layui-input-inline">
                                            <input type="text" class="layui-input" autocomplete="false" id="satisEndTime" name="satisEndTime" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label class="col-xs-3  control-label">联系电话</label>
                                    <div class="col-xs-9">
                                        <input class="form-control" id="mobNum" name="mobNum" type="text" maxlength="20"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="search"> 查 询</button>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-12 mt">
                        <div class="content-panel">
                            <table id="table_data" class="dataTable table table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 5%;">#</th>
                                    <th style="width: 15%;">会所名称</th>
                                    <th style="width: 15%;">客户姓名</th>
                                    <th style="width: 15%;">联系电话</th>
                                    <th style="width: 10%;">月嫂姓名</th>
                                    <th style="width: 10%;">提交分数</th>
                                    <th style="width: 10%;">提交日期</th>
                                    <th style="width: 15%;">客户意见</th>
                                    <th style="width: 10%;">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div><!-- /col-xs-12 END SECTION MIDDLE -->

    <!--main content end-->
    <jsp:include page="../../../footer.jsp"/>
</div>
<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/static/layui/layui.js?v=${webVersion}"></script>
<script src="${ctx}/static/js/global.js?v=${webVersion}"></script>
<!--script for this page-->
<script>
    //JavaScript代码区域
    layui.use(['element', 'layer', 'globalAjax', 'datatable', 'jquery', 'laydate', 'jqueryui', 'form'], function () {
        var $= layui.jquery, element = layui.element, layer = layui.layer, datatable = layui.datatable,laydate = layui.laydate, form = layui.form;
        //日期
        laydate.render({
            elem: '#satisStartTime'
            ,format: 'yyyy-MM-dd' //可任意组合
        });
        laydate.render({
            elem: '#satisEndTime'
            ,format: 'yyyy-MM-dd' //可任意组合
        });

        $(function () {
            initTable();
        });

        form.on('submit(search)', function (data) {
            initTable();
            return false;
        });

        //初始化表格
        function initTable() {
            $("#table_data").dataTable().fnDestroy();
            json = {};
            json.id = "table_data";
            json.url = '${ctx}/satis/queryUserMmatronSatisData';
            json.param = [
                {
                    "name": "exterUserName",
                    "value": $("#userName").val()
                },
                {
                    "name": "mobNum",
                    "value": $("#mobNum").val()
                },
                {
                    "name": "satisStartTime",
                    "value": $("#satisStartTime").val()
                },
                {
                    "name": "satisEndTime",
                    "value": $("#satisEndTime").val()
                }

            ];
            json.columns = [
                {
                    "sWidth": "60px",
                    "sClass": "text-center"
                },
                {
                    "mData": "subsyName",
                    "sWidth": "180px",
                    "sClass": "text-center"
                },
                {
                    "mData": "exterUserName",
                    "sWidth": "180px",
                    "sClass": "text-center"
                },
                {
                    "mData": "mobNum",
                    "sWidth": "200px",
                    "sClass": "text-center"
                },
                {
                    "mData": "mmatronName",
                    "sWidth": "180px",
                    "sClass": "text-center"
                },
                {
                    "mData": "satisScore",
                    "sWidth": "100px",
                    "sClass": "text-center"
                }, {
                    "mData": "satisTime",
                    "sWidth": "150px",
                    "sClass": "text-center"
                }, {
                    "mData": "otherDesc",
                    "sWidth": "200px",
                    "sClass": "text-center"
                }, {
                    "mData": "tranSatisUserBaseCode",
                    "sWidth": "100px",
                    "sClass": "text-center",
                    "mRender": function (data, type, row) {
                        var array = [];
                        array.push("<div class=\"layui-btn-group\">");
                        array.push("<button class=\"layui-btn layui-btn-primary layui-btn-sm toDetail\" vb=\"" + data +  "\">");
                        array.push("<i title=\"查看\" class=\"layui-icon\">&#xe63c;</i>");
                        array.push("</button>");
                        array.push("</div>");
                        return array.join("");
                    }
                }
            ];
            datatable.tableManaged(json).init();
        }

        $(document).on('click', ".toDetail", function () {
            var satis = $(this).attr("vb");
            window.location.href = "${ctx}/satis/" + satis + "/detailMmatron";
        });
    });

</script>


</body>
</html>
