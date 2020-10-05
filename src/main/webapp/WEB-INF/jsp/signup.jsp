<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Sign up</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- Bootstrap Multiselect CSS -->
<link rel="stylesheet" href="css/bootstrap-multiselect.css">

<!-- Bootstrap Multiselect JS -->
<script data-main="dist/js/" src="js/require.min.js"></script>

<link rel="stylesheet" href="/css/signup.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/sign-up.js"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="row justify-content-center align-items-center">
			<form:form
				class="form-container col-xl-4 col-lg-6 col-md-8 col-sm-12 col-12"
				method="POST" modelAttribute="userModel" action="sign-up" id="registrationForm">
				<div id="signupForm" class="step">
					<div class="form-group">
						<form:input class="form-control user" id="name" path="name"
							placeholder="User Name" />
						<p class="form-group float-left" id="nameValidation"></p>
					</div>

					<div class="form-group">
						<form:input class="form-control user" id="mobile" path="mobile"
							placeholder="123-456-7890" />
						<p class="form-group float-left" id="mobileValidation"></p>
					</div>

					<div class="form-group">
						<form:input class="form-control user" id="dob" path="dob"
							placeholder="Date of Birth" />
						<p class="form-group float-left" id="dobValidation"></p>

					</div>

					<div class="form-group">
						<form:input class="form-control user" id="zip" path="zip"
							placeholder="Zip Code" />
						<p class="form-group float-left" id="zipValidation"></p>

					</div>

					<div class="form-group">
						<form:password class="form-control password" id="password"
							path="password" placeholder="Password" />
						<p class="form-group float-left" id="passwordValidation"></p>

					</div>

					<div class="form-group">
						<input type="password" class="form-control user"
							id="confirmPassword" placeholder="Confirm Password" />
						<p class="form-group float-left" id="confirmPasswordValidation"></p>
					</div>

					<div class="form-group form-check float-left">
						<input type="checkbox" class="form-check-input "
							id="privacy-policy"> <small> <label
							class="form-check-label" for="privacy-policy">I agree
								with</label> <a href=# class="privacy-policy">Privacy Policy</a>
						</small>
					</div>

					<div class="form-group">
						<p class="form-group float-left" id="privacyValidation"></p>
					</div>

					<div class="form-group">
						<button type="button" id="signupBtn" class="btn btn-dark">Sign
							up</button>
					</div>
				</div>

				<div id="soicalMediaAccountsForm" class="step">
					<fieldset>
						<div class="form-group">
							<p class="form-control user question">What social Media
								accounts do you have?</p>
						</div>

						<div class="form-group">
							Facebook
							<form:checkbox path="soicalMediaAccounts"
								class="soicalMediaAccounts" value="Facebook" />
							<br> <br> Twitter
							<form:checkbox path="soicalMediaAccounts"
								class="soicalMediaAccounts" value="Twitter" />
							<br> <br> Instagram
							<form:checkbox path="soicalMediaAccounts"
								class="soicalMediaAccounts" value="Instagram" />
							<br> <br> Snapchat
							<form:checkbox path="soicalMediaAccounts"
								class="soicalMediaAccounts" value="Snapchat" />
							<br> <br>
						</div>

						<div class="form-group">
							<p class="form-group" id="soicalMediaAccountsValidation"></p>
						</div>

						<div class="form-group">
							<button type="button" id="backBtn1"
								class="btn btn-dark float-left">Back</button>
							<button type="button" id="nextBtn1"
								class="btn btn-dark float-right">Next</button>
						</div>
					</fieldset>
				</div>

				<div id="hrsOnlineForm" class="step">
					<fieldset>
						<div class="form-group">
							<p class="form-control user question">How many hours per day
								do you spend online?</p>
						</div>
						<div class="form-group">
							<form:input path="hrsOnline" value="1" id="hrsOnline" maxlength="2" size="2"/>
						</div>

						<div class="form-group">
							<button type="button" id="backBtn2"
								class="btn btn-dark float-left">Back</button>
							<button type="button" id="nextBtn2"
								class="btn btn-dark float-right">Next</button>
						</div>
					</fieldset>
				</div>

				<div id="onlineForForm" class="step">
					<fieldset>
						<div class="form-group">
							<p class="form-control user question">Are you mainly online
								for business or leisure?</p>
						</div>

						<div class="form-group">
							Business :
							<form:radiobutton path="onlineFor" class="onlineFor"
								value="Business" />
							<br> <br> Leisure :
							<form:radiobutton path="onlineFor" class="onlineFor"
								value="Leisure" checked="checked" />
						</div>

						<div class="form-group">
							<p class="form-group" id="onlineForValidation"></p>
						</div>

						<div class="form-group">
							<button type="button" id="backBtn3"
								class="btn btn-dark float-left">Back</button>
							<button type="button" id="nextBtn3"
								class="btn btn-dark float-right">Next</button>
						</div>
					</fieldset>
				</div>

				<div id="isBusinessInternetBasedForm" class="step">
					<fieldset>
						<div class="form-group">
							<p class="form-control user question">Is your business solely
								Internet based?</p>
						</div>
						<div class="form-group">
							Yes:
							<form:radiobutton path="isBusinessInternetBased" value="Yes" />
							<br> <br> No:
							<form:radiobutton path="isBusinessInternetBased" value="No"
								checked="checked" />
						</div>
						<div class="form-group">
							<button type="button" id="backBtn4"
								class="btn btn-dark float-left">Back</button>
							<button type="button" id="nextBtn4"
								class="btn btn-dark float-right">Next</button>
						</div>
					</fieldset>
				</div>

				<div id="isInternetInfluencerForm" class="step">
					<fieldset>
						<div class="form-group">
							<p class="form-control user question">Are you Internet
								influencer?</p>
						</div>
						<div class="form-group">
							Yes:
							<form:radiobutton path="isInternetInfluencer" value="Yes" />
							<br> <br> No:
							<form:radiobutton path="isInternetInfluencer" value="No"
								checked="checked" />
						</div>
						<div class="form-group">
							<button type="button" id="backBtn5"
								class="btn btn-dark float-left">Back</button>
							<button type="submit" id="nextBtn5"
								class="btn btn-dark float-right">Submit</button>
						</div>
					</fieldset>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>