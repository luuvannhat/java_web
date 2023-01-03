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
		<form action="${base }/home" method="get">
			<div class="container1">
				<div class="background-main">
					<div class="bgr-image">
						<img src="${base}/img/home_img/bgr-main.png" alt="">
					</div>
					<div class="bgr-title">
						<div class="bgr-content-title">
							<h2>
								Winter <br> Collection
							</h2>
							<h3>Buy stylish products in our shop</h3>
						</div>
						<div class="btn-shopnow">
							<button type="button">
								Shop now <img src="${base}/img/home_img/arrow-right.png" alt="">
							</button>
						</div>
					</div>
				</div>

				<div class="main-content">
					<h2 class="title">Featured items</h2>
					<div class="desc">let's see featured items!</div>
					<div class="row">
						<c:forEach items="${productHots }" var="productHot"
							varStatus="loop">

							<div class="item">
								<div class="info">
									<a href="#"> <img src="${base}/upload/${productHot.avatar}"
										alt="" width="200" height="200">
									</a>
								</div>
								<div class="desc_product">
									<div class="product_name">
										<a href="#"> ${productHot.title } </a>
									</div>
									<div class="img-start">
										<img src="${base}/img/home_img/img-start.png" alt="">
									</div>
									<div class="product_price">
										<!-- định dạng tiền tệ -->
										<fmt:setLocale value="vi_VN" scope="session" />
										<fmt:formatNumber value="${productHot.price }" type="currency" />
									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a class="btn btn-outline-dark mt-auto" href="#" onclick="AddProductToCart('${base}',${productHot.id },1)"> Add to
												cart </a>
										</div>
									</div>
								</div>
							</div>


						</c:forEach>
					</div>

				</div>

				<div class="main-content-two">
					<h2 class="title">Products Collections</h2>
					<div class="desc">Check out popular products in our shop!</div>
					<div class="row">
						<c:forEach items="${products }" var="product" varStatus="loop">

							<div class="item">
								<div class="info">
									<a href="#"> <img src="${base}/upload/${product.avatar}"
										alt="" width="200" height="200">
									</a>
								</div>
								<div class="desc_product">
									<div class="product_name">
										<a href="#"> ${product.title } </a>
									</div>
									<div class="img-start">
										<img src="${base}/img/home_img/img-start.png" alt="">
									</div>
									<div class="product_price">
										<!-- định dạng tiền tệ -->
										<fmt:setLocale value="vi_VN" scope="session" />
										<fmt:formatNumber value="${product.price }" type="currency" />
									</div>

									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a class="btn btn-outline-dark mt-auto" href="#" onclick="AddProductToCart('${base}',${product.id },1)"> Add to
												cart </a>
										</div>
									</div>
								</div>


							</div>


						</c:forEach>
					</div>


					<div class="btn-more">
						<button type="button">More</button>
					</div>


				</div>
			</div>
		</form>
	</main>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>

</body>

</html>