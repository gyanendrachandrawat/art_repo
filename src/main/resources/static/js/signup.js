var page_number = 1;

$(document).ready(function() {

	$("#signupForm").show("slow");

	$(document).on("keyup keypress", "input", function(e) {
		if (e.which == 13) {
			e.preventDefault();
			/*if ($("#signupForm").is(":visible"))
				$("#signupBtn").trigger("click");
			else if ($("#soicalMediaAccountsForm").is(":visible"))
				$("#nextBtn1").trigger("click");*/
		}
	});

	applyType();
	// validateForm();

	stepNext();
	stepBack();
});

/*
 * creating logic for multi-step form next buttons.
 */
function stepNext() {
	$("#signupBtn").click(function(e) {
		e.stopPropagation();
		validateFormOnClick();
	});

	$("#nextBtn1").click(
			function(e) {
				e.stopPropagation();
				/*
				 * checks for social media accounts
				 */
				if ($(".soicalMediaAccounts:checked").length != 0) {
					$("#soicalMediaAccountsValidation").text("");
					$(".step").hide("fast");
					$("#hrsOnlineForm").show("slow");
				} else {
					$("#soicalMediaAccountsValidation").text(
							"must select atleast one");
				}
				/*
				 * remove validation message is user has checked atleast one
				 * value
				 */
				$(".soicalMediaAccounts").change(function() {
					if (this.checked) {
						if ($("#soicalMediaAccountsValidation").text() != null)
							$("#soicalMediaAccountsValidation").text("");
					}
				});
			});

	$("#nextBtn2").click(function() {
		$(".step").hide("fast");
		$("#onlineForForm").show("slow");
	});

	$("#nextBtn3").click(function() {
		$(".step").hide("fast");
		$("#isBusinessInternetBasedForm").show("slow");
	});

	$("#nextBtn4").click(function() {
		$(".step").hide("fast");
		$("#isInternetInfluencerForm").show("slow");
	});
}

/*
 * creating logic for multi-step form back buttons.
 */
function stepBack() {

	$("#backBtn1").click(function() {
		$(".step").hide("fast");
		$("#signupForm").show("slow");
	});

	$("#backBtn2").click(function() {
		$(".step").hide("fast");
		$("#soicalMediaAccountsForm").show("slow");
	});

	$("#backBtn3").click(function() {
		$(".step").hide("fast");
		$("#hrsOnlineForm").show("slow");
	});

	$("#backBtn4").click(function() {
		$(".step").hide("fast");
		$("#onlineForForm").show("slow");
	});

	$("#backBtn5").click(function() {
		$(".step").hide("fast");
		$("#isBusinessInternetBasedForm").show("slow");
	});
}

function applyType() {
	$("#mobile").attr({
		"type" : "number",
	});
	$("#zip").attr({
		"type" : "number",
	});
	$("#hrsOnline").attr({
		"type" : "number",
	});
}

