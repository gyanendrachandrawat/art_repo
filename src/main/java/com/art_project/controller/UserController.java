package com.art_project.controller;

import static com.art_project.security.Constants.HEADER_STRING;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.art_project.model.ConnectModel;
import com.art_project.model.UserModel;
import com.art_project.model.result.Result;
import com.art_project.model.result.ResultWrapper;
import com.art_project.security.JwtTokenUtil;
import com.art_project.service.ConnectService;
import com.art_project.service.PaymentService;
import com.art_project.service.UserService;
import com.art_project.service.ValidateService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor(onConstructor = @__(@Inject))
public class UserController {

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private JwtTokenUtil jwtTokenUtil;

	@Autowired
	private UserService userService;

	@Autowired
	private PaymentService paymentService;

	@Autowired
	private ConnectService connectService;
	
	@Autowired
	private ValidateService validateService;

	private ResultWrapper<UserModel> result = new ResultWrapper<UserModel>();

	HttpSession session;

	@RequestMapping
	public String redirect(HttpServletRequest request, HttpServletResponse response) {

		session = request.getSession();

		if (session.getAttribute("valid") == null) {
			return "redirect:/login";
		} else {
			if (session.getAttribute("valid").equals("yes")) {
				return "redirect:/dashboard";
			} else {
				Cookie[] cookies = request.getCookies();
				session.invalidate();

				if (cookies != null)
					for (int i = 0; i < cookies.length; i++) {

						if (cookies[i].getName().equals(HEADER_STRING)) {
							cookies[i].setValue("");
						}
						response.addCookie(cookies[i]);
					}
				return "redirect:/login";
			}
		}
	}

	@GetMapping(value = "/login")
	public String loginGet(HttpServletRequest request, Model model, @ModelAttribute("userModel") UserModel userModel) {
		return "login";
	}

	@GetMapping(value = "/logoutSession")
	public ResponseEntity<?> logout(HttpServletRequest request) {
		session = request.getSession();
		session.setAttribute("valid", "no");
		return new ResponseEntity<>("success", HttpStatus.OK);
	}

	@PostMapping(value = "/login")
	public String loginPost(HttpServletRequest request, Model model, @ModelAttribute("userModel") UserModel userModel,
			HttpServletResponse response) {

		session = request.getSession();
		String token = getLoginToken(userModel);
		userModel = userService.findOne(userModel.getMobile());
		String paymentDone = userModel.getPaymentDone();

		if (token != null) {

			userService.setUserModel(userModel);
			session.setAttribute("valid", "yes");
			session.setAttribute("userId", userModel.getId());
			Cookie cookie = new Cookie("Authorization", "Bearer-" + token);
			response.addCookie(cookie);

			if (paymentDone.equals("yes")) {
				model.addAttribute("usersname", userModel.getName());
				System.out.println(" token: " + token);
				return "redirect:/dashboard";
			} else {
				session.setAttribute("redirectSuccess", "dashboard");
				session.setAttribute("redirectError", "pay");
				
				// to identify type of payment in payment controller during payment processing.
				session.setAttribute("paymentType", "signUp");
				
				return "redirect:/pay";
			}
		} else {
			request.setAttribute("loginStatus", "username or password incorrect.");
			System.out.println(" token: " + token);
			return "login";
		}
	}

	@GetMapping(value = "/sign-up")
//	@GetMapping({"/sign-up","/sign-up/referral/{}"})
	public String signUpGet(HttpServletRequest request, Model model, @ModelAttribute("userModel") UserModel userModel) {
//		System.out.println("referralId : "+referralId);		
		model.addAttribute("userModel", userModel);
		return "signup";
	}

//	temporary inviteLink
//	http://localhost:8080/referral?referralId=9
	@GetMapping(value = "/referral")
	public String referral(HttpServletRequest request, Model model, @ModelAttribute("userModel") UserModel userModel,
			@RequestParam(value = "referralId") Integer referralId) {
		System.out.println("referralId : " + referralId);
		session = request.getSession();

		session.setAttribute("referralId", referralId);

		model.addAttribute("userModel", userModel);

		return "signup";
	}

	@PostMapping(value = "/sign-up")
	public String signUpPost(HttpServletRequest request, Model model,
			@ModelAttribute("userModel") UserModel userModel) {

		session = request.getSession();
		Integer referralId = null;
		referralId = (Integer) session.getAttribute("referralId");
//		session.setAttribute("referralId", null);
		if (referralId != null) {
			System.out.println("referred sign-up : referralId : " + referralId+" mobileNumber : "+userModel.getMobile());
			userModel.setReferredBy(referralId);
		} else {
			System.out.println("not a referred sign-up");
			userModel.setReferredBy(null);
		}

		session.setAttribute("redirectSuccess", "login");
		session.setAttribute("redirectError", "login");

		result = userService.saveUser(userModel);
		if (result.getResult() != null) {
			model.addAttribute(userModel);
			session.setAttribute("userId", userModel.getId());
			
			// to identify type of payment in payment controller during payment processing.
			session.setAttribute("paymentType", "signUp");
//			session.setAttribute("referralId", referralId);
			
			return "redirect:/pay";
		}

		else
			return "redirect:/login";
	}

	@PostMapping(value = "/sign-up/isRegistered", params = "mobile")
	public ResponseEntity<?> checkIfRegistered(HttpServletRequest request, @RequestParam String mobile) {
		// System.out.println(
		// "got the status as user registered: " + userService.checkIfRegistered(mobile)
		// + ", number: " + mobile);
		return new ResponseEntity<>(validateService.checkIfRegistered(mobile), HttpStatus.OK);
	}

	@GetMapping(value = "/dashboard")
	public String userWelcome(HttpServletRequest request) {
		return "dashboard";
	}

	public String getLoginToken(UserModel userModel) {
		Authentication authentication = null;
		String token = null;
		try {
			authentication = authenticationManager.authenticate(
					new UsernamePasswordAuthenticationToken(userModel.getMobile(), userModel.getPassword()));
			System.out.println("authentication token: " + authentication);
			SecurityContextHolder.getContext().setAuthentication(authentication);
			token = jwtTokenUtil.generateToken(authentication);

		} catch (Exception exception) {
			System.out.println("an error occured : " + exception.getMessage());
		}
		return token;
	}

}
