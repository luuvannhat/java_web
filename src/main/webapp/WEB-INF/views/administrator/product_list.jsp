
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>

<link rel="icon" href="${base}/Admin/images/favicon.ico"
	type="image/ico" />

<!-- include summernote css/js -->
<link rel="stylesheet" href="${base }/summernote/summernote.min.css">

<title>Gentelella Alela! |</title>



<!-- Bootstrap -->
<link href="${base }/Admin/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${base }/Admin/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<!-- iCheck -->
<link href="${base }/Admin/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">

<!-- bootstrap-progressbar -->
<link
	href="${base }/Admin/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">

<!-- bootstrap-daterangepicker -->
<link
	href="${base }/Admin/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="${base }/Admin/build/css/custom.min.css" rel="stylesheet">

<link href="${base }/css/productadd.css" rel="stylesheet">


</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<!-- left content -->
			<jsp:include page="/WEB-INF/views/administrator/layout/left.jsp"></jsp:include>

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<div class="nav toggle">
						<a id="menu_toggle"><i class="fa fa-bars"></i></a>
					</div>
					<nav class="nav navbar-nav">
						<ul class=" navbar-right">
							<li class="nav-item dropdown open" style="padding-left: 15px;">
								<a href="javascript:;" class="user-profile dropdown-toggle"
								aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown"
								aria-expanded="false"> <img
									src="${base }/Admin/images/img.jpg" alt="">John Doe
							</a>
								<div class="dropdown-menu dropdown-usermenu pull-right"
									aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="javascript:;"> Profile</a> <a
										class="dropdown-item" href="javascript:;"> <span
										class="badge bg-red pull-right">50%</span> <span>Settings</span>
									</a> <a class="dropdown-item" href="javascript:;">Help</a> <a
										class="dropdown-item" href="login.html"><i
										class="fa fa-sign-out pull-right"></i> Log Out</a>
								</div>
							</li>

							<li role="presentation" class="nav-item dropdown open">

								<ul class="dropdown-menu list-unstyled msg_list" role="menu"
									aria-labelledby="navbarDropdown1">
									<li class="nav-item"><a class="dropdown-item"> <span
											class="image"><img src="${base }/Admin/images/img.jpg"
												alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li class="nav-item"><a class="dropdown-item"> <span
											class="image"><img src="${base }/Admin/images/img.jpg"
												alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li class="nav-item"><a class="dropdown-item"> <span
											class="image"><img src="${base }/Admin/images/img.jpg"
												alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li class="nav-item"><a class="dropdown-item"> <span
											class="image"><img src="${base }/Admin/images/img.jpg"
												alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li class="nav-item">
										<div class="text-center">
											<a class="dropdown-item"> <strong>See All Alerts</strong>
												<i class="fa fa-angle-right"></i>
											</a>
										</div>
									</li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- right content -->
			<div class="right_col" role="main">
				<jsp:include
					page="/WEB-INF/views/administrator/layout/layout_product_list.jsp"></jsp:include>
			</div>





			<!-- footer content -->
			<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
			<!-- /footer content -->
		</div>
	</div>


	<!-- jQuery -->
	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>


	<script type="text/javascript">
			
			function DeleteProduct(productId){
				//tạo javascript object
				var data = {
						id: productId,
				};
				
				//$ === Jquery
				//json === javascript object
				jQuery.ajax({
					url: '${base}'+"/admin/product/delete",
					type: "post",
					contentType: "application/json",
					data: JSON.stringify(data),
					
					dataType: "json",
					success: function(jsonResult){
						location.reload(); //refresh lại trang web
					},
					
					error: function(jqXhr, textStatus, errorMessage){
						alert("error");
					}
				});
				
			}
			
	
			$( document ).ready(function() {
				
				// đặt giá trị của category ứng với điều kiện search trước đó
				$("#categoryId").val(${productSearch.categoryId});
				
				$(function() {
				    $("#paging").pagination({
				    	currentPage: ${products.currentPage}, 	//trang hiện tại
				        items: ${products.totalItems},			//tổng số sản phẩm
				        itemsOnPage: ${products.sizeOfPage}, 	//số sản phẩm trên 1 trang
				        cssStyle: 'light-theme',
				        onPageClick: function(pageNumber, event) {
				        	$('#page').val(pageNumber);
				        	$('#btnSearch').trigger('click');
						},
				    });
				});
			});		
		</script>
</body>

</html>