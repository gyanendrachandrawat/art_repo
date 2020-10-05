<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet" href="styles.css">
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/css/login.css">
<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<title>Login</title>

</head>

<body>
	<%=request.getAttribute("loginstatus")%>
	<div class="container-fluid">
		<div class="row justify-content-center align-items-center">
			<form:form
				class="form-container col-xl-4 col-lg-4 col-md-6 col-sm-8 col-12"
				method="POST" modelAttribute="userModel" action="login">
				<div class="form-group">
					<form:input path="mobile" class="form-control user"
						placeholder="Mobile" />
				</div>

				<div class="form-group">
					<form:password path="password" class="form-control password"
						placeholder="Password" />
				</div>

				<div class="form-group form-check">
					<input type="checkbox" class="form-check-input" id="remember_me">

					<small> <label class="form-check-label" for="remember-me">Remember
							Me</label> <a href=# class="forgot-password float-right">Forgot
							Password?</a>
					</small>
				</div>

				<input type="submit" value="Submit" class="btn btn-dark" />
			</form:form>
			<small class="new-user"> New to product? <a href="sign-up"
				class="sign-up">Sign Up </a>
			</small>
		</div>
	</div>
</body>
</html>