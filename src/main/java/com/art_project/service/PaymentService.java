package com.art_project.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.art_project.model.PaymentRequest.Currency;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;

@Service
public class PaymentService {

	@Value("${STRIPE_SECRET_KEY}")
	String secretKey;

	@PostConstruct
	public void init() {
		Stripe.apiKey = secretKey;
	}

	public Charge charge(String stripeToken) {
		
		Charge charge = null;
		
		try {
			Map<String, Object> chargeParams = new HashMap<>();
			
			chargeParams.put("amount", 50);
			
			chargeParams.put("currency", Currency.USD);
			
			chargeParams.put("description", "test payment from js form");
			
			chargeParams.put("source", stripeToken);
			
			charge = Charge.create(chargeParams);
		} catch (StripeException se) {
			
			charge = new Charge();
//			charge.setId(null);
			charge.setStatus("failed : "+se.toString());
			
		}
		
		return charge;

	}
}
