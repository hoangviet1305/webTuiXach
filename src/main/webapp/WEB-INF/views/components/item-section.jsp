<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
</head>
<body>
	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 ">
				<table>
					<tbody>
						<tr>

							<c:forEach items="${sanPham}" var="sp" begin="0" end="4">
								<td><div class="col mb-5">
										<div class="card h-100">
											<!-- Product image-->
											<img class="card-img-top"
												src="data:image/png;base64, ${sp.getAnhDaiDienBase64()}"
												alt="image" />
											<!-- Product details-->
											<div class="card-body p-4">
												<div class="text-center">
													<!-- Product name-->
													<h5 class="fw-bolder">
														<c:out value="${sp.ten}" />
													</h5>
													<!-- Product price-->
													<c:out value="${sp.gia}" />
												</div>
											</div>
											<!-- Product actions-->
											<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
												<div class="text-center">
													<c:url var="viewUrl" value="/showFormItemProduct">
														<c:param name="sanpham" value="${sp.id}" />
													</c:url>
													
													<a class="btn btn-outline-dark mt-auto" href="${viewUrl}">View
														options</a>
												</div>
											</div>
										</div>
									</div></td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach items="${sanPham}" var="sp" begin="5" end="9">
								<td><div class="col mb-5">
										<div class="card h-100">
											<!-- Product image-->
											<img class="card-img-top"
												src="data:image/png;base64, ${sp.getAnhDaiDienBase64()}"
												alt="image" />
											<!-- Product details-->
											<div class="card-body p-4">
												<div class="text-center">
													<!-- Product name-->
													<h5 class="fw-bolder">
														<c:out value="${sp.ten}" />
													</h5>
													<!-- Product price-->
													<c:out value="${sp.gia}" />
												</div>
											</div>
											<!-- Product actions-->
											<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
												<div class="text-center">
													<c:url var="viewUrl" value="/showFormItemProduct">
														<c:param name="sanpham" value="${sp.id}" />
													</c:url>
													
													<a class="btn btn-outline-dark mt-auto" href="${viewUrl}">View
														options</a>
												</div>
											</div>
										</div>
									</div></td>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
<!-- Bootstrap core JS-->

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</html>