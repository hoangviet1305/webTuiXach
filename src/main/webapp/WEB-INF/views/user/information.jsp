<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Created by IntelliJ IDEA. User: hoantruong Date: 20/05/2021 Time: 15:43 To change this template use File |
    Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>

<head>
    <title>Thông tin</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/information_origin.css?v=1">
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<jsp:include page="../layout/header.jsp"/>

<div class="wrapper container">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/user">Tài khoản</a></li>
        <li class="breadcrumb-item active" aria-current="page">Hồ sơ</li>
    </ol>
    <!-- Sidebar -->
    <div class="row main">

        <jsp:include page="../layout/left-site.jsp"/>
        <!-- Page Content -->
        <div id="content" class="col-9 main__right-site">
            <!-- We'll fill this with dummy content -->
            <div class="main__right-site__wrap-content main-content">
                <div class="row main-content__title ">
                    <div class="col">
                        <h4>Hồ sơ của tôi</h4>
                        <p>Quản lý thông tin hồ sơ để bảo mất tài khoản</p>
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col-8">

                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-3 col-form-label">Email</label>
                            <div class="col-sm-9">
                                <p class="mb-0"><b>${nguoiDung.getUser().getEmail()}</b></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="hoTenDem" class="col-sm-3 col-form-label">Họ tên đệm</label>
                            <div class="col-sm-9">
                                <input value="${nguoiDung.getHoTenDem()}" type="text"
                                       class="form-control" id="hoTenDem">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="ten" class="col-sm-3 col-form-label">Tên</label>
                            <div class="col-sm-9">
                                <input value="${nguoiDung.getTen()}" type="text" class="form-control"
                                       id="ten">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="soDienThoai" class="col-sm-3 col-form-label">Số điện
                                thoại</label>
                            <div class="col-sm-9">
                                <input value="${nguoiDung.getSoDienThoai()}" type="text"
                                       class="form-control" id="soDienThoai">
                            </div>
                        </div>
                        <fieldset class="form-group row">
                            <legend class="col-form-label col-sm-3 float-sm-left pt-0">Giới tính
                            </legend>
                            <div class="col-sm-9">
                                <c:choose>
                                    <c:when test="${nguoiDung.isGioiTinh() == true}">
                                        <div class="form-check">
                                            <input checked class="form-check-input" type="radio"
                                                   name="gridRadios" id="gridRadios1" value="nam">
                                            <label class="form-check-label" for="gridRadios1">
                                                Nam
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio"
                                                   name="gridRadios" id="gridRadios2" value="nu">
                                            <label class="form-check-label" for="gridRadios2">
                                                Nữ
                                            </label>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio"
                                                   name="gridRadios" id="gridRadios1" value="nam">
                                            <label class="form-check-label" for="gridRadios1">
                                                Nam
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input checked class="form-check-input" type="radio"
                                                   name="gridRadios" id="gridRadios2" value="nu">
                                            <label class="form-check-label" for="gridRadios2">
                                                Nữ
                                            </label>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                            </div>

                        </fieldset>
                        <div class="form-group row">
                            <label for="datepicker" class="col-sm-3 col-form-label">Ngày
                                sinh</label>
                            <div class="col-sm-9">
                                <jsp:useBean id="date" class="java.util.Date"/>
                                <c:set var="birth" value="${nguoiDung.getNgaySinh()}"/>
                                <fmt:formatDate type="date" value="${birth}" var="ngaySinhDate" pattern="MM/dd/yyyy"/>
                                <input value = "${ngaySinhDate}" id="datepicker"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-9">
                                <button id="btnSave" class="btn btn-primary">Lưu</button>
                            </div>
                        </div>
                    </div>
                    <form id="dataImage" class="col-4 main-content__content mt-4">
                        <div class="row">
                            <div class="col">
                                <c:choose>
                                    <c:when test="${nguoiDung.getAvatar() == null}">
                                        <img src="https://www.travelcontinuously.com/wp-content/uploads/2018/04/empty-avatar.png"
                                             alt="avatar">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="data:image/png;base64, ${nguoiDung.getAvatarBase64()}"
                                             alt="avatar"/>
                                    </c:otherwise>
                                </c:choose>
             
                                <div class="custom-file mb-3 mt-3">
                                    <input type="file" class="custom-file-input" id="customFile"
                                           name="anhDaiDien">
                                    <label class="custom-file-label" for="customFile">Choose
                                        file</label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>


        </div>
    </div>

</div>
<jsp:include page="../layout/footer.jsp"/>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<script>
    $('#datepicker').datepicker({
        uiLibrary: 'bootstrap4'
    });
</script>
<script>
    $(document).ready(function () {
        $('#btnSave').click(function (e) {
            e.preventDefault();
            console.log("hello world")
            const form = $('#dataImage')[0];

            let data = new FormData(form);

            const getDataGioiTinh = () => {
                if ($("#gridRadios1").is(":checked")) {
                    return true;
                }
                return false;
            }

            const dataJson = {
                "id": "${nguoiDung.getId()}",
                "hoTenDem": $('#hoTenDem').val(),
                "ten": $('#ten').val(),
                "soDienThoai": $('#soDienThoai').val(),
                "gioiTinh": getDataGioiTinh(),
                "ngaySinh": $('#datepicker').val()
            }

            data.append("dataJson", JSON.stringify(dataJson));

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/user",
                data: data,
                enctype: "multipart/form-data",
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (response) {
                    console.log('SUCCESS', response);
                    window.location = "${pageContext.request.contextPath}/user"
                }
            });

        });
    });
</script>
</body>

</html>