<%@ page import="org.apache.commons.io.FilenameUtils" %>
    <%@ page import="java.util.regex.Pattern" %>
        <%-- Created by IntelliJ IDEA. User: hoantruong Date: 23/05/2021 Time: 23:41 To change this template use File |
            Settings | File Templates. --%>
            <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                <%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
                    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                        <rapid:override name="header">
                        </rapid:override>

                        <rapid:override name="title">
                            <a class="navbar-brand" href="javascript:;">Thêm sản phẩm</a>
                        </rapid:override>

                        <rapid:override name="content">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="tenSanPhamId">Tên sản phẩm</label>
                                        <input type="text" name="tenSanPham" class="form-control" id="tenSanPhamId"
                                            placeholder="tên sản phẩm...">
                                    </div>

                                    <div class="form-group">
                                        <label for="tenThuongHieuId">Tên thương hiệu</label>
                                        <input type="text" name="tenThuongHieu" class="form-control"
                                            id="tenThuongHieuId" placeholder="tên thương hiệu...">
                                    </div>

                                    <div class="form-group">
                                        <label for="theLoaiId">Thể loại</label>
                                        <select name="theLoai" class="form-control" id="theLoaiId">
                                            <option>Bút viết</option>
                                            <option>Văn phòng phẩm</option>
                                            <option>Dụng cụ học tập</option>
                                            <option>Vẽ, học vẽ, to màu</option>
                                            <option>Đồ chơi</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="giaId">Giá</label>
                                        <input name="gia" type="number" class="form-control" id="giaId"
                                            placeholder="Giá...">
                                    </div>

                                    <div class="form-group">
                                        <label for="moTaId">Mô tả</label>
                                        <textarea name="moTa" class="form-control" id="moTaId" rows="4"></textarea>
                                    </div>


                                    <form id="myForm" method="post" enctype="multipart/form-data" class="forms-sample">
                                        <div class="form-group">
                                            <label>Ảnh đại diện</label>
                                            <input type="file" name="anhDaiDien" class="file-upload-default">
                                            <div class="input-group col-xs-12">
                                                <input type="text" class="form-control file-upload-info" disabled
                                                    placeholder="Upload Image">
                                                <span class="input-group-append">
                                                    <button class="file-upload-browse btn btn-primary"
                                                        type="button">Upload</button>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label>Ảnh mẫu sản phẩm</label>
                                            <input multiple type="file" name="anhMauSanPham[]"
                                                class="file-upload-default">
                                            <div class="input-group col-xs-12">
                                                <input type="text" class="form-control file-upload-info" disabled
                                                    placeholder="Upload Image">
                                                <span class="input-group-append">
                                                    <button class="file-upload-browse btn btn-primary"
                                                        type="button">Upload</button>
                                                </span>
                                            </div>
                                        </div>
                                    </form>


                                    <div class="form-group">
                                        <label>Màu sắc</label>
                                        <div class="row" id="listMauSacId">
                                            <div class="col-3 mt-2">
                                                <select class="form-control mauSacInput">
                                                    <option>Trắng</option>
                                                    <option>Đen</option>
                                                    <option>Xanh</option>
                                                    <option>Đỏ</option>
                                                    <option>Tím</option>
                                                    <option>Vàng</option>
                                                    <option>Nâu</option>
                                                </select>
                                            </div>
                                        </div>
                                        <button id="btnAddColors" class="btn btn-success mt-2">add</button>
                                    </div>

                                    <div class="form-group">
                                        <label>Thuộc tính riêng</label>
                                        <div id="listThuocTinhId">
                                            <div class="row">
                                                <div class="col-6">
                                                    <label for="tenThuongHieuId">Thuộc tính</label>
                                                    <input name="thuocTinhs[][thuocTinh]" type="text" class="form-control"
                                                        id="thuocTinhId" placeholder="tên thương hiệu...">
                                                </div>
                                                <div class="col-6">
                                                    <label for="tenThuongHieuId">Giá trị</label>
                                                    <input name="thuocTinhs[][giaTri]" type="text" class="form-control"
                                                        id="giaTriId" placeholder="tên thương hiệu...">
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <button id="btnAddThuocTinhs" class="btn btn-success mt-2">add</button>
                                    </div>

                                    <button id="submit" class="btn btn-primary mr-2">Submit</button>
                                    <button class="btn btn-dark">Cancel</button>
                                </div>
                            </div>
                        </rapid:override>

                        <rapid:override name="scripPath">
                            <script src="${pageContext.request.contextPath}/css/assets/js/file-upload.js"></script>
                            <script>
                                $(document).ready(function () {
        
                                    $('#submit').click(function (e) {
                            
                                        let form = $('#myForm')[0];
                                        let data = new FormData(form);

                                        let listMauSac = [];

                                        $(".mauSacInput").each(function () {
                                            listMauSac = [...listMauSac, $(this).val()];
                                        });

                                        let listThuocTinh = [];

                                        $('input[name="thuocTinhs[][thuocTinh]"]').each(function () {
                                            listThuocTinh = [...listThuocTinh, $(this).val()];
                                        });

                                        let listChiTiet = [];

                                        $('input[name="thuocTinhs[][giaTri]"]').each(function (i) {
                                            const giaTri = $(this).val();
                                            const temp = { key: listThuocTinh[i], value: giaTri }
                                            listChiTiet = [...listChiTiet, temp];
                                        });

                                        let jsonDataObject = {
                                            "tenSanPham": $('#tenSanPhamId').val(),
                                            "tenThuongHieu": $('#tenThuongHieuId').val(),
                                            "theLoai": $('#theLoaiId').val(),
                                            "gia": $('#giaId').val(),
                                            "moTa": $("#moTaId").val(),
                                            "mauSacs": listMauSac,
                                            "chiTiets": listChiTiet
                                        }


                                        data.append("jsondata", JSON.stringify(jsonDataObject));


                                        $.ajax({
                                            type: "POST",
                                            url: "${pageContext.request.contextPath}/product/add",
                                            data: data,
                                            enctype: "multipart/form-data",
                                            processData: false,
                                            contentType: false,
                                            cache: false,
                                            timeout: 600000,
                                            success: function (response) {
                                                console.log('SUCCESS', response);
                                                window.location = "${pageContext.request.contextPath}/product"
                                            }
                                        });

                                    });
                                
                                    $('#btnAddColors').click(function (e) { 
                                        e.preventDefault();
                                        console.log('btn add  is running');
                                        $( "#listMauSacId" ).append( '<div class="col-3 mt-2"><select class="form-control mauSacInput"><option>Trắng</option><option>Đen</option> <option>Xanh</option> <option>Đỏ</option> <option>Tím</option> <option>Vàng</option> <option>Nâu</option></select></div>' );
                                    });

                                    $("#btnAddThuocTinhs").click(function (e) { 
                                        e.preventDefault();
                                        $("#listThuocTinhId").append(''+
                                        '<div class="row">'+
                                                '<div class="col-6">'+
                                                    '<label for="tenThuongHieuId">Thuộc tính</label>'+
                                                    '<input name="thuocTinhs[][thuocTinh]" type="text" class="form-control"'+
                                                        'id="thuocTinhId" placeholder="tên thương hiệu...">'+
                                                '</div>'+
                                                '<div class="col-6">'+
                                                    '<label for="tenThuongHieuId">Giá trị</label>'+
                                                    '<input name="thuocTinhs[][giaTri]" type="text" class="form-control"'+
                                                        'id="giaTriId" placeholder="tên thương hiệu...">'+
                                                '</div>'+
                                            '</div>'+
                                        '');
                                    });
                                });

                            </script>
                        </rapid:override>
                        <%@include file="index.jsp" %>