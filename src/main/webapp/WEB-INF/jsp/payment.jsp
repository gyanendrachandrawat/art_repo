<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Form</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/payment.css">

<style media="screen">
.error {
	border: solid red 1px;
}
</style>

</head>
<body class="main-background">
	<div class="container-fluid justify-content-center text-align-center">
		<div class="container pay-background">
			<div class="row">
				<div class="col-md-6 col-sm-offset-3">
					<h2 class="text-align-center">Payment</h2>
					<%-- <p style="color: red">
						<!-- <%= request.getAttribute("paymentStatus")%> -->
					</p> --%>
					<form action="/pay" method="post" id="payment-form">

						<div class="form-group justify-content-center">
							<label for="card-name">Card Name</label> <input type="text"
								name="card-name" class="form-control" id="card-name"
								placeholder="Card Name">
						</div>

						<div class="form-group">
							<label for="card-number"> Credit or Debit Card </label>
							<div id="card-number">



								<!-- A Stripe Element will be inserted here. -->



							</div>
						</div>

						<div class="form-group">
							<div class="row">
								<div class="col-md-6">
									<label for="card-cvc"> CVC </label>
									<div id="card-cvc">



										<!-- A Stripe Element will be inserted here. -->



									</div>
								</div>

								<div class="col-md-6">
									<label for="card-exp"> EXPIRATION </label>
									<div id="card-exp">



										<!-- A Stripe Element will be inserted here. -->



									</div>
								</div>

							</div>
						</div>

						<div id="card-errors" role="alert"></div>

						<div class="form-group text-center">
							<button class="btn btn-primary">Pay</button>
						</div>

					</form>



				</div>
			</div>
		</div>
	</div>
	<script src="https://js.stripe.com/v3/"></script>
	<script type="text/javascript">
		//Create a Stripe client.
		var stripe = Stripe('pk_test_51HVIfRHKAW0vilJWYAdqfR4WeU9vG7xPC1IPhUjr2jn9Z1r7ercONJ3wO5BMQNmLm6QFwrNtgvRJWh2TUNmfnTnp00obR3zF5x');

		// Create an instance of Elements.
		var elements = stripe.elements();

		// Custom styling can be passed to options when creating an Element.
		// (Note that this demo uses a wider set of styles than the guide below.)
		var style = {
			base : {
				color : '#32325d',
				fontFamily : '"Helvetica Neue", Helvetica, sans-serif',
				fontSmoothing : 'antialiased',
				fontSize : '16px',
				'::placeholder' : {
					color : '#aab7c4'
				}
			},
			invalid : {
				color : '#fa755a',
				iconColor : '#fa755a'
			}
		};

		// Create an instance of the card Element.
		var card = elements.create('cardNumber', {
			classes : {
				base : "form-control",
				invalid : "error"
			}
		});

		//Create an instance of the card Element.
		var cvc = elements.create('cardCvc', {
			classes : {
				base : "form-control",
				invalid : "error"
			}
		});

		//Create an instance of the card Element.
		var exp = elements.create('cardExpiry', {
			classes : {
				base : "form-control",
				invalid : "error"
			}
		});

		// Add an instance of the card Element into the `card-element` <div>.
		card.mount('#card-number');
		//Add an instance of the card Element into the `card-element` <div>.
		cvc.mount('#card-cvc');
		//Add an instance of the card Element into the `card-element` <div>.
		exp.mount('#card-exp');

		// Handle real-time validation errors from the card Element.
		card.on('change', function(event) {
			var displayError = document.getElementById('card-errors');
			if (event.error) {
				displayError.textContent = event.error.message;
			} else {
				displayError.textContent = '';
			}
		});

		// Handle form submission.
		var form = document.getElementById('payment-form');
		form.addEventListener('submit', function(event) {
			event.preventDefault();

			stripe.createToken(card).then(function(result) {
				if (result.error) {
					// Inform the user if there was an error.
					var errorElement = document.getElementById('card-errors');
					errorElement.textContent = result.error.message;
				} else {
					// Send the token to your server.

					//getting token value in variable filling it in a different form using javascript and submitting it to the backend api.
					//var tokenVal = result.token;
					//document.getElementById('tokenv').value=tokenVal;

					stripeTokenHandler(result.token);
				}
			});
		});

		// Submit the form with the token ID.
		function stripeTokenHandler(token) {
			// Insert the token ID into the form so it gets submitted to the server
			var form = document.getElementById('payment-form');
			var hiddenInput = document.createElement('input');
			hiddenInput.setAttribute('type', 'hidden');
			hiddenInput.setAttribute('name', 'stripeToken');
			hiddenInput.setAttribute('value', token.id);
			form.appendChild(hiddenInput);

			// Submit the form
			form.submit();
		}
	</script>
</body>
</html>