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

<link rel="stylesheet" href="css/signup.css">

<script type="text/javascript" src="js/signup.js"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="row justify-content-center align-items-center">
			<form:form
				class="form-container col-xl-4 col-lg-6 col-md-8 col-sm-12 col-12"
				method="POST" modelAttribute="userModel" action="sign-up"
				id="registrationForm">
				<div id="signupForm" class="step">
					<div class="form-group">
						<span class="position-absolute all-img-icon"><img
							src="/icons/user.png"></span>
						<form:input class="form-control user w-100 mx-auto" id="name"
							path="name" placeholder="User Name" required="true"/>
						<span id="nameValidation"></sapn>
					</div>

					<div class="form-group">
						<span class="position-absolute all-img-icon"><img
							src="/icons/user.png"></span>
						<form:input class="form-control user w-100 mx-auto" id="mobile"
							path="mobile" placeholder="123-456-7890" required="true"/>
						<span id="mobileValidation"></span>
					</div>

					<div class="form-group">
						<span class="position-absolute all-img-icon"><img
							src="/icons/clock-black.png"></span>
						<form:input class="form-control user w-100 mx-auto" id="dob"
							path="dob" placeholder="Date of Birth" required="true"/>
						<span id="dobValidation"></span>

					</div>

					<div class="form-group">
						<span class="position-absolute all-img-icon"><img
							src="/icons/envelope-black.png"></span>
						<form:input class="form-control user w-100 mx-auto" id="zip"
							path="zip" placeholder="Zip Code" required="true"/>
						<span id="zipValidation"></span>

					</div>

					<div class="form-group">
						<span class="position-absolute all-img-icon"><img
							src="/icons/lock.png"></span>
						<form:password class="form-control password w-100 mx-auto"
							id="password" path="password" placeholder="Password" required="true"/>
						<span id="passwordValidation"></span>

					</div>

					<div class="form-group">
						<span class="position-absolute all-img-icon"><img
							src="/icons/lock.png"></span> <input type="password"
							class="form-control user w-100 mx-auto" id="confirmPassword"
							placeholder="Confirm Password" required/>
						<span id="confirmPasswordValidation"></span>
					</div>

					<div class="form-group form-check float-left d-inline-block">
						<input type="checkbox" class="form-check-input mt-2"
							id="privacy-policy"> <small> <label
							class="form-check-label mt-1" for="privacy-policy">I
								agree with </label> <a href=# class="privacy-policy">Privacy Policy</a>
						</small>
					</div>

					<div class="form-group">
						<p class="form-group float-left w-100" id="privacyValidation"></p>
					</div>

					<div class="form-group">
						<button type="button" id="signupBtn"
							class="btn btn-dark text-center mt-2 w-25">Sign up</button>
					</div>
					<div class="w-50 mx-auto my-auto text-center position-relative">
						<small class="position-absolute exist-user">Existing User?
							<a href="/" class="">Login </a>
						</small>
					</div>
				</div>

				<div id="soicalMediaAccountsForm" class="step">
					<fieldset>

						<div class="form-group">
							<div class="ques-option">
								<span><img class="mb-2" src="/icons/information.png"
									alt="info"></span>
								<p class="form-control question">What social Media accounts
									do you have?</p>
							</div>
							<div class="option">
								<!-- <checkbox path="soicalMediaAccounts" class="soicalMediaAccounts" value="Facebook" />
                  <p class="opt">Facebook</p>
                <checkbox path="soicalMediaAccounts" class="soicalMediaAccounts" value="Twitter" />
                  <p class="opt">Twitter</p>
                <checkbox path="soicalMediaAccounts" class="soicalMediaAccounts" value="Instagram" />
                  <p class="opt">Instagram</p>
                <checkbox path="soicalMediaAccounts" class="soicalMediaAccounts" value="Snapchat" />
                  <p class="opt">Snapchat</p> -->
								<label class="opt">Facebook <form:checkbox
										path="soicalMediaAccounts" class="soicalMediaAccounts"
										value="Facebook" /> <span class="checkmark"></span>
								</label> <label class="opt">Instagram <form:checkbox
										path="soicalMediaAccounts" class="soicalMediaAccounts"
										value="Instagram" /> <span class="checkmark"></span>
								</label> <label class="opt">Twitter <form:checkbox
										path="soicalMediaAccounts" class="soicalMediaAccounts"
										value="Twitter" /> <span class="checkmark"></span>
								</label> <label class="opt">Snapchat <form:checkbox
										path="soicalMediaAccounts" class="soicalMediaAccounts"
										value="Snapchat" /> <span class="checkmark"></span>
								</label> <label class="opt">Gmail <form:checkbox
										path="soicalMediaAccounts" class="soicalMediaAccounts"
										value="Gmail" /><span class="checkmark"></span>
								</label>
							</div>
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
						<!-- <div class="form-group">
							<p class="form-control user question">How many hours per day
								do you spend online?</p>
						</div> -->
						<div class="form-group">
							<div class="ques-option mb-3">
								<span><img class="mb-2" src="/icons/information.png"
									alt="info"></span>
								<p class="form-control question">How many hours per day do
									you spend online?</p>
							</div>
							<form:input class="hr-spend" path="hrsOnline" value="1"
								id="hrsOnline" maxlength="2" size="2" />
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
						<!-- <div class="form-group">
							<p class="form-control user question">Are you mainly online
								for business or leisure?</p>
						</div> -->

						<div class="form-group">
							<div class="ques-option mb-3">
								<span><img class="mb-2" src="/icons/information.png"
									alt="info"></span>
								<p class="form-control question">Are you mainly online for
									business or leisure?</p>
							</div>

							<!-- <radiobutton path="onlineFor" class="onlineFor" value="Business" />
              <p class="opt bg-white">Business</p> -->
							<div class="form-check d-flex">
								<label class="form-check-label bg-white p-1 mb-2 border">
									<form:radiobutton class="form-check-input onlineFor"
										name="optradio" path="onlineFor" value="Business" /> Business
								</label>
							</div>

							<!-- <radiobutton type="radio" path="onlineFor" class="onlineFor" value="Leisure" checked="checked" />
              <p class="opt bg-white">Leisure</p> -->
							<div class="form-check d-flex">
								<label class="form-check-label bg-white p-1 mb-2 border">
									<form:radiobutton class="form-check-input onlineFor"
										name="optradio" path="onlineFor" value="Leisure" checked="true"/> Leisure
								</label>
							</div>

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
						<!-- <div class="form-group">
							<p class="form-control user question">Is your business solely
								Internet based?</p>
						</div> -->
						<div class="form-group">
							<div class="ques-option mb-3">
								<span><img class="mb-2" src="/icons/information.png"
									alt="info"></span>
								<p class="form-control question">Is your business solely
									Internet based?</p>
							</div>

							<!-- Yes:
							<radiobutton path="isBusinessInternetBased" value="Yes" />
							<br> <br> No:
              <radiobutton path="isBusinessInternetBased" value="No" checked="checked" /> -->

							<div class="form-check d-flex">
								<label class="form-check-label bg-white p-1 mb-2 border">
									<form:radiobutton class="form-check-input"
										name="optradio" path="isBusinessInternetBased" value="Yes" />
									Yes
								</label>
							</div>
							<div class="form-check d-flex">
								<label class="form-check-label bg-white p-1 mb-2 border">
									<form:radiobutton class="form-check-input"
										name="optradio" path="isBusinessInternetBased" value="No"
										checked="checked" /> No
								</label>
							</div>

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
						<!-- <div class="form-group">
							<p class="form-control user question">Are you Internet
								influencer?</p>
            </div> -->


						<div class="form-group">
							<div class="ques-option mb-3">
								<span><img class="mb-2" src="/icons/information.png"
									alt="info"></span>
								<p class="form-control question">Are you Internet
									influencer?</p>
							</div>

							<!-- Yes:
							<radiobutton path="isInternetInfluencer" value="Yes" />
							<br> <br> No:
              <radiobutton path="isInternetInfluencer" value="No" checked="checked" /> -->

							<div class="form-check d-flex">
								<label class="form-check-label bg-white p-1 mb-2 border">
									<form:radiobutton class="form-check-input"
										name="optradio" path="isInternetInfluencer" value="Yes" /> Yes
								</label>
							</div>
							<div class="form-check d-flex">
								<label class="form-check-label bg-white p-1 mb-2 border">
									<form:radiobutton class="form-check-input"
										name="optradio" path="isInternetInfluencer" value="No"
										checked="checked" /> No
								</label>
							</div>

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
		<!-- <div class="w-50 mx-auto my-auto text-center position-relative">
			<small class="position-absolute exist-user">Existing User?
				<a href="#" class="">Login </a>
			</small>
		</div> -->
	</div>

</body>

</html>