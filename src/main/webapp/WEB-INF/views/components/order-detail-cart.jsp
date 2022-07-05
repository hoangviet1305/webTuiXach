<%@ page import="com.www.entity.ChiTietHoaDon" %><%-- Created by IntelliJ IDEA. User: hoantruong Date: 21/05/2021 Time: 16:15 To change this template use File | Settings
  | File Templates. --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>

    <head>
    </head>

    <body>
      <div class="col-12 order-detail py-3 mb-2">
        <div class="row align-items-center">
          <div class="d-flex col-5 order-detail__left-site">
            <img style="width: 200px; height: 200px;" class="img-thumbnail"
              src="data:image/png;base64, ${param.hinhAnh}"
              alt="item">
            <div class="order-detai-item__left-site__content ml-2">
              <h6 style="text-align: justify">${param.tenSanPham}</h6>
            </div>
          </div>
          <div class="col-7">
            <div class="row align-items-center">
              <div class="col-3 align-self-center">${param.gia}</div>

              <div class="col-3 align-self-center">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <button class="btn btn-outline-secondary" type="button">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-dash" viewBox="0 0 16 16">
                        <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z" />
                      </svg>
                    </button>
                  </div>
                  <input value="${param.soLuong}" type="number" class="form-control" placeholder="" aria-label=""
                    aria-describedby="basic-addon1">
                  <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="button">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-plus" viewBox="0 0 16 16">
                        <path
                          d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                      </svg>
                    </button>
                  </div>
                </div>
              </div>

              <div class="col-3 align-self-center">${param.tongTien}</div>
              <div class="col-3 align-self-center">
                <button type="button" class="btn btn-danger">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash"
                    viewBox="0 0 16 16">
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
      </div>
    </body>

    </html>