function validateFormOnClick() {
	var valid = 0;
	/*
	 * checks for name
	 */
	if ($("#name").val() == '') {
		$('#name').get(0).setCustomValidity('Please fill out this field');

		$("#nameValidation").text("this field cannot be empty");
		return 1;
	} else
		$("#nameValidation").text("");
	/*
	 * checks for mobile
	 */
	$.ajax({
		type : "POST",
		url : "/sign-up/isRegistered?mobile=" + $("#mobile").val(),
		success : function(data) {
			if (data == "yes") {
				$('#mobile').get(0).setCustomValidity('Mobile already registered');
				$("#mobileValidation").text("mobile already registered");
				valid = 1;
			} else {
				if ($("#mobile").val() == '') {
					$('#name').get(0).setCustomValidity('Please fill out this field');
					$("#mobileValidation").text("this field cannot be empty");
					valid = 1;
				} else if ($("#mobile").val().length != 10) {
					$('#name').get(0).setCustomValidity('not a valid number');
					$("#mobileValidation").text("not a valid number");
					valid = 1;
				} else
					$("#mobileValidation").text("");
			}
			runOnComplete();
		},
		error : function(e) {
			if ($("#mobile").val() == '') {
				$("#mobileValidation").text("this field cannot be empty");
				valid = 1;
			} else if ($("#mobile").val().length != 10) {
				$("#mobileValidation").text("not a valid number");
				valid = 1;
			} else
				$("#mobileValidation").text("");
		}
	});
	/*
	 * checks for dob
	 */
	if ($("#dob").val() == '') {
		$('#dob').get(0).setCustomValidity('Please fill out this field');

		$("#dobValidation").text("this field cannot be empty");
		valid = 1;
	} else
		$("#dobValidation").text("");
	/*
	 * checks for zip
	 */
	if ($("#zip").val() == '') {
		$('#zip').get(0).setCustomValidity('Please fill out this field');

		$("#zipValidation").text("this field cannot be empty");
		valid = 1;
	} else
		$("#zipValidation").text("");
	/*
	 * checks for password
	 */
	if ($("#password").val() == '') {
		$('#password').get(0).setCustomValidity('Please fill out this field');

		$("#passwordValidation").text("this field cannot be empty");
		valid = 1;
	} else
		$("#passwordValidation").text("");
	/*
	 * checks for confirm password
	 */
	if ($("#confirmPassword").val() === '') {
		$('#confirmPassword').get(0).setCustomValidity('Please fill out this field');

		$("#confirmPasswordValidation").text("this field cannot be empty");
		valid = 1;
	} else
		$("#confirmPasswordValidation").text("");

	/*
	 * remove validation message is user has checked the option
	 */
	$("#privacy-policy").change(function() {
		if (this.checked) {
			if ($("#privacyValidation").text() != null)
				$("#privacyValidation").text("");
		}
	});

	/*
	 * run after the ajax has successfully completed
	 */
	function runOnComplete() {
		if (valid == 0) {
			/*
			 * checks for privacy-policy
			 */
			if ($("#privacy-policy").prop('checked') != true) {
				$("#privacyValidation").text(
						"you must accept the privacy policy to continue");
			}

			else {
				$("#privacyValidation").text("");
				$(".step").hide("fast");
				$("#soicalMediaAccountsForm").show("slow");
			}
		}
	}
}

/*
 * function validateForm() {
 * 
 * $("#mobile").keyup( function() { if ($("#mobile").val() === '')
 * $("#mobileValidation").text( "this field cannot be empty"); });
 * 
 * $("#mobile") .focusout( function() { if ($(this).val().length != 10)
 * $("#mobileValidation").text( "not a valid number"); else {
 * $("#mobileValidation").text(""); $ .ajax({ type : "POST", url :
 * "/sign-up/isRegistered?mobile=" + $( "#mobile") .val(), cache : false,
 * timeout : 600000, success : function( data) { if (data == "yes") { $(
 * "#mobileValidation") .text( "mobile already registered"); } else { $(
 * "#mobileValidation") .text( ""); } }, error : function(e) { alert("error :" +
 * e); } }); } });
 * 
 * $("#name").on( 'blur', function() { if ($("#name").val() === '')
 * $("#nameValidation").text( "this field cannot be empty"); else
 * $("#nameValidation").text(""); });
 * 
 * 
 * $("#mobile").on( 'blur', function() {
 * 
 * if ($("#mobile").val() === '') $("#mobileValidation").text( "this field
 * cannot be empty");
 * 
 * });
 * 
 * 
 * $("#dob").on( 'blur', function() { if ($("#dob").val() === '')
 * $("#dobValidation").text( "this field cannot be empty"); else
 * $("#dobValidation").text(""); });
 * 
 * $("#zip").on( 'blur', function() { if ($("#zip").val() === '')
 * $("#zipValidation").text( "this field cannot be empty"); else
 * $("#zipValidation").text(""); });
 * 
 * $("#password").on( 'blur', function() { if ($("#password").val() === '')
 * $("#passwordValidation").text( "this field cannot be empty"); else
 * $("#passwordValidation").text(""); });
 * 
 * $("#confirmPassword").on( 'blur', function() { if
 * ($("#confirmPassword").val() === '') $("#confirmPasswordValidation").text(
 * "this field cannot be empty"); else $("#confirmPasswordValidation")
 * .text(""); });
 * 
 * $("#privacy-policy").change(function() { if (this.checked) { if
 * ($("#privacyValidation").text() != null) $("#privacyValidation").text(""); }
 * });
 */
// }
