<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hoantruong
  Date: 20/05/2021
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:url var="cssLoginUrl" value="/css/login_style.css?v=1" />
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="${cssLoginUrl}">
</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<div layout:fragment="content" class="login container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <c:url var="homePageUrl" value="/" />
            <li class="breadcrumb-item"><a href="${homePageUrl}">Trang chủ</a></li>
            <c:url var="userPageUrl" value="/user" />
            <li class="breadcrumb-item"><a href="${userPageUrl}">Tài khoản</a></li>
            <li class="breadcrumb-item active" aria-current="page">Đăng nhập</li>
        </ol>
    </nav>
    <div class="login__form my-5">
        <h5>Đăng nhập tài khoản</h5>
        <p>
            <c:url var="registerPageUrl" value="/user/register" />
            Bạn chưa có tài khoản <a href="${registerPageUrl}">Đăng ký tại đây</a>
        </p>
        <div class="main-content login__form__wrap-form pt-3">

            <c:url var="actionLoginFormUrl" value="/j_spring_security_check" />
            <form class="m-auto"  action="${actionLoginFormUrl}" method="POST">
                <div class="form-group row">

                    <div class="col">
                        <c:choose>
                            <c:when test="${param.error}"><p class="error">Email hoặc mật khẩu không chính xác!</p></c:when>
                            <c:when test="${param.logout}"><p class="success">Bạn đã đăng xuất.</p></c:when>
                            <c:when test="${param.susscess}"><p class="success">Bạn đã đăng ký thành công tài khoản.</p></c:when>
                        </c:choose>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <input type="email" name="email" class="form-control"
                               id="inputEmail3">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-10">
                        <input type="password" name="password" class="form-control"
                               id="inputPassword3">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col">
                        <p>
                            <c:url var="forgotPasswordUrl" value="/forgotpassword" />
                            Quên mật khẩu? ấn vào <a href="${forgotPasswordUrl}">đây</a>
                        </p>
                    </div>

                </div>
                <div class="form-group row">
                    <div class="col">
                        <button type="submit" class="btn btn-primary btn-block m-auto">
                            Đăng nhập
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp"/>
</body>
</html>
