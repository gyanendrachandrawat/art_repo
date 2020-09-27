package com.art_project.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.art_project.user.UserService;
import com.stripe.model.Charge;

@Controller
public class PaymentController {

	@Autowired
	private UserService userService;

	@Autowired
	private PaymentService chargeService;

	@PostMapping("/pay")
	public String charge(HttpServletRequest request, Model model) {

		HttpSession session=request.getSession(); 
		int id = (int) session.getAttribute("userId");
		
		String stripeToken = request.getParameter("stripeToken");
		
		Charge charge = chargeService.charge(stripeToken);
		String chargeId = charge.getId();
		
        String status = charge.getStatus();

		if (status.equals("succeeded")) {
			request.setAttribute("paymentStatus", "payment successful, charge id: "+chargeId);
			userService.updatePayementById(status, id);
			return "dashboard";
		} else {
			request.setAttribute("paymentStatus", "payment failed due to following reason: " + charge.getDescription());
			return "payment";
		}
	}

}
