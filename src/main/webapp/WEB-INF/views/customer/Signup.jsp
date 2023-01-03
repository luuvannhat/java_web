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
<link rel="stylesheet" href="${base}/css/Signup.css">

</head>

<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<main>
		<div class="container-signup">
		
			<sf:form modelAttribute="signupModel" action="${base}/signup-spring-form" method="POST">
				<h2>Registration form</h2>
				<div class="row-signup">
					<span>First Name</span>
					<sf:input path="firstName" name="firstName"></sf:input>
				</div>
				<div class="row-signup">
					<span>Last Name</span>
					<sf:input path="lastName" name="lastName"></sf:input>
				</div>
				<div class="row-signup">
					<span>Nick Name</span>
					<sf:input path="nickName" name="nickName"></sf:input>
				</div>
				<div class="row-signup">
					<span>Email</span>
					<sf:input path="email" name="email"></sf:input>
				</div>
				<div class="row-signup">
					<span>Password</span>
					<sf:input path="passWord" name="password"></sf:input>
				</div>
				<div class="row-signup">
					<span>Gender</span> <input type="radio" name="gender" checked>Male
					<input type="radio" name="gender"> Female <input
						type="radio" name="gender"> Others
				</div>
				<div class="row-signup">
					<span>Mobile</span>
					<sf:input path="mobile"  name="mobile"></sf:input>
				</div>
				<div class="row-signup">
					<span>Address</span>
					<sf:textarea path="address" name="address" id="" cols="30" rows="5"></sf:textarea>
				</div>
				<div class="btn-signup">
					<button>Submit</button>
					<button>Reset</button>
				</div>
			</sf:form>
		</div>
	</main>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>

</html>