<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.www.entity.DiaChi" %>
<%@ page import="com.www.entity.NguoiDung" %><%-- Created by IntelliJ IDEA. User: hoantruong Date: 31/05/2021 Time: 01:18 To change this template use File | Settings
  | File Templates. --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>

    <head>
      <title>Title</title>
    </head>

    <body>
      <jsp:include page="layout/header.jsp" />
      <div class="container">
        <div class="row wrap-content ">
          <div class="col-12">
            <c:if test="${param.success}">
              <div class="row">
                <div class="col-12">
                  <div class="alert alert-success" role="alert">
                    Đặt hàng thành công. Tiếp tục mua hàng nào.
                  </div>
                </div>
              </div>
            </c:if>

            <c:if test="${param.failure}">
              <div class="row">
                <div class="col-12">
                  <div class="alert alert-danger" role="alert">
                    Đặt hàng không thành công, có lỗi xảy ra.
                  </div>
                </div>
              </div>
            </c:if>



            <div class="row dia-chi py-4 mb-3" style="background-color: #FFF;">
              <div class="col-12">
                <!-- code dia chi here -->
                <div class="top-site">
                  <h3>Địa chỉ nhận hàng</h3>
                </div>
                <div class="bottom-site d-flex">
                  <p><b>${nguoiDung.getHoTenDem()} ${nguoiDung.getTen()}</b></p>
                  <p class="ml-2"><b>${nguoiDung.getSoDienThoai()}</b></p>
                  <%
                    NguoiDung nguoiDung = (NguoiDung) request.getAttribute("nguoiDung");
                    DiaChi diaChi1 = null;
                    if (nguoiDung.getDiaChis() != null) {
                      for (DiaChi diaChi : nguoiDung.getDiaChis()) {
                        diaChi1 = diaChi;
                        break;
                      }

                    }

                  %>
                  <p class="ml-2">phường/xã <%=diaChi1.getPhuongXa()%>, quận/huyện <%=diaChi1.getQuanHuyen()%>, tỉnh/thành phố <%=diaChi1.getTinhThanhPho()%></p>
                  <a class="ml-2" href=#>Thay đổi</a>
                </div>
              </div>
            </div>

            <div class="row list-san-pham py-4 mb-3" style="background-color: #FFF;">
              <div class="col-12">
                <!-- code danh sach san pham here -->
                <div class="top-site">
                  <h3>Danh sách sản phẩm</h3>
                  <hr />
                  <c:forEach items="${cart.getChiTietHoaDons()}" var="chiTietHoaDon">
                    <jsp:include page="components/order-detail-cart.jsp" >
                      <jsp:param name="tenSanPham" value="${chiTietHoaDon.getSanPham().getTen()}"/>
                      <jsp:param name="gia" value="${chiTietHoaDon.tinhGiaBanFormat()}"/>
                      <jsp:param name="soLuong" value="${chiTietHoaDon.getSoLuong()}"/>
                      <jsp:param name="tongTien" value="${chiTietHoaDon.getTongTienFormat()}"/>
                      <jsp:param name="maSanPham" value="${chiTietHoaDon.getSanPham().getId()}"/>
                      <jsp:param name="hinhAnh" value="${chiTietHoaDon.getSanPham().getAnhDaiDienBase64()}"/>
                    </jsp:include>
                  </c:forEach>

                </div>
              </div>
            </div>

            <div class="row thanh-tien py-4" style="background-color: #FFF;">
              <div class="col-12">
                <!-- code thanh tien here -->
                <div class="row top-site">
                  <div class="col-12">
                    <h3>Thanh toán hóa đơn</h3>
                  </div>
                  <div class="col-12">
                    <hr />
                  </div>
                </div>
                <div class="row midle-site">
                  <div class="col-8"></div>
                  <div class="col-4">
                    <div class="row">
                      <div class="col-7">Tổng tiền hàng</div>
                      <div class="col-5">${cart.getTongTienChiTietHoaDonFormat()}</div>
                    </div>
                    <div class="row">
                      <div class="col-7">Chi phí vận chuyển</div>
                      <div class="col-5">0đ</div>
                    </div>
                    <div class="row">
                      <div class="col-7">Tổng thanh toán</div>
                      <div class="col-5">${cart.getTongTienChiTietHoaDonFormat()}</div>
                    </div>
                  </div>
                  <div class="col-12">
                    <hr/>
                  </div>
                </div>
                <div class="row bottom-site mt-3">
                  <div class="col-8"></div>
                  <div class="col-4">
                    <a href="${pageContext.request.contextPath}/order/add" class="btn btn-danger btn-block">Đặt hàng</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>


      <jsp:include page="layout/footer.jsp" />
    <script>
      $(document).ready(function () {
        let searchParams = new URLSearchParams(window.location.search)
        if (searchParams.has('success')){
          setTimeout(function(){ window.location.replace("${pageContext.request.contextPath}/"); }, 3000);
        }
      })
    </script>
    </body>

    </html>