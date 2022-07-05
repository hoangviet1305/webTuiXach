<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Created by IntelliJ IDEA. User: hoantruong Date: 20/05/2021 Time: 22:00 To change this template use File | Settings
    | File Templates. --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <html>

        <head>
            <title>Title</title>
            <link rel="stylesheet" type="text/css"
                href="${pageContext.request.contextPath}/css/information_style.css?v=2">
            <link rel="stylesheet" type="text/css"
                href="${pageContext.request.contextPath}/css/information_page_style.css?v=2">
        </head>

        <body>
            <nav id="sidebar" class="col-3 main__left-site">
                <div class="main__left-site__header">
                    <c:choose>
                        <c:when test="${nguoiDung.getAvatar() == null}">
                            <img class="rounded-circle" src="https://www.travelcontinuously.com/wp-content/uploads/2018/04/empty-avatar.png"
                                 alt="avatar">
                        </c:when>
                        <c:otherwise>
                            <img class="rounded-circle" src="data:image/png;base64, ${nguoiDung.getAvatarBase64()}"
                                 alt="avatar">
                        </c:otherwise>
                    </c:choose>

                    <div class="name-user">
                        <p>${nguoiDung.getHoTenDem()} ${nguoiDung.getTen()}</p>
                        <a href="${pageContext.request.contextPath}/user">Chỉnh sửa thông tin</a>
                    </div>

                </div>

                <hr />

                <ul class="list-unstyled components">
                    <li class="active">
                        <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle">Tài
                            khoản của tôi</a>
                        <ul class="collapse list-unstyled" id="homeSubmenu">
                            <li>
                                <a href="${pageContext.request.contextPath}/user">Hồ sơ</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/address">Địa chỉ</a>
                            </li>
                            <li>
                                <a href="#">Giỏ hàng</a>
                            </li>
                        </ul>
                    </li>
                    <li class="not-active">
                        <a href="${pageContext.request.contextPath}/user/order">Đơn hàng</a>
                    </li>

                </ul>
            </nav>

        </body>

        </html>