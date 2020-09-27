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

<style type="text/css">
html {
	height: 100%;
}

body {
	height: 100%;
	background-color: #2c2929;
	/*
    background-color:  rgb(32, 31, 31);
    background-color: #CCCCCC;
      Background-color: #FFFFFF;
    */
}

.container-fluid {
	size: 150%;
	border: none;
}

.form-container {
	top: 20vh;
	background: #B3B3B3;
	padding: 32px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px 0px #000;
	text-align: center;
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

.question {
	background-color: #B3B3B3;
	border: none;
	font-size: 150%;
}

a.privacy-policy {
	color: green;
}

.existing-user {
	color: white;
}

.btn {
	background-color: #444749;
	border-radius: 4px;
}

.tab {
	display: none;
}

.step {
	display: none;
}
</style>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- Bootstrap Multiselect CSS -->
<link rel="stylesheet" href="css/bootstrap-multiselect.css">

<!-- Bootstrap Multiselect JS -->
<script data-main="dist/js/" src="js/require.min.js"></script>

<link rel="stylesheet" href="registration-style.css">
</head>

<body>
	<div class="container-fluid">
		<div class="row justify-content-center align-items-center">
			<form:form
				class="form-container col-xl-6 col-lg-6 col-md-8 col-sm-12 col-12"
				method="POST" modelAttribute="userModel" action="sign-up">
				<div id="sign-up" class="step">
					<div class="form-group">
						<form:input class="form-control user" id="name" path="name"
							placeholder="User Name" />
					</div>

					<div class="form-group">
						<form:input class="form-control user" id="mobile" path="mobile"
							placeholder="123-456-7890" />
					</div>

					<div class="form-group">
						<form:input class="form-control user" id="dob" path="dob"
							placeholder="Date of Birth" />
					</div>

					<div class="form-group">
						<form:input class="form-control user" id="zip" path="zip"
							placeholder="Zip Code" />
					</div>

					<div class="form-group">
						<form:password class="form-control password" id="password"
							path="password" placeholder="Password" />
					</div>

					<div class="form-group">
						<input type="password" class="form-control user"
							id="confirmPassword" placeholder="Confirm Password" />
					</div>

					<div class="form-group form-check float-left">
						<input type="checkbox" class="form-check-input "
							id="privacy-policy"> <small> <label
							class="form-check-label" for="privacy-policy">I agree
								with</label> <a href=# class="privacy-policy">Privacy Policy</a>
						</small>
					</div>

					<div class="form-group">
						<button type="button" id="signupBtn" class="btn btn-dark">Sign
							up</button>
					</div>
				</div>

				<div id="s1" class="step">
					<fieldset>
						<div class="form-group">
							<p class="form-control user question">What social Media
								accounts do you have?</p>
						</div>

						<div class="form-group">
							FACEBOOK
							<form:checkbox path="soicalMediaAccounts" value="FACEBOOK" />
							<br>
							<br> TWITTER
							<form:checkbox path="soicalMediaAccounts" value="TWITTER" />
							<br>
							<br> INSTAGRAM
							<form:checkbox path="soicalMediaAccounts" value="INSTAGRAM" />
							<br>
							<br> SNAPCHAT
							<form:checkbox path="soicalMediaAccounts" value="SNAPCHAT" />
							<br>
							<br>
						</div>

						<div class="form-group">
							<button type="button" id="backBtn1"
								class="btn btn-dark float-left">Back</button>
							<button type="button" id="nextBtn1"
								class="btn btn-dark float-right">Next</button>
						</div>
					</fieldset>
				</div>

				<div id="s2" class="step">
					<fieldset>
						<div class="form-group">
							<p class="form-control user question">How many hours per day
								do you spend online?</p>
						</div>
						<div class="form-group">
							<form:select path="hrsOnline">
								<form:option value="1" label="1" />
								<form:option value="2" label="2" />
								<form:option value="3" label="3" />
								<form:option value="4" label="4" />
							</form:select>
						</div>

						<div class="form-group">
							<button type="button" id="backBtn2"
								class="btn btn-dark float-left">Back</button>
							<button type="button" id="nextBtn2"
								class="btn btn-dark float-right">Next</button>
						</div>
					</fieldset>
				</div>

				<div id="s3" class="step">
					<fieldset>
						<div class="form-group">
							<p class="form-control user question">Are you mainly online
								for business or leisure?</p>
						</div>

						<div class="form-group">
							BUSINESS :
							<form:radiobutton path="onlineFor" value="BUSINESS" />
							<br>
							<br> LEISURE :
							<form:radiobutton path="onlineFor" value="LEISURE" />
						</div>

						<div class="form-group">
							<button type="button" id="backBtn3"
								class="btn btn-dark float-left">Back</button>
							<button type="button" id="nextBtn3"
								class="btn btn-dark float-right">Next</button>
						</div>
					</fieldset>
				</div>

				<div id="s4" class="step">
					<fieldset>
						<div class="form-group">
							<p class="form-control user question">Is your business solely
								Internet based?</p>
						</div>
						<div class="form-group">
							YES :
							<form:radiobutton path="isBusinessInternetBased" value="YES" />
							<br>
							<br> NO :
							<form:radiobutton path="isBusinessInternetBased" value="NO" />
						</div>
						<div class="form-group">
							<button type="button" id="backBtn4"
								class="btn btn-dark float-left">Back</button>
							<button type="button" id="nextBtn4"
								class="btn btn-dark float-right">Next</button>
						</div>
					</fieldset>
				</div>

				<div id="s5" class="step">
					<fieldset>
						<div class="form-group">
							<p class="form-control user question">Are you Internet
								influencer?</p>
						</div>
						<div class="form-group">
							YES :
							<form:radiobutton path="isInternetInfluencer" value="YES" />
							<br>
							<br> NO :
							<form:radiobutton path="isInternetInfluencer" value="NO" />
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

<script>
	var page_number = 1;

	$(document).ready(function() {

		$("#sign-up").show("slow");
		//$("#backBtn1").attr("disabled", true);

		// Binding all next buttons
		$("#signupBtn").click(function() { 

			//alert($("#password"));
			
			//if ($("#password") === $("#confirmPassword")) {
				$(".step").hide("fast");
				$("#s1").show("slow");
			//}
			//else
			//	alert("password do not match");
		});

		$("#nextBtn1").click(function() {
			$(".step").hide("fast");
			$("#s2").show("slow");
		});

		$("#nextBtn2").click(function() {
			$(".step").hide("fast");
			$("#s3").show("slow");
		});

		$("#nextBtn3").click(function() {
			$(".step").hide("fast");
			$("#s4").show("slow");
		});

		$("#nextBtn4").click(function() {
			$(".step").hide("fast");
			$("#s5").show("slow");
		});

		// Binding all back buttons
		$("#backBtn1").click(function() {
			$(".step").hide("fast");
			$("#sign-up").show("slow");
		});

		$("#backBtn2").click(function() {
			$(".step").hide("fast");
			$("#s1").show("slow");
		});

		$("#backBtn3").click(function() {
			$(".step").hide("fast");
			$("#s2").show("slow");
		});

		$("#backBtn4").click(function() {
			$(".step").hide("fast");
			$("#s3").show("slow");
		});

		$("#backBtn5").click(function() {
			$(".step").hide("fast");
			$("#s4").show("slow");
		});

	});
</script>

</html>