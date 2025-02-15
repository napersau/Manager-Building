<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Thêm tòa nhà</title>
</head>
<body>
<div class="main-content" id="main-container">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
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
                        Trang chủ
                    </h1>
                </div><!-- /.page-header -->


<%--                Bảng danh sách--%>

                <div class="row">
                    <form:form modelAttribute="buildingEdit" id="listForm" method="GET">
                        <div class="col-xs-12">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-xs-3">Tên tòa nhà</label>
                                    <div class="col-xs-9">
<%--                                        <input type="text" class="form-control" id="name" name="name">--%>
                                        <form:input  class="form-control" path="name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class = "col-xs-3">Quận</label>
                                    <div class = "col-xs-3">
                                        <form:select class = "form-control" path="district">
                                            <form:option value="">---Chọn Quận---</form:option>
                                            <form:options items="${districts}"/>
                                        </form:select>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phường</label>
                                    <div class="col-xs-9">
<%--                                        <input type="text" class="form-control" id="ward" name="ward">--%>
                                        <form:input  class="form-control" path="ward"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Đường</label>
                                    <div class="col-xs-9">
<%--                                        <input type="text" class="form-control" id="street" name="street">--%>
                                        <form:input  class="form-control" path="street"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Kết cấu</label>
                                    <div class="col-xs-9">
<%--                                        <input type="text" class="form-control" id="structure" name="structure">--%>
                                        <form:input  class="form-control" path="structure"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Số tầng hầm</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="numberofbasement" name="numberofbasement">--%>
                                        <form:input  class="form-control" path="numberOfBasement"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Diện tích sàn</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="floorarea" name="floorarea">--%>
                                        <form:input  class="form-control" path="floorArea"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Hướng</label>
                                    <div class="col-xs-9">
<%--                                        <input type="text" class="form-control" id="direction" name="direction">--%>
                                        <form:input  class="form-control" path="direction"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Hạng</label>
                                    <div class="col-xs-9">
<%--                                        <input type="text" class="form-control" id="level" name="level">--%>
                                        <form:input  class="form-control" path="level"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Diện tích thuê</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="rentarea" name="rentarea">--%>
                                        <form:input  class="form-control" path="rentArea"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Giá thuê</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="rentprice" name="rentprice">--%>
                                        <form:input  class="form-control" path="rentPrice"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Mô tả giá</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="rentpricedescription" name="rentpricedescription">--%>
                                        <form:input  class="form-control" path="rentPriceDescription"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí dịch vụ</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="name" name="name">--%>
                                        <form:input  class="form-control" path="serviceFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí ô tô</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="name" name="name">--%>
                                        <form:input  class="form-control" path="carFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí xe máy</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="name" name="name">--%>
                                        <form:input  class="form-control" path="motoFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí ngoài giờ</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="name" name="name">--%>
                                        <form:input  class="form-control" path="overtimeFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Tiền điện</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="name" name="name">--%>
                                        <form:input  class="form-control" path="electricityFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Tiền cọc</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="name" name="name">--%>
                                        <form:input  class="form-control" path="deposit"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Thanh toán</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="name" name="name">--%>
                                        <form:input  class="form-control" path="payment"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Thời hạn thuê</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="name" name="name">--%>
                                        <form:input  class="form-control" path="rentTime"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Thời gian trang trí</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="name" name="name">--%>
                                        <form:input  class="form-control" path="decorationTime"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Tên quản lý</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="name" name="name">--%>
                                        <form:input  class="form-control" path="managerName"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">SĐT quản lý</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="name" name="name">--%>
                                        <form:input  class="form-control" path="managerPhone"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Phí môi giới</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="name" name="name">--%>
                                        <form:input  class="form-control" path="brokerageFee"/>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-xs-3">Loại tòa nhà</label>
                                    <div class="col-xs-9">
                                        <div class = col-xs-6>
                                            <form:checkboxes cssStyle="margin-left:10px" items="${typeCodes}" path="typeCode"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Ghi chú</label>
                                    <div class="col-xs-9">
<%--                                        <input type="number" class="form-control" id="name" name="name">--%>
                                        <form:input  class="form-control" path="note"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3"></label>
                                    <div class="col-xs-9">
                                        <c:if test="${not empty buildingEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Cập nhật tòa nhà</button>
                                            <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                        </c:if>
                                        <c:if test="${empty buildingEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Thêm tòa nhà</button>
                                            <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                        </c:if>

                                    </div>
                                </div>
                                <form:hidden path="id" id="buildingId"/>
                            </form>
                        </div>
                    </form:form>

                </div>
        </div><!-- /.page-content -->

        </div>
    </div><!-- /.main-content -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->


<script>
    $('#btnAddOrUpdateBuilding').click(function(){
        var data = {};
        var typeCode = [];
        var formData = $('#listForm').serializeArray();
        $.each(formData, function(i, v){
            if(v.name != 'typeCode'){
                data["" + v.name + ""] = v.value;
            }
            else{
                typeCode.push(v.value);
            }
        });
        data['typeCode'] = typeCode;
        if(typeCode != ''){
            addOrUpdateBuilding(data);
        }
        else{
            window.location.href = "<c:url value="/admin/building-edit?typeCode=require"/>";
        }

    });

    function addOrUpdateBuilding(data){
        $.ajax({
            type: "POST",
            url: "${buildingAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: function(response){
                alert("Thêm tòa nhà thành công!");
                location.reload(); // Reload trang sau khi hiển thị thông báo
            },
            error: function(respond){
                alert("Thêm tòa nhà thất bại. Vui lòng thử lại!");
            }
        });
    }
    //Cancel
    $('#btnCancel').click(function (){
        window.location.href = "/admin/building-list";
    });

</script>

</body>
</html>
