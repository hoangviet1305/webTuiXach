<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Created by IntelliJ IDEA. User: hoantruong Date: 20/05/2021 Time: 15:43 To change this template use File | Settings
  | File Templates. --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>

    <head>
      <title>Thông tin</title>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/information_origin.css?v=1">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/address_style.css?v=1">

    </head>

    <body>
      <jsp:include page="../layout/header.jsp" />

      <div class="wrapper container">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/user">Tài khoản</a></li>
          <li class="breadcrumb-item active" aria-current="page">Địa chỉ</li>
        </ol>
        <!-- Sidebar -->
        <div class="row main">

          <jsp:include page="../layout/left-site.jsp" />
          <!-- Page Content -->
          <div id="content" class="col-9 main__right-site">
            <!-- We'll fill this with dummy content -->
            <div class="main__right-site__wrap-content main-content">
              <div class="row main-content__title ">
                <div class="col-12 main-content__title__top">
                  <h4 class="mb-0">Địa chỉ của tôi</h4>
                  <button data-toggle="modal" data-target="#exampleModal" type="button" class="btn btn-danger">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                      class="bi bi-plus-lg" viewBox="0 0 16 16">
                      <path
                        d="M8 0a1 1 0 0 1 1 1v6h6a1 1 0 1 1 0 2H9v6a1 1 0 1 1-2 0V9H1a1 1 0 0 1 0-2h6V1a1 1 0 0 1 1-1z" />
                    </svg>
                    Thêm địa chỉ
                  </button>
                </div>
                <div class="col-12">
                  <hr>
                </div>
              </div>
              <div class="row main-content__content mt-4">
                <c:forEach items="${nguoiDung.getDiaChis()}" var="diaChi">
                  <div class="col-12 item">
                    <div class="item__left-site">
                      <div class="row">
                        <div class="col-3">
                          Họ Tên
                        </div>
                        <div class="col-9">
                          <b>${diaChi.getTenNguoiNhan()}</b>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-3">
                          Số điện thoai
                        </div>
                        <div class="col-9">
                          <b>${diaChi.getSoDienThoai()}</b>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-3">
                          Địa chỉ
                        </div>
                        <div class="col-9">
                          <p class="mb-0">${diaChi.getChiTiet()}</p>
                          <p class="mb-0">${diaChi.getPhuongXa()}</p>
                          <p class="mb-0">${diaChi.getQuanHuyen()}</p>
                          <p class="mb-0">${diaChi.getTinhThanhPho()}</p>
                        </div>
                      </div>
                    </div>
                    <div class="item__right-site">
                      <div class="row">
                        <div class="col">
                          <button type="button" class="btn btn-warning">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-pencil-square" viewBox="0 0 16 16">
                              <path
                                      d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                              <path fill-rule="evenodd"
                                    d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                            </svg>
                            Sửa
                          </button>
                        </div>
                        <div class="col">
                          <button type="button" class="btn btn-danger">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-trash" viewBox="0 0 16 16">
                              <path
                                      d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                              <path fill-rule="evenodd"
                                    d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                            </svg>
                            Xóa
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:forEach>

              </div>
            </div>


          </div>
        </div>

      </div>
      <!-- Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Thêm địa chỉ mới</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form method="Post" action="${pageContext.request.contextPath}/user/add-address" id="myform">
                <div class="form-group">
                  <label for="tenNguoiNhan">Tên người nhận</label>
                  <input type="text" name="tenNguoiNhan" class="form-control" id="tenNguoiNhan">
                </div>
                <div class="form-group">
                  <label for="soDienThoai">Số điện thoại</label>
                  <input type="text" name="soDienThoai" class="form-control" id="soDienThoai">
                </div>
                <div class="form-group">
                  <label for="tinhThanhPho">Tỉnh/Thành phố</label>
                  <select name="tinhThanhPho" class="form-control" id="tinhThanhPho">
                    <option>Thành phố Hồ Chí Minh</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="quanHuyen">Quận/Huyện</label>
                  <select name="quanHuyen" class="form-control" id="quanHuyen">
                    <option>Quận 1</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="phuongXa">Phường Xã</label>
                  <select name="phuongXa" class="form-control" id="phuongXa">
                    <option>Phường 3</option>
                  </select>
                </div>

                <div class="form-group">
                  <label for="chiTiet">Chi tiết(số nhà, tên đường, tòa nhà,...)</label>
                  <input name="chiTiet" type="text" class="form-control" id="chiTiet">
                </div>

                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="label" id="inlineRadio1" value="1">
                  <label class="form-check-label" for="inlineRadio1">Nhà riêng</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="label" id="inlineRadio2" value="2">
                  <label class="form-check-label" for="inlineRadio2">Công ty</label>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button  type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button form="myform" type="submit" class="btn btn-primary">Thêm</button>
            </div>
          </div>
        </div>
      </div>
      <jsp:include page="../layout/footer.jsp" />
      <script>
        $(document).ready(function () {

        })
      </script>
    </body>

    </html>