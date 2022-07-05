<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hoantruong
  Date: 20/05/2021
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>
    <c:url var="cssLoginUrl" value="/css/login_style.css?v=1"/>
    <link rel="stylesheet" href="${cssLoginUrl}">
</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<div class="login container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/user">Tài khoản</a></li>
            <li class="breadcrumb-item active" aria-current="page">Đăng ký</li>
        </ol>
    </nav>
    <div class="login__form my-5">
        <h5>Đăng ký tài khoản</h5>
        <p>
            Bạn đã có tài khoản <a href="${pageContext.request.contextPath}/user/login">Đăng nhập tại đây</a>
        </p>
        <div class="main-content login__form__wrap-form pt-3">

            <form class="m-auto" action="${pageContext.request.contextPath}/user/register" method="POST">
                <div class="form-group row">
                    <div class="col">
                        <c:if test="${param.failure}"><p class="error">Email đã tồn tại, vui lòng chọn email khác</p></c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputHo" class="col-12 col-form-label">Họ tên đệm<span
                            class="text-danger ml-1">*</span></label>
                    <div class="col-12 mb-1">
                        <input type="text" name="hoTenDem" class="form-control" id="inputHo">
                    </div>
                    <p class="col-12 text-danger mb-0" id="tbHoTenDem"></p>
                </div>
                <div class="form-group row">
                    <label for="inputTen" class="col-12 col-form-label">Tên<span
                            class="text-danger ml-1">*</span></label>
                    <div class="col-12">
                        <input type="text" name="ten" class="form-control" id="inputTen">
                    </div>
                    <p class="col-12 text-danger mb-0" id="tbTen"></p>
                </div>
                <div class="form-group row">
                    <label for="inputSDT" class="col-12 col-form-label">Số điện thoại<span
                            class="text-danger ml-1">*</span></label>
                    <div class="col-12">
                        <input type="number" name="soDienThoai" class="form-control" id="inputSDT">
                    </div>
                    <p class="col-12 text-danger mb-0" id="tbSoDienThoai"></p>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-12 col-form-label">Email<span
                            class="text-danger ml-1">*</span></label>
                    <div class="col-12">
                        <input required type="email" name="email" class="form-control" id="inputEmail">
                    </div>
                    <p class="col-12 text-danger mb-0"></p>
                </div>
                <div class="form-group row">
                    <label for="inputMatKhau" class="col-12 col-form-label">Mật khẩu<span
                            class="text-danger ml-1">*</span></label>
                    <div class="col-12">
                        <input type="password" name="matKhau" class="form-control" id="inputMatKhau">
                    </div>
                    <p class="col-12 text-danger mb-0" id="tbMatKhau"></p>
                </div>
                <div class="form-group row">
                    <label for="inputNhapLaiMatKhau" class="col-12 col-form-label">Nhập lại mật khẩu<span
                            class="text-danger ml-1">*</span></label>
                    <div class="col-12">
                        <input type="password" name="nhapLaiMatKhau" class="form-control" id="inputNhapLaiMatKhau">
                    </div>
                    <p class="col-12 text-danger mb-0" id="tbNhapLaiMatKhau"></p>
                </div>

                <div class="form-group row">
                    <div class="col">
                        <button type="submit" id="btnSubmit" class="btn btn-primary btn-block m-auto">
                            Đăng ký
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp"/>
<c:url var="jsRegisterUrl" value="/js/register.js" />
<script src="${jsRegisterUrl}"></script>
</body>
</html>
