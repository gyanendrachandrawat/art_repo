package com.art_project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.art_project.model.UserModel;
import com.art_project.service.PaymentService;
import com.art_project.service.UserService;
import com.stripe.model.Charge;

@Controller
public class PaymentController {

	@Autowired
	private UserService userService;

	@Autowired
	private PaymentService chargeService;
	
	private UserModel userModel;
	
	HttpSession session;

	@GetMapping("/pay")
	public String LoadPay(HttpServletRequest request, Model model) {
		
		session = request.getSession();
		return "payment";
	}

	@PostMapping("/pay")
	public String pay(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("userId");
		System.out.println("user id from payment : "+id);

		String stripeToken = request.getParameter("stripeToken");

		Charge charge = chargeService.charge(stripeToken);
		String chargeId = charge.getId();

		String status = charge.getStatus();
		System.out.println("payment status : "+status);

		if (status.equals("succeeded")) {
			request.setAttribute("paymentStatus", "payment successful, charge id: " + chargeId);
			userService.updatePayementById("yes", id);
			return "redirect:/"+session.getAttribute("redirectSuccess");
		} else {
			request.setAttribute("paymentStatus", "payment failed due to following reason: " + charge.getDescription());
			return "redirect:/"+session.getAttribute("redirectError");
		}
	}

}
