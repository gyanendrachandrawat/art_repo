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
<link rel="stylesheet" href="/css/connect.css">
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
					<span class="position-absolute user-position"><img
						src="icons/user.png"></span>
					<form:input path="mobile" id="mobile"
						class="form-control user w-100 mx-auto rounded-0 pl-4"
						placeholder="Mobile" />
					<div id="mobileValid"></div>
				</div>

				<div class="form-group">
					<span class="position-absolute lock-position"><img
						src="icons/lock.png"></span>
					<form:password path="password"
						class="form-control password w-100 mx-auto rounded-0 pl-4"
						placeholder="Password" required="true" />
				</div>

				<div class="form-group form-check">
					<input type="checkbox" class="form-check-input" id="remember_me">

					<small> <label
						class="form-check-label color-white ml-2 mt-2" for="remember-me">Remember
							Me</label> <a href=# class="forgot-password float-right ml-2 mt-2">Forgot
							Password?</a>
					</small>
				</div>

				<div class="submit-btn text-center">
					<input id="login" type="submit" value="Submit" class="btn btn-dark" />
				</div>

				<div class="w-50 mx-auto my-auto text-center position-relative">
					<small class="position-absolute new-user">New to product? <a
						href="/sign-up">Sign Up </a>
					</small>
				</div>
			</form:form>
			
			<% if(session.getAttribute("loginSubmitResponse") != null){
						%>
						<p>response : <%=session.getAttribute("loginSubmitResponse").toString() %></p>
						<%} %>
			
		</div>
	</div>
</body>

<script>
	$(document)
			.ready(
					function() {

						$("#login")
								.click(
										function(e) {
											e.preventDefault();
											e.stopPropagation();
											//alert("clicked me..");
											$("#mobileValid")
													.html(
															"<span id="msg">Good to see that working</span>");
										});

						//$('#mobile').get(0).setCustomValidity('gogs rakshas');
					});
</script>
</html>