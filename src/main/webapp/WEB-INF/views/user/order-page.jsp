<%--
  Created by IntelliJ IDEA.
  User: hoantruong
  Date: 21/05/2021
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<html>
<head>
    <title>Đơn hàng</title>
</head>
<body>
<%-- Created by IntelliJ IDEA. User: hoantruong Date: 20/05/2021 Time: 15:43 To change this template use File | Settings
  | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Thông tin</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/information_origin.css?v=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/address_style.css?v=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user_order.css?v=1">
</head>

<body>
<jsp:include page="../layout/header.jsp"/>

<div class="wrapper container">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/user">Tài khoản</a></li>
        <li class="breadcrumb-item active" aria-current="page">Địa chỉ</li>
    </ol>
    <!-- Sidebar -->
    <div class="row main">

        <jsp:include page="../layout/left-site.jsp"/>
        <!-- Page Content -->
        <div id="content" class="col-9 main__right-site">
            <!-- We'll fill this with dummy content -->
            <div class="main__right-site__wrap-content main-content">
                <div class="row main-content__title ">
                    <div class="col-12 main-content__title__top">
                        <nav class="col-12 nav nav-pills nav-justified">
                            <a class="nav-item nav-link ${param.state == 'all' || param.state == null || (param.state != 'choxacnhan' && param.state != 'danglayhang' && param.state != 'danggiaohang' && param.state != 'danhanhang' && param.state != 'dahuy') ? 'active' : '' }"
                               href="${pageContext.request.contextPath}/user/order">Tất cả</a>
                            <a class="nav-item nav-link ${param.state == 'choxacnhan' ? 'active' : '' }" href="${pageContext.request.contextPath}/user/order?state=choxacnhan">Chờ
                                xác nhận</a>
                            <a class="nav-item nav-link ${param.state == 'danglayhang' ? 'active' : '' }" href="${pageContext.request.contextPath}/user/order?state=danglayhang">Đang
                                lấy hàng</a>
                            <a class="nav-item nav-link ${param.state == 'danggiaohang' ? 'active' : '' }" href="${pageContext.request.contextPath}/user/order?state=danggiaohang">Đang
                                giao hàng</a>
                            <a class="nav-item nav-link ${param.state == 'danhanhang' ? 'active' : '' }" href="${pageContext.request.contextPath}/user/order?state=danhanhang">Đã
                                nhận hàng</a>
                            <a class="nav-item nav-link ${param.state == 'dahuy' ? 'active' : '' }" href="${pageContext.request.contextPath}/user/order?state=dahuy">Đã hủy</a>

                        </nav>
                    </div>
                    <div class="col-12">
                        <hr>
                    </div>
                </div>
                <div class="row main-content__content mt-2">
                    <rapid:block name="content">
                        here is content
                    </rapid:block>
                </div>
            </div>


        </div>
    </div>

</div>
<jsp:include page="../layout/footer.jsp"/>
</body>

</html>
</body>
</html>
