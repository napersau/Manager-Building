<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerAPI" value="/api/customer"></c:url>

<html>
<head>
    <title>Thêm sửa khách hàng</title>
</head>
<body>
<div class="main-content" id="main-container">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        Thông tin khách hàng
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            Thông tin
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row" style="font-family: Times New Roman, Times, serif;">
                    <form:form modelAttribute="customerEdit" id="listForm" method="GET">
                        <div class="col-xs-12">
                            <form action="" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-xs-3">Tên khách hàng</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="fullName"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Số điện thoại</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="phone"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Email</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="email"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Tên công ty</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="companyName"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Yêu cầu</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="demand"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Tình trạng</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="status"/>
                                    </div>


                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3"></label>
                                    <div class="col-xs-9">

                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">
                                            <c:choose>
                                                <c:when test="${not empty customerEdit.id}">
                                                    Cập nhật khách hàng
                                                </c:when>
                                                <c:otherwise>
                                                    Thêm mới khách hàng
                                                </c:otherwise>
                                            </c:choose>
                                        </button>

                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác
                                        </button>

                                        <img src="/img/loading.gif" style="display: none; height: 100px"
                                             id="loading_image">
                                    </div>
                                </div>
                                <form:hidden path="id" id="id"/>

                            </form>
                        </div>
                    </form:form>

                </div>
            </div><!-- /.page-content -->



            <c:forEach var="item" items="${transactionType}">
                <div class="col-xs-12">
                    <div class="col-sm-12">
                        <h3 class="header smaller lighter blue">
                                ${item.value}
                        </h3>
                        <button class="btn btn-lg btn-primary"
                                onclick="transactionType('${item.key}', ${customerEdit.id})">
                            <i class="orange ace-icon fa fa-location-arrow bigger-130"></i>Add
                        </button>
                    </div>
                    <c:if test="${item.key == 'CSKH'}">
                        <div class="col-xs-12">
                            <table id="simple-table1" class="table table-striped table-bordered table-hover">
                                <thead></thead>
                                <tbody>
                                <form:form modelAttribute="transactionListCSKH" method="get">
                                    <display:table name="transactionListCSKH" cellspacing="0" cellpadding="0"
                                                   sort="external"
                                                   defaultsort="2" defaultorder="ascending"
                                                   id="tableList"
                                                   export="false"
                                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                                   style="margin: 3em 0 1.5em;">

                                        <display:column headerClass="text-left" property="createdDate"
                                                        title="Ngày tạo"/>
                                        <display:column headerClass="text-left" property="createdBy" title="Người tạo"/>
                                        <display:column headerClass="text-left" property="modifiedDate"
                                                        title="Ngày sửa"/>
                                        <display:column headerClass="text-left" property="modifiedBy"
                                                        title="Người sửa"/>
                                        <display:column headerClass="text-left" property="note"
                                                        title="Chi tiết giao dịch"/>

                                        <display:column headerClass="col-actions" title="Thao tác">
                                            <div class="hidden-sm hidden-xs btn-group"></div>

                                            <a class="btn btn-xs btn-info" title="Sửa thông tin giao dịch"
                                               onclick="UpdateTransaction(${tableList.id}, '${item.key}', ${customerEdit.id});">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </a>
                                        </display:column>
                                    </display:table>
                                </form:form>
                                </tbody>
                            </table>
                        </div>
                    </c:if>

                    <c:if test="${item.key == 'DDX'}">
                        <div class="col-xs-12">
                            <table id="simple-table" class="table table-striped table-bordered table-hover">
                                <thead></thead>
                                <tbody>
                                <form:form modelAttribute="transactionListDDX">
                                    <display:table name="transactionListDDX" cellspacing="0" cellpadding="0"
                                                   sort="external"
                                                   defaultsort="2" defaultorder="ascending"
                                                   id="tableList"
                                                   export="false"
                                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                                   style="margin: 3em 0 1.5em;">

                                        <display:column headerClass="text-left" property="createdDate"
                                                        title="Ngày tạo"/>
                                        <display:column headerClass="text-left" property="createdBy" title="Người tạo"/>
                                        <display:column headerClass="text-left" property="modifiedDate"
                                                        title="Ngày sửa"/>
                                        <display:column headerClass="text-left" property="modifiedBy"
                                                        title="Người sửa"/>
                                        <display:column headerClass="text-left" property="note"
                                                        title="Chi tiết giao dịch"/>

                                        <display:column headerClass="col-actions" title="Thao tác">
                                            <%--                                            <button class="btn btn-xs btn-info" data-toggle="tooltip" title="Sửa thông tin giao dịch" onclick="UpdateTransaction(${tableList.id})">--%>
                                            <%--                                                <i class="ace-icon fa fa-pencil bigger-120"></i>--%>
                                            <%--                                            </button>--%>
                                            <a class="btn btn-xs btn-info" title="Sửa thông tin giao dịch"
                                               onclick="UpdateTransaction(${tableList.id}, '${item.key}', ${customerEdit.id});">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </a>
                                        </display:column>
                                    </display:table>
                                </form:form>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div><!-- /.main-content -->

    <div class="modal fade" id="transactionTypeModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">x</button>
                    <h4 class="modal-title">Nhập giao dịch</h4>
                </div>

                <div class="modal-body">
                    <div class="form-group has-success" id = "TransactionInput">
                        <label class="col-xs-12 col-sm-3 control-label no-padding-right">Chi tiết giao
                            dịch</label>
                        <div class="col-xs-12 col-sm-9">

                            <span class="block input-icon input-icon-right">
                                <input type="text" id="transactionDetail" class="width-100" value=""/>
                            </span>
                        </div>
                    </div>

                    <input type="hidden" id="customerId" name="customerId" value=""/>
                    <input type="hidden" id="code" name="code" value=""/>
                    <input type="hidden" id="transactionId" name="transactionId" value=""/>
                    <input type="hidden" id="createdBy" name="createdBy" value=""/>
                    <input type="hidden" id="modifiedBy" name="modifiedBy" value=""/>
                    <input type="hidden" id="createdDate" name="createdDate" value=""/>
                    <input type="hidden" id="modifiedDate" name="modifiedDate" value=""/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateTransaction">Thêm giao dịch</button>

                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>

            </div>
        </div>
    </div>
