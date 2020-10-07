package com.art_project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.art_project.model.ConnectModel;
import com.art_project.model.UserModel;
import com.art_project.model.result.ResultWrapper;
import com.art_project.service.ConnectService;
import com.art_project.service.PaymentService;
import com.art_project.service.UserService;
import com.stripe.model.Charge;

@Controller
public class PaymentController {

	@Autowired
	private UserService userService;

	@Autowired
	private PaymentService chargeService;

	@Autowired
	private ConnectService connectService;

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
		int id = (Integer) session.getAttribute("userId");
		System.out.println("user id for payment : " + id);

		String stripeToken = request.getParameter("stripeToken");

		Charge charge = chargeService.charge(stripeToken);
		String chargeId = charge.getId();

		String status = charge.getStatus();
		System.out.println("payment status : " + status);

		if (status.equals("succeeded")) {
			request.setAttribute("paymentStatus", "payment successful, charge id: " + chargeId);
			userService.updatePayementById("yes", id);

			// check if the payment is of signUp type. if signUp type then update the status
			// of invited user's status in connect table and udate the inviting user's
			// points and level.
			String paymentType = session.getAttribute("paymentType").toString();
			System.out.println("Type of payment Request process : " + paymentType);
			if (paymentType.equalsIgnoreCase("signUp")) {
				// check if the sign-Up user if a invited user or not.
				UserModel userModel = userService.getUserModelById(id);
				if (userModel.getReferredBy() != null) {
					// the signup user is a invited user. update signup user's status to "connected"
					// in connect table and inviting user's point and level.
					System.out.println("Payment By Invited User - ReferralId : " + userModel.getReferredBy());
					String updateConnectStatusReferringUserPointUpdateResult = userService
							.updateUserPointLevelAndConnectStatus(userModel);
				} 
				else {
					System.out.println("Payment by Not Invited User");
				}
			}

			return "redirect:/" + session.getAttribute("redirectSuccess");
		} else {
			request.setAttribute("paymentStatus", "payment failed due to following reason: " + charge.getDescription());
			return "redirect:/" + session.getAttribute("redirectError");
		}
	}

}

