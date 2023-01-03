<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<link rel="stylesheet" href="${base }/css/home.css">
<link rel="stylesheet" href="${base }/css/Subscription.css">
</head>

<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>

	<main>
		<div class="container-subscription">
			<section class="home-newsletter">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div class="single">
								<h2>Subscribe to our Newsletter</h2>
								<div class="input-group">
									<input type="email" class="form-control"
										placeholder="Enter your email"> <span
										class="input-group-btn">
										<button class="btn btn-theme" type="submit" onclick="Submit_Click();">Subscribe</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>

	<!-- footer -->

	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
        	function Submit_Click() {
        		// javascript object.
        		let data = {
       				fullName: 	"Nguyen Van A",
       				email: 		"a@a.com",
       				message: 	"a",
        		};
        		
        		// json == javascript object
        		jQuery.ajax({
        			url: 			"${base}/admin/subcription-ajax",
        			type: 			"post",
        			contentType: 	"application/json",
        			data: 			JSON.stringify(data),

        			dataType: 		"json",
        			success: function(jsonResult) {
        				alert(jsonResult.statusMessage)
        			},
        			error: function(jqXhr, textStatus, errorMessage) {
        				
        			}
        		});
        	}        
        </script>

</body>

</html>