</div><!-- /.main-container -->
<script>

    function transactionType(code, customerId) {
        $('#transactionTypeModal').modal();
        $('#customerId').val(customerId);
        $('#code').val(code);
    }

    function UpdateTransaction(transactionId, code, customerId) {
        $('#transactionTypeModal').modal();
        $('#transactionId').val(transactionId);
        $('#customerId').val(customerId);
        $('#code').val(code);
        loadTransactionDetail(transactionId);
    }

    function loadTransactionDetail(transactionId) {
        $.ajax({
            type: "GET",
            url: "${customerAPI}/" + transactionId + '/transaction-type',
            dataType: "JSON",
            success: function (response) {
                $('#transactionDetail').val(response.note);
                let row = '';
                $.each(response.data, function (index, item){
                    row += '<input type = text ' + 'id = "transactionDetail" class="width-100 value = "' + item + '" />';
                });
                $('#TransactionInput .input-icon').html(row);
                $('#transactionTypeModal').modal();
            },

        })
    }

    $('#btnAddOrUpdateTransaction').click(function () {
        var data = {};
        data['id'] = $('#transactionId').val();
        data['customerId'] = $('#customerId').val();
        data['code'] = $('#code').val();
        data['createdBy'] = $('#createdBy').val();
        data['modifiedBy'] = $('#modifiedBy').val();
        data['createdDate'] = $('#createdDate').val();
        data['modifiedDate'] = $('#modifiedDate').val();
        data['note'] = $('#transactionDetail').val();

        addTransaction(data);
    });

    function addTransaction(data) {
        $.ajax({
            type: "POST",
            url: "${customerAPI}" + "/transaction-type",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (response) {
                location.reload();
                alert("Thêm giao dịch thành công!!!");
            },

            error: function (response) {
                window.location.href = "<c:url value = '/admin/customer-edit?message=error'/>";
            }
        })
    }

    $('#btnCancel').click(function () {
        window.location.href = "<c:url value = '/admin/customer-list'/>";
    });

    $('#btnAddOrUpdateCustomer').click(function () {
        var data = {};

        var formData = $('#listForm').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });

        if (data['customerPhone'] != '' && data['fullName'] != '') {
            addOrUpdateCustomer(data);
        } else {
            window.location.href = "<c:url value = "/admin/customer-list?fullNameAndPhoneNumber=require"/>";
        }
    });

    function addOrUpdateCustomer(data) {
        $.ajax({
            type: "POST",
            url: "${customerAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (response) {
                window.location.href = "<c:url value = '/admin/customer-list?message=success'/>";
                alert("Thêm khách hàng thành công!!!");
            },

            error: function (response) {
                console.log("failed");
                window.location.href = "<c:url value = '/admin/customer-edit?message=error'/>";
            }
        })
    }
</script>
</body>
</html>