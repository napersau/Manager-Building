<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Quản lý tòa nhà</title>
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
                        <a href="#">Trang chủ</a>
                    </li>
                    <li class="active">Danh sách</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        Danh sách tòa nhà
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            Danh sách &amp;
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class = "row">
                    <div class="col-xs-12 widget-container-col ui-sortable">
                        <div class="widget-box ui-sortable-handle">
                            <div class="widget-header">
                                <h5 class="widget-title">Tìm kiếm</h5>

                                <div class="widget-toolbar">
                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main" >
                                    <form:form id="listForm" action="${buildingListURL}" method="GET" modelAttribute="modelSearch">
                                        <div class = "row">
                                            <div class = "form-group">
                                                <div class = "col-xs-12">
                                                    <div class = "col-xs-6">
                                                        <label class = "name">Tên tòa nhà</label>
<%--                                                        <input type="text" class = "form-control" name="name" value="${modelSearch.name}">--%>
                                                        <form:input cssClass="form-control" path="name"/>
                                                    </div>
                                                    <div class = "col-xs-6">
                                                        <label class = "name">Diện tích sàn</label>
<%--                                                        <input type="number" class = "form-control" name="floorArea" value="${modelSearch.floorArea}">--%>
                                                        <form:input cssClass="form-control" path="floorArea"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class = "form-group">
                                                <div class = "col-xs-12">
                                                    <div class = "col-xs-2">
                                                        <label class = "name">Quận</label>
                                                        <form:select class = "form-control" path="district">
                                                            <form:option value="">---Chọn Quận---</form:option>
                                                            <form:options items="${districts}"/>
                                                        </form:select>
                                                    </div>
                                                    <div class = "col-xs-5">
                                                        <label class = "name">Phường</label>
<%--                                                        <input type="text" class = "form-control" name="ward" value="">--%>
                                                        <form:input cssClass="form-control" path="ward"/>
                                                    </div>
                                                    <div class = "col-xs-5">
                                                        <label class = "name">Đường</label>
<%--                                                        <input type="text" class = "form-control" name="street" value="">--%>
                                                        <form:input cssClass="form-control" path="street"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class = "form-group">
                                                <div class = "col-xs-12">
                                                    <div class = "col-xs-4">
                                                        <label class = "name">Số tầng hầm</label>
<%--                                                        <input type="text" class = "form-control" name="numberOfBasement" value="">--%>
                                                        <form:input cssClass="form-control" path="numberOfBasement"/>
                                                    </div>
                                                    <div class = "col-xs-4">
                                                        <label class = "name">Hướng</label>
<%--                                                        <input type="text" class = "form-control" name="direction" value="">--%>
                                                        <form:input cssClass="form-control" path="direction"/>
                                                    </div>
                                                    <div class = "col-xs-4">
                                                        <label class = "name">Hạng</label>
<%--                                                        <input type="text" class = "form-control" name="level" value="">--%>
                                                        <form:input cssClass="form-control" path="level"/>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class = "form-group">
                                                <div class = "col-xs-12">
                                                    <div class = "col-xs-3">
                                                        <label class = "name">Diện tích từ</label>
<%--                                                        <input type="number" class = "form-control" name="reatAreaFrom" value="">--%>
                                                        <form:input cssClass="form-control" path="areaFrom"/>

                                                    </div>
                                                    <div class = "col-xs-3">
                                                        <label class = "name">Diện tích đến</label>
<%--                                                        <input type="number" class = "form-control" name="rentAreaTo" value="" >--%>
                                                        <form:input cssClass="form-control" path="areaTo"/>
                                                    </div>
                                                    <div class = "col-xs-3">
                                                        <label class = "name">Giá thuê từ</label>
<%--                                                        <input type="number" class = "form-control" name="rentPriceFrom" value="">--%>
                                                        <form:input cssClass="form-control" path="rentPriceFrom"/>
                                                    </div>
                                                    <div class = "col-xs-3">
                                                        <label class = "name">Giá thuê đến</label>
<%--                                                        <input type="number" class = "form-control" name="rentPriceTo" value="">--%>
                                                        <form:input cssClass="form-control" path="rentPriceTo"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class = "form-group">
                                                <div class = "col-xs-12">
                                                    <div class = "col-xs-5">
                                                        <label class = "name">Tên quản lý</label>
<%--                                                        <input type="number" class = "form-control" name="managerName" value="">--%>
                                                        <form:input cssClass="form-control" path="managerName"/>
                                                    </div>
                                                    <div class = "col-xs-5">
                                                        <label class = "name">SĐT quản lý</label>
