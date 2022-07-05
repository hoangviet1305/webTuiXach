<%--
  Created by IntelliJ IDEA.
  User: hoantruong
  Date: 19/05/2021
  Time: 02:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<footer class="container py-3 mt-5">
    <div class="row">
        <div class="col-7">
            <h5>CÔNG TY TNHH TM DV VĂN PHÒNG PHẨM FAST</h5>
            <p>
                Địa chỉ: 63 Nguyễn Chí Thanh, Phường 16, Quận 11, TP.HCM (Vui lòng
                gọi trước)
            </p>
            <h5>Email: vanphongphamfast@gmail.com</h5>
            <h5>Hotline: 0964 399 099</h5>
        </div>
        <div class="col-5">
            <div class="row">
                <div class="col-6">
                    <h6>hỗ trợ khách hàng</h6>
                    <p>Hướng dẫn mua hàng</p>
                    <p>Tải bảng báo giá</p>
                    <p>Chính sách ưu đãi</p>
                    <p>Chính sách chiết khấu</p>
                    <p>Câu hỏi thường gặp</p>
                </div>
                <div class="col-6">
                    <h6>Chính sách</h6>
                    <p>Chính sách bảo mật</p>
                    <p>Chính sách khách hàng</p>
                    <p>Chính sách đổi trả</p>
                </div>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

        <!-- container-scroller -->
<!-- plugins:js -->
<script src="${pageContext.request.contextPath}/css/assets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="${pageContext.request.contextPath}/css/assets/vendors/chart.js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/css/assets/vendors/progressbar.js/progressbar.min.js"></script>
<script src="${pageContext.request.contextPath}/css/assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
<script src="${pageContext.request.contextPath}/css/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${pageContext.request.contextPath}/css/assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<!-- endinject -->
<!-- Custom js for this page -->
<!-- End custom js for this page -->
<script>
    $(document).ready(function () {
        $("#btnGioHang").click(function() {
            $.get({
                url: "${pageContext.request.contextPath}/cart",
                success: function (response) {
                    console.log('SUCCESS', response);
                    window.location = "${pageContext.request.contextPath}/cart"
                }
            })
        })
    })
</script>
</body>
</html>
