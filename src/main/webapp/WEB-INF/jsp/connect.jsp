<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Connect-Inviting And Registration</title>

<!-- bootstrap 4 -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
<!-- CDN link for js to create qr code -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- default css -->
<link rel="stylesheet" href="/css/connect.css">
</head>

<body class="backgrond-color-dark">

	<!-- section 1 -->
	<section>
		<nav class="navbar navbar-expand-sm ">

			<!-- left side -->
			<div class="navbar-nav  align-items-center">
				<span class="color-white mr-3"><i
					class="fa fa-angle-left fa-lg" aria-hidden="true"></i> </span>
				<!-- <h4 class="nav-item color-white size-large m-0 mr-4">Dashboard</h4> -->
				<a href="/dashboard"><h4
						class="nav-item color-white size-large m-0 mr-4">Dashboard</h4></a>

				<h5 class="nav-item color-white m-0 mr-1 mb-1">
					<span><i class="fa fa-cube fa-lg" aria-hidden="true"></i></span>
				</h5>
				<h5 class="mr-2 nav-item color-white small m-0">Empower The
					Collective</h5>
				<h5 class="mr-2 mb-2 nav-item color-white">.</h5>
				<h5 class="nav-item color-white small m-0">Dashboard</h5>

			</div>

			<!-- right side -->
			<div class="ml-auto">
				<ul class="navbar-nav float-right align-items-center">
					<li class="nav-item color-white mr-3"><i
						class="fa fa-question-circle-o fa-lg" aria-hidden="true"></i></li>

					<li class="nav-item navbar-brand" data-toggle="dropdown"><span
						class="position-relative"> <img src="/icons/img_avatar.png"
							alt="logo" class="w-40 rounded-circle">
							<ul
								class="dropdown-menu text-center top-40 p-1 pl-2 pr-2 m-0 drp-border">
								<li
									class="divider border-bottom text-secondary p-2 font-weight-bold">Status
									: <span class="color-blue font-weight-bold">Online</span>
								</li>
								<li
									class="divider border-bottom text-secondary p-2 font-weight-bold">Account
									Setting</li>
								<li
									class="divider border-bottom text-secondary p-2 font-weight-bold">Logout</li>
							</ul>
					</span></li>
					<li class="nav-item color-white small">
						<p class="m-0">User_Name</p>
					</li>
				</ul>
			</div>

		</nav>
	</section>

	<!-- section 2 -->
	<section>
		<div class="container-fluid d-inline-block">
			<span class="color-white mr-5 ml-5 float-left size-large">Level
				1</span>
			<div class="progress rounded mt-3 w-75">
				<div class="progress-bar bg-danger w-20"></div>
			</div>
		</div>
	</section>

	<!-- section 3 -->
	<section class="mt-3 ml-5">
		<nav class="navbar navbar-expand-sm ">

			<div
				class="navbar-nav border rounded color-light-gray align-items-center p-1 mr-2 w-8 point pointPending"
				onclick="pendingShow()">
				<span class="mr-1 mt-0 nav-item color-white"> <i
					class="fa fa-clock-o" aria-hidden="true"></i> <!-- <img src="Asset/Images/clock.png" alt="clock" class="color-white"> -->
				</span>
				<p class="mr-2 m-0 nav-item color-white size-16 display-4 mr-auto">Pending</p>
				<p class=" m-0 nav-item color-white size-16 display-4">31</p>
			</div>

			<div
				class="navbar-nav border rounded color-light-gray align-items-center p-1 mr-2 w-10 point pointConnect"
				onclick="connectShow()">
				<span class="mr-1 mt-0 nav-item color-white"><i
					class="fa fa-check" aria-hidden="true"></i></span>
				<p class="mr-2 m-0 nav-item color-white size-16 display-4">Connected</p>
				<p class="m-0 nav-item color-white size-16 display-4">31</p>
			</div>

			<div
				class="navbar-nav border rounded color-light-gray align-items-center p-1 mr-2 w-8 point pointLevel">
				<span class="mr-1 mt-0 nav-item color-white"> <!-- <i class="fa fa-line-chart" aria-hidden="true"></i> -->
					<img src="/icons/profits.png" alt="level">
				</span>
				<p class="mr-2 m-0 nav-item color-white size-16 display-4 mr-auto">Level</p>
				<p class=" m-0 nav-item color-white size-16 display-4">1</p>
			</div>

			<div
				class="navbar-nav border rounded color-light-gray align-items-center p-1 mr-2 w-8 point pointInvite"
				onclick="inviteShow()">
				<span class="mr-1 mt-0 nav-item color-white"><i
					class="fa fa-envelope-o" aria-hidden="true"></i></span>
				<p class=" m-0 nav-item color-white size-16 display-4 mr-auto">Invite</p>
				<!-- <p class="mr-1 m-0 nav-item color-white size-16 display-4"></p> -->
			</div>

		</nav>
	</section>

	<!-- section 4 invite -->
	<div class="sec" id="invite">
		<section class="mt-3 ml-5">
			<div class="container float-left">
				<form>
					<div class="form-group position-relative">
						<label class="color-white">Reference Link</label> <input
							type="text" class="form-control color-grey-lighter" id="refLink"
							name="refLink" value=${link } readonly> <span
							class="copy position-absolute"><img class="mr-2 "
							src="/icons/copy.png">Copy</span>
					</div>
				</form>
			</div>
			<div class="container float-left col-6 w-50">
				<form:form id="inviteForm" class="was-validated" method="POST"
					modelAttribute="connectModel" action="/dashboard/connect">
					<div class="form-group">
						<label class="color-white" for="name">Name:</label>
						<!-- <input type="text" class="form-control color-grey-lighter" id="name" placeholder="Enter Name" name="name" required> -->
						<form:input class="form-control color-grey-lighter" id="name"
							path="name" placeholder="Enter Name" name="name" required="true" />
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div class="form-group">
						<label class="color-white" for="num">Phone:</label>
						<!-- <input type="number" class="form-control color-grey-lighter" id="phone" placeholder="Enter Phone" name="phone" required> -->
						<form:input class="form-control color-grey-lighter" id="mobile"
							path="mobile" placeholder="Enter mobile" name="mobile"
							required="true" />
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div class="input-group form-group h-120">
						<div class="input-group-prepend">
							<span class="mr-3"> <img src="/icons/img_avatar.png"
								alt="logo" class="w-40 rounded-circle">
							</span>
						</div>
						<textarea class="form-control color-grey-lighter"
							aria-label="With textarea" placeholder="Enter custom message"></textarea>
					</div>
					<div class="form-group float-right">
						<span></span>
						<button type="submit" id="inviteBtn"
							class="btn color-grey-lighter font-weight-bold">
							<img src="/icons/send.png" alt="send"> Invite
						</button>
					</div>
				</form:form>
				<% if(session.getAttribute("inviteSubmitResponse") != null){
						%>
						<p>response : <%=session.getAttribute("inviteSubmitResponse").toString() %></p>
						<%} %>
			</div>
			
			<div class="float-left">
				<!-- BAR CODE -->
				<!-- <img class="w-50 h-50 p-4 mt-3" src="/icons/img_avatar.png" alt="barcode" id="barcode"> -->
				<div class="w-50 h-50 p-4 mt-3" id="qrcode"></div>
			</div>
		</section>
	</div>

	<!-- section connect -->

	<div class="sec" id="connect">
		<!-- section 4 -->
		<section class="mt-3 ml-5">
			<div class="container float-left ml-2 mt-5 ">
				<div class="table-title border-top border-right border-left">
					<h4 class="color-white p-4 size-large mb-0">List Of Connected
						Friends</h4>
				</div>
				<div>
					<table class="table table-borderless mb-0">
						<thead class="thead-color color-white border-right border-left">
							<tr>
								<th>Name <span><img src="/icons/up-and-down.png"
										alt="img"></span>
								</th>
								<th>Phone <span><img src="/icons/up-and-down.png"
										alt="img"></span>
								</th>
								<th>Status <span><img src="/icons/up-and-down.png"
										alt="img"></span>
								</th>
								<th>Date <span><img src="/icons/up-and-down.png"
										alt="img"></span>
								</th>
								<th>Action <span><img src="/icons/up-and-down.png"
										alt="img"></span>
								</th>
							</tr>
						</thead>
						<tbody class="color-white tbody-color" id="connectedbody">

						</tbody>
					</table>
				</div>
				<div
					class="table-bottom border-bottom border-right border-left w-100 d-inline-block pt-3">
					<ul class="pagination float-right">
						<li class="disabled"><a href="#">«</a></li>
						<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">»</a></li>
					</ul>
				</div>
			</div>
		</section>

	</div>

	<!-- section pending -->

	<div class="sec" id="pending">
		<!-- section 4 -->
		<section class="mt-3 ml-5">
			<div class="container float-left ml-2 mt-5 ">
				<div class="table-title border-top border-right border-left">
					<h4 class="color-white p-4 size-large mb-0">List Of Pending
						Referred Friends</h4>
				</div>
				<div>
					<table class="table table-borderless mb-0">
						<thead class="thead-color color-white border-right border-left">
							<tr>
								<th>Name <span><img src="/icons/up-and-down.png"
										alt="img"></span>
								</th>
								<th>Phone <span><img src="/icons/up-and-down.png"
										alt="img"></span>
								</th>
								<th>Status <span><img src="/icons/up-and-down.png"
										alt="img"></span>
								</th>
								<th>Date <span><img src="/icons/up-and-down.png"
										alt="img"></span>
								</th>
								<th>Action <span><img src="/icons/up-and-down.png"
										alt="img"></span>
								</th>
							</tr>
						</thead>
						<tbody class="color-white tbody-color" id="pendingbody">

						</tbody>
					</table>

				</div>
				<div
					class="table-bottom border-bottom border-right border-left w-100 d-inline-block pt-3">
					<ul class="pagination float-right">
						<li class="disabled"><a href="#">«</a></li>
						<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">»</a></li>
					</ul>
				</div>


			</div>
		</section>

	</div>


	<!-- j query -->
	<script>
		$(document).ready(function() {
			//  $("#invite").show();
			inviteShow();
			$("#connect").hide();
			$("#pending").hide();

/* 			$("#inviteForm").submit(function(e) {
				e.stopPropagation();
				e.preventDefault();

				$.ajax({
					type : "post",
					url : "/dashboard/checkInvite?mobile=" + $("#mobile").val(),
					success : function(data) {
						if (data == "registered") {
							alert("user already registered");
						} else if (data == "sent") {
							alert("already sent the invitation to the user");
						} //else if (data == "no")
						//runOnComplete();
						$("#inviteForm").submit();
					},
					error : function(e) {

					}
				});
			}
			); */
				
		});
		/* function runOnComplete() {

		}
		 */
		function inviteShow() {
			$(".sec").hide();
			$("#invite").show();
			$(".point").css("background", "#818489")
			$(".pointInvite").css("background", "#4d5055");

			//CODE FOR QR CODE GENERATION

			$("#qrcode").empty();

			var qrcode = new QRCode("qrcode");

			var codetext = $("#refLink").val();
			console.log("qrcode text value : " + codetext);

			qrcode.makeCode(codetext);

		}
		function connectShow() {
			$(".sec").hide();
			$("#connect").show();
			$(".point").css("background", "#818489")
			$(".pointConnect").css("background", "#4d5055");

			$("#connectedbody").empty();

			$
					.getJSON(
							'/dashboard/inviteData/connected',
							function(data) {

								console.log("data : " + data);
								$(data)
										.each(
												function(i, connectModel) {
													mobile
													$('#connectedbody')
															.append(
																	$("<tr>")
																			.append(
																					$(
																							"<td>")
																							.append(
																									connectModel.name))
																			.append(
																					$(
																							"<td>")
																							.append(
																									connectModel.mobile))
																			.append(
																					$(
																							"<td>")
																							.append(
																									connectModel.status))
																			.append(
																					$(
																							"<td>")
																							.append(
																									connectModel.dateInvite))
																			.append(
																					$(
																							"<td>")
																							.append(
																									"Action")));
												});
							}).done(function() {
						console.log("Completed");
					}).fail(function(e) {
						console.log('error:');
						console.error(e);
					}).always(function() {
						console.log("always runs");
					});

		}
		function pendingShow() {
			$(".sec").hide();
			$("#pending").show();
			$(".point").css("background", "#818489")
			$(".pointPending").css("background", "#4d5055");

			$("#pendingbody").empty();

			$
					.getJSON(
							'/dashboard/inviteData/pending',
							function(data) {
								console.log("data : " + data);
								$(data)
										.each(
												function(i, connectModel) {
													$('#pendingbody')
															.append(
																	$("<tr>")
																			.append(
																					$(
																							"<td>")
																							.append(
																									connectModel.name))
																			.append(
																					$(
																							"<td>")
																							.append(
																									connectModel.mobile))
																			.append(
																					$(
																							"<td>")
																							.append(
																									connectModel.status))
																			.append(
																					$(
																							"<td>")
																							.append(
																									connectModel.dateInvite))
																			.append(
																					$(
																							"<td>")
																							.append(
																									"Action")));
												});
							}).done(function() {
						console.log("Completed");
					}).fail(function(e) {
						console.log('error:');
						console.error(e);
					}).always(function() {
						console.log("always runs");
					});

		}
	</script>


</body>

</html>