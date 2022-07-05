<%@ page import="org.apache.commons.io.FilenameUtils" %>
  <%@ page import="java.util.regex.Pattern" %>
    <%-- Created by IntelliJ IDEA. User: hoantruong Date: 23/05/2021 Time: 23:41 To change this template use File |
      Settings | File Templates. --%>
      <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <rapid:override name="header">
              <link href="${pageContext.request.contextPath}/css/admin-product.css" rel="stylesheet" />
            </rapid:override>

            <rapid:override name="title">
              hello world
            </rapid:override>

            <rapid:override name="content">
              <div class="row">
                <div class="col-12">
                  <form class="row forms-sample">
                    <div class="col form-group">
                      <label for="exampleInputEmail1">Tên sản phẩm</label>
                      <input type="text" class="form-control p-input" id="exampleInputEmail1"
                        aria-describedby="emailHelp" placeholder="Enter email">
                    </div>
                    <div class="col form-group">
                      <label for="exampleInputPassword1">Thương hiệu</label>
                      <input type="text" class="form-control p-input" id="exampleInputPassword1" placeholder="Password">
                    </div>
                    <div class="col form-group">
                      <label for="exampleSelectGender">Thể loại</label>
                      <select class="form-control" id="exampleSelectGender">
                        <c:forEach items="${listTheLoai}" var="theLoai">
                          <option>${theLoai.getTen()}</option>
                        </c:forEach>
                      </select>
                    </div>
                    <div class="col">
                      <div class="row">
                        <div class="col">
                          <button type="submit" class="btn btn-outline-primary">Lọc</button>
                        </div>
                        <div class="col">
                          <a href="${pageContext.request.contextPath}/product/add" class="btn btn-outline-success">thêm</a>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>

              <div class="row">
                <div class="col-12">
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th> ID </th>
                          <th> Hình ảnh </th>
                          <th> Tên sản phẩm </th>
                          <th> Thương hiệu </th>
                          <th> Thể loại </th>
                          <th> Giá </th>
                          <th> Action </th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${listSanPham}" var="sanPham">
                          <tr>
                            <td>${sanPham.getId()}</td>
                            <td class="py-1">
                              <img
                                      src="data:image/png;base64, ${sanPham.getAnhDaiDienBase64()}"
                                      alt="image" />
                            </td>
                            <td> ${sanPham.getTen()} </td>
                            <td>
                              ${sanPham.getThuongHieu()}
                            </td>
                            <td> ${sanPham.getTheLoai().getTen()} </td>
                            <td> ${sanPham.getGia()} </td>
                            <td>
                              <div class="row">
                                <div class="col"><button type="button" class="btn btn-outline-warning">Sửa</button></div>
                                <div class="col"><button type="button" class="btn btn-outline-danger">Xóa</button></div>
                              </div>
                            </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </rapid:override>
            <%@include file="index.jsp" %>