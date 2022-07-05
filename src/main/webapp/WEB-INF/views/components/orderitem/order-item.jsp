<%-- Created by IntelliJ IDEA. User: hoantruong Date: 21/05/2021 Time: 16:15 To change this template use File | Settings
    | File Templates. --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <html>

        <head>
        </head>

        <body>
            <div class="col-12 order-item mt-3">
                <div class="row order-item__title">
                    <div class="col-12">
                        <h6 class="mb-0">HD2005202100001</h6>
                        <p class="mb-0">Đang giao hàng</p>
                    </div>
                    <div class="col-12">
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 list-order-detail">
                        <jsp:include page="./order-detai-item.jsp" />
                        <jsp:include page="./order-detai-item.jsp" />
                        <jsp:include page="./order-detai-item.jsp" />
                        <jsp:include page="./order-detai-item.jsp" />
                    </div>
                    <div class="col-12 button-view-detai">
                        <p>Tổng số tiền: <span>2.100.100đ</span></p>
                    </div>
                    <div class="col-12 button-view-detai">
                        <button type="button" class="btn btn-danger">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-eye-fill" viewBox="0 0 16 16">
                                <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
                                <path
                                    d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z" />
                            </svg>
                            Xem chi tiết đơn hàng
                        </button>
                    </div>
                    <div class="col-12">
                        <hr>
                    </div>
                </div>
            </div>
        </body>

        </html>