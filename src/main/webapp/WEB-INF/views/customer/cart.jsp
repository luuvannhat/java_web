<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- import thư viện spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

<%-- <link rel="stylesheet" href="${base }/js_Subcription/bootstrap.min.css"> --%>

<!-- bootstrap online -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">

<link rel="stylesheet" href="${base }/css/home.css">
</head>

<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>

	<main>
		<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			
			<!-- Danh sách sản phẩm trong giỏ hàng -->
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="border-0 bg-light">
								<div class="p-2 px-3 text-uppercase">Product</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Price</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Quantity</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Remove</div>
							</th>
						</tr>
					</thead>
					<tbody>
						
						<!-- hiển thị danh sách sản phẩm trong giỏ hàng -->
						<!-- cart: là data trên session -->
						<!-- dữ liệu trên session sẽ đọc được ở bất page jsp nào -->
						<c:forEach items="${cart.cartItems }" var="ci">
							<tr>
								<th scope="row" class="border-0">
									<div class="p-2">
										<img src="https://res.cloudinary.com/mhmd/image/upload/v1556670479/product-1_zrifhn.jpg" alt="" width="70" class="img-fluid rounded shadow-sm">
										<div class="ml-3 d-inline-block align-middle">
											<h5 class="mb-0">
												<a href="#" class="text-dark d-inline-block align-middle">
													${ci.productName }
												</a>
											</h5>
											<span class="text-muted font-weight-normal font-italic d-block">Category: Watches</span>
										</div>
									</div>
								</th>
								<td class="border-0 align-middle">
									<fmt:setLocale value="vi_VN" scope="session"/>
									<strong><fmt:formatNumber value="${ci.priceUnit }" type="currency"/></strong>
								</td>
								<td class="border-0 align-middle">
									<button onclick="UpdateQuanlityCart('${base }', ${ci.productId}, -1)" value="-">-</button>
									<strong><span id="quanlity_${ci.productId}">${ci.quanlity }</span></strong>
									<button onclick="UpdateQuanlityCart('${base }', ${ci.productId}, 1)" value="+">+</button>
								</td>
								<td class="border-0 align-middle">
									<a href="#" class="text-dark"><i class="fa fa-trash">Xóa</i></a>
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>

			<!-- form cho việc thanh toán -->
			<form action="${base }/cart/checkout" method="post">
			
				<div class="row py-5 p-4 bg-white rounded shadow-sm">
					<div class="col-lg-6">
						<!-- <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Coupon code</div>
						<div class="p-4">
							<p class="font-italic mb-4">If you have a coupon code, please enter it in the box below</p>
							<div class="input-group mb-4 border rounded-pill p-2">
								<input type="text" placeholder="Apply coupon" aria-describedby="button-addon3" class="form-control border-0">
								<div class="input-group-append border-0">
									<button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill">
										<i class="fa fa-gift mr-2"></i>Apply coupon
									</button>
								</div>
							</div>
						</div> -->
						<div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông tin khách hàng</div>
						<div class="p-4">
						
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerPhone">Họ và tên khách hàng</label>
								<input type="text" class="form-control" id="customerFullName" name="customerFullName" value="${userLogined.username }" placeholder="Full name">
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerEmail">Địa chỉ Email</label>
								<input type="email" class="form-control" id="customerEmail" name="customerEmail" value="${userLogined.email }" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerPhone">Phone</label>
								<input type="tel" class="form-control" id="customerPhone" name="customerPhone" value="${userLogined.phone }" placeholder="Phone">
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerAddress">Địa chỉ giao hàng</label>
								<input type="text" class="form-control" id="customerAddress" name="customerAddress" value="${userLogined.shippingAddress }" placeholder="Address">
							</div>
							
							
						</div>
					</div>
					<div class="col-lg-6">
						<div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông tin thanh toán</div>
						<div class="p-4">
							<p class="font-italic mb-4">Shipping and additional costs are calculated based on values you have entered.</p>
							<ul class="list-unstyled mb-4">
								<li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Order Subtotal </strong><strong>${cart.totalPrice }</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Shipping and handling</strong><strong>$0.00</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tax</strong><strong>$0.00</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong> <h5 class="font-weight-bold totalPrice">${cart.totalPrice}</h5></li>
							</ul>
							<button type="submit" class="btn btn-dark rounded-pill py-2 btn-block">Procceed to checkout</button>
						</div>
					</div>
				</div>

			</form>

		</div>

	</section>
	</main>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>

</body>

</html>