<%--                                                        <input type="number" class = "form-control" name="managerPhoneNumber" value="">--%>
                                                        <form:input cssClass="form-control" path="managerPhone"/>
                                                    </div>
                                                    <div class="col-sm-2">
                                                    <security:authorize access="hasRole('ADMIN')">
                                                        <div>
                                                            <label class="name">Nhân viên</label>
                                                            <form:select class="form-control" path="staffId">
                                                                <form:option value="">---Chọn Nhân viên---</form:option>
                                                                <form:options items="${listStaffs}"></form:options>
                                                            </form:select>
                                                        </div>
                                                    </security:authorize>
                                                </div>
                                                </div>
                                            </div>
                                            <div class = "form-group">
                                                <div class = "col-xs-12">
                                                    <div class = col-xs-6>
                                                        <form:checkboxes cssStyle="margin-left: 10px" items="${typeCodes}" path="typeCode"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class = "form-group">
                                                <div class = "col-xs-12">

                                                    <div class = col-xs-6>
                                                        <button class = "btn btn-danger" id="btnSearchBuilding">
                                                            Tìm kiếm
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>


                                </div>

                            </div>

                            <div class="pull-right">
                                <a href="/admin/building-edit">
                                    <button class="btn btn-info" title="Thêm tòa nhà">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </a>
                                <security:authorize access="hasRole('MANAGER')">
                                <button class="btn btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                        <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>

                                </security:authorize>
                            </div>
                        </div>
                    </div>
                </div>

<%--                Bảng danh sách--%>
                <div class="row">
                    <div class="col-xs-12">
                        <table id="tableList" class="table table-striped table-bordered table-hover" style="margin-top: 3em;">
                            <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" name="checkList" value="">
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>Tên tòa nhà</th>
                                <th>Địa chỉ</th>
                                <th>Số tầng hầm</th>
                                <th>Tên quản lý</th>
                                <th>SĐT quản lý</th>
                                <th>D.Tích sàn</th>
                                <th>D.Tích trống</th>
                                <th>D.Tích thuê</th>
                                <th>Phí môi giới</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="item" items="${buildingList}">
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td>${item.name}</td>
                                    <td>${item.address}</td>
                                    <td>${item.numberOfBasement}</td>
                                    <td>${item.managerName}</td>
                                    <td>${item.managerPhone}</td>
                                    <td>${item.floorArea}</td>
                                    <td>${item.emptyArea}</td>
                                    <td>${item.rentArea}</td>
                                    <td>${item.brokerageFee}</td>
                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assingmentBuilding(${item.id})">
                                                <i class="ace-icon fa fa-bars bigger-120"></i>
                                            </button>

                                            <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${item.id}">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </a>
                                            <security:authorize access="hasRole('MANAGER')">
                                            <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${item.id})">
                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </button>
                                            </security:authorize>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>
                </div>

            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->


    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->
<div class="modal fade" id="assingmentBuildingModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Danh sách nhân viên</h1>
            </div>
            <div class="modal-body">
                <table id="staffList" class="table table-striped table-bordered table-hover" >
                    <thead>
                        <tr>
                            <th class="center">Chọn</th>
                            <th>Tên Nhân Viên</th>
                        </tr>
                    </thead>

                    <tbody>

                    </tbody>

                </table>
                <input type="hidden" id="buildingId" name="buildingId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnassignmentBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<script>
    function assingmentBuilding(buildingId){
        $('#assingmentBuildingModal').modal();
        loadStaff(buildingId);
        $('#buildingId').val(buildingId);
    }

    function loadStaff(buildingId){
        $.ajax({

            url: "${buildingAPI}/" + buildingId + '/staffs',
            type: "GET",
            // data: JSON.stringify(data),
            // contentType: "application/json",
            dataType: "json",
            success: function(response){
                var row = '';
                $.each(response.data, function (index, item){
                    row += '<tr>';
                    row += '<td class="center"><input type="checkbox" value=' + item.staffId + ' id="checkbox_' + item.staffId + '" class = "check-box-element" ' + '" ' + item.checked + '/></td>';
                    row += '<td class="text-center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
            },
            error: function(response){
                console.log("fail");
                console.log(response);
            }
        });
    }

    $('#btnassignmentBuilding').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if(data['staffs'] != ''){
            assignment(data);
        }
        alert("Giao tòa nhà thành công!");
        location.reload(); // Reload trang sau khi hiển thị thông báo
    });

    function assignment(data){

        $.ajax({
            url: "${buildingAPI}/" + 'assignment',
            type: "POST",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: function(response){
            },
            error: function(response){
                console.log("fail");
                console.log(response);
            }
        });
    }

    $('#btnSearchBuilding').click(function(e){
        e.preventDefault();
        $('#listForm').submit();
    });

    function deleteBuilding(id){
        var buildingId = [id];
        deleteBuildings(buildingId);
        alert("Xóa tòa nhà thành công!");
        location.reload(); // Reload trang sau khi hiển thị thông báo
    }

    $('#btnDeleteBuilding').click(function (e){
        e.preventDefault();
        var buildingIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds);
        alert("Xóa tòa nhà thành công!");
        location.reload(); // Reload trang sau khi hiển thị thông báo
    });

    function deleteBuildings(data){
        $.ajax({
            type: "DELETE",
            url: "${buildingAPI}/" + data,
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: function(response){
                alert("Xóa tòa nhà thành công!");
                location.reload(); // Reload trang sau khi hiển thị thông báo
            },
            error: function(response){
                console.log("fail");
            }
        });
    }
</script>
</body>
</html>