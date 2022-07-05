<%-- Created by IntelliJ IDEA. User: hoantruong Date: 21/05/2021 Time: 13:56 To change this template use File | Settings
  | File Templates. --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

      <rapid:override name="content">
        <div class="col-12">
          <div class="form-group has-search">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
              class="form-control-feedback bi bi-search" viewBox="0 0 16 16">
              <path
                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
            </svg>
            <input type="text" class="form-control" placeholder="Tìm kiếm theo ID đơn hàng...">
          </div>
        </div>

        <div class="col-12">
          <div class="row list-item">
            
            <jsp:include page="../components/orderitem/order-item.jsp"/>
            <jsp:include page="../components/orderitem/order-item.jsp"/>
          </div>
        </div>
      </rapid:override>

      <%@include file="order-page.jsp" %>