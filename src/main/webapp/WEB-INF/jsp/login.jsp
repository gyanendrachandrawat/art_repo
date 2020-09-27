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

<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<title>Login</title>

<style type="text/css">
html {
	height: 100%;
}

body {
	height: 100%;
	background-color: rgb(32, 31, 31);
	/*// background-color: #CCCCCC;
  	// background-color: #FFFFFF;*/
}

a.forgot-password {
	color: #FFFFFF;
}

.form-container {
	top: 30vh;
	background: #B3B3B3;
	padding: 32px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px 0px #000;
}

.form-control {
	border-radius: 8px;
	width: 80%;
	margin: 2%;
	text-indent: 8%;
}

.user {
	background-image: url('./icons/user.jpg');
	background-repeat: no-repeat;
	background-size: 5%;
	background-position: 1.5% 50%;
}

.password {
	background-image: url('./icons/key.png');
	background-repeat: no-repeat;
	background-size: 5%;
	background-position: 2% 50%;
}

.btn {
	background-color: #444749;
	border-radius: 4px;
}

.new-user {
	position: absolute;
	top: 60%;
	color: white;
}

.sign-up {
	color: rgb(0, 140, 255);
}
</style>

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