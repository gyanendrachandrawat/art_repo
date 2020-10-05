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

	private ResultWrapper<UserModel> result = new ResultWrapper<UserModel>();

	HttpSession session;

	@RequestMapping
	public String redirect(HttpServletRequest request, HttpServletResponse response) {

		session = request.getSession(false);
		System.out.println(session.getAttribute("valid"));
		
		if (session == null) {
			System.out.println("to login...");
			return "redirect:/login";
		} else {
			if (session.getAttribute("valid").equals("yes")) {
				System.out.println("redirecting to dashboard...");
				return "redirect:/dashboard";
			} else {
				Cookie[] cookies = request.getCookies();
				session.invalidate();

				System.out.println("logging out...");

				for (int i = 0; i < cookies.length; i++) {

					Cookie cookie = cookies[i];

					if (cookie.getName().equals(HEADER_STRING)) {
						cookie.setValue("");
					}
					response.addCookie(cookie);
				}
				return "redirect:/login";
			}
		}
	}

	@GetMapping(value = "/login")
	public String loginGet(HttpServletRequest request, Model model, @ModelAttribute("userModel") UserModel userModel) {
		return "login";
	}

	@GetMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();

		for (int i = 0; i < cookies.length; i++) {

			Cookie cookie = cookies[i];

			if (cookie.getName().equals(HEADER_STRING)) {
				cookie.setValue("");
			}
			response.addCookie(cookie);
		}
		return "redirect:/login";
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

			if (paymentDone.equals("yes")) {
				session.setAttribute("userId", userModel.getId());
				model.addAttribute("usersname", userModel.getName());

				Cookie cookie = new Cookie("Authorization", "Bearer-" + token);
				System.out.println(" token: " + token);
				response.addCookie(cookie);
				return "redirect:/dashboard";
			} else {
				session.setAttribute("userId", userModel.getId());
				session.setAttribute("redirectSuccess", "dashboard");
				session.setAttribute("redirectError", "pay");
				System.out.println("user id: " + userModel.getId());
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
		session.setAttribute("referralId", null);
		if (referralId != null) {
			System.out.println("sign-up : referralId : " + referralId);
			String mobile = userModel.getMobile();
			ResultWrapper<ConnectModel> connectStatus = connectService.updateInvitedUserStatus(referralId, mobile);
			System.out.println("connectStatus : " + connectStatus.getStatus());
			if (connectStatus.equals(Result.SUCCESS)) {
				System.out.println("updating point/level of inviting user : ..");
				ResultWrapper<UserModel> userStatus = userService.updatePointOrLevelOfUser(referralId);
				System.out.println(userStatus.getMessage());
				System.out.println("Inviting User's level/points updated");
			}
		} else {
			System.out.println("not a referred sign-up");
		}

		session.setAttribute("redirectSuccess", "login");
		session.setAttribute("redirectError", "login");

		result = userService.saveUser(userModel);
		if (result.getResult() != null) {
			model.addAttribute(userModel);
			session.setAttribute("userId", userModel.getId());
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
		return new ResponseEntity<>(userService.checkIfRegistered(mobile), HttpStatus.OK);
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
