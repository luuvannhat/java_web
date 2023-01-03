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
<title>Contact</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet" href="${base}/css/home.css">
<link rel="stylesheet" href="${base}/css/contact.css">

</head>

<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<main>
		<div class="container">

			<%-- <form action="${base}/contact" class="form" method="POST">
				<h2 class="contact-h2">CONTACT US</h2>
				<div>${message}</div>
				<div>
					<c:forEach var="employee" items="${employees}">
						Nhân viên: ${employee.maNv } - ${employee.tenNv }<br />
					</c:forEach>
				</div>
				<p type="Name:">
					<input name="fullName" placeholder="Write your name here.."></input>
				</p>
				<p type="Email:">
					<input name="email"
						placeholder="Let us know how to contact you back.."></input>
				</p>
				<p type="Message:">
					<input name="message"
						placeholder="What would you like to tell us.."></input>
				</p>
				<button>Send Message</button>

			</form> --%>

			<!-- spring-form -->
			<!-- mapping html form => object contact -->
			<sf:form modelAttribute="contactModel" action="${base}/contact-spring-form" class="form"
				method="POST">
				<h2 class="contact-h2">CONTACT US</h2>

				<p type="Họ:">
					<sf:input path="firstName" name="firstName" id="idFirstName" placeholder="Họ"></sf:input>
				</p>
				<p type="Tên:">
					<sf:input path="lastName" name="lastName" id="idLastName" placeholder="Tên"></sf:input>
				</p>
				<p type="Email:">
					<sf:input path="email" name="email" id="idEmail"
						placeholder="Let us know how to contact you back.."></sf:input>
				</p>
				<p type="Message:">
					<sf:input path="message" name="message" id="idMessage"
						placeholder="What would you like to tell us.."></sf:input>
				</p>
				<button>Send Message</button>

			</sf:form>

			<!-- ajax-form -->
			<!-- <form>
				<h2 class="contact-h2">CONTACT US</h2>

				<p type="Họ:">
					<input type="text" name="firstName" id="idFirstName" placeholder="Họ"></input>
				</p>
				<p type="Tên:">
					<input type="text" name="lastName" id="idLastName" placeholder="Tên"></input>
				</p>
				<p type="Email:">
					<input name="email" id="idEmail"
						placeholder="Let us know how to contact you back.."></input>
				</p>
				<p type="Message:">
					<input name="message" id="idMessage"
						placeholder="What would you like to tell us.."></input>
				</p>
				<button type="button" onclick="Submit_Click();">Send
					Message</button>
			</form> -->
		</div>
	</main>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>

	
	<script type="text/javascript">
        	function Submit_Click() {
        		// javascript object.
        		let data = {
        			firstName: 	$("#idFirstName").val(),
        			lastName: 	$("#idLastName").val(),
       				email: 		$("#idEmail").val(),
       				message: 	$("#idMessage").val(),
        		};
        		
        		// json == javascript object
        		jQuery.ajax({
        			url: 			"${base}/contact-ajax",
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