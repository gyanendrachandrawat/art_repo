package com.art_project.payment;

public class PaymentRequest {

	public enum Currency {
		EUR, USD;
	}

	private String description;
	private int amount; // cents
	private Currency currency;
	private String stripeEmail;
	private String stripeToken;

	public String getDescription() {
		return description;
	}

	public int getAmount() {
		return amount;
	}

	public Currency getCurrency() {
		return currency;
	}

	public String getStripeEmail() {
		return stripeEmail;
	}

	public String getStripeToken() {
		return stripeToken;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setCurrency(Currency currency) {
		this.currency = currency;
	}

	/**
	 * @param amount the amount to set
	 */
	public void setAmount(int amount) {
		this.amount = amount;
	}

	/**
	 * @param stripeToken the stripeToken to set
	 */
	public void setStripeToken(String stripeToken) {
		this.stripeToken = stripeToken;
	}

}
