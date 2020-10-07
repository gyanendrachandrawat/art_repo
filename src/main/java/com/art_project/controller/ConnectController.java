package com.art_project.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.art_project.model.ConnectModel;
import com.art_project.model.result.ResultWrapper;
import com.art_project.service.ConnectService;
import com.art_project.service.ValidateService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("dashboard")
@RequiredArgsConstructor(onConstructor = @__(@Inject))
public class ConnectController {

	@Autowired
	private ConnectService connectService;
	
	@Autowired
	private ValidateService validateService;

	private ResultWrapper<ConnectModel> result = new ResultWrapper<ConnectModel>();

	HttpSession session;

	@RequestMapping(value = "/connect", method = RequestMethod.POST)
	public String saveInvite(HttpServletRequest request, Model model,
			@ModelAttribute("connectModel") ConnectModel connectModel) {

		connectModel.setStatus("pending");

		HttpSession session = request.getSession();
//		connectModel.setUserId((Integer) session.getAttribute("userId"));
		Integer userId = (Integer)session.getAttribute("userId");
		connectModel.setUserId(userId);

		System.out.println("connectModel : " + connectModel);

		result = connectService.saveConnect(connectModel);
		
		session.setAttribute("inviteSubmitResponse", result.getMessage());

		// new MessageService().sendMessage(connectModel.getMobile());
//		HttpSession session = request.getSession();

		System.out.println("connect user id: " + session.getAttribute("userId"));
		
		String inviteLink = "localhost:8080/referral?referralId="+userId;
		model.addAttribute("link", inviteLink);

		// request.setAttribute("registerStatus", "REGISTERED SUCCESSFULLY.");
		model.addAttribute(connectModel);

		return "connect";
	}

	/*
	 * check if user already invited or registered.
	 */
//	@PostMapping(value = "/checkInvite")
//	public ResponseEntity<?> checkInvite(HttpServletRequest request, @RequestParam String mobile) {
//
//		System.out.println("\n\n******************sadf akjb jha g******************\n\n");
//		return new ResponseEntity<>(validateService.checkInvite(mobile, (int) request.getSession().getAttribute("userId")),HttpStatus.OK);
//	}

//	temporary inviteLink
//	http://localhost:8080/referral?referralId=9
	@RequestMapping(value = "/connect", method = RequestMethod.GET)
	public String getInvite(HttpServletRequest request, Model model,
			@ModelAttribute("connectModel") ConnectModel connectModel) {

		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
//		String inviteLink = "http://localhost:8080/referral?referralId="+userId;
		System.out.println("userId : "+userId);
		
		session.setAttribute("inviteSubmitResponse", null);
		
		String inviteLink = "localhost:8080/referral?referralId=" + userId;
		System.out.println("inviteLink : " + inviteLink);
		model.addAttribute("link", inviteLink);

		return "connect";
	}

//	@GetMapping("/getInvitePage/{type}")
//	public String getInviteData(HttpServletRequest request, @PathVariable("type")String type) {
//
//		return type;
//	}

	@GetMapping("/inviteData/{type}")
	public ResponseEntity<Object> inviteData(HttpServletRequest request, @PathVariable("type") String type) {

		String status = null;
		if (type.equals("pending")) {
			status = "pending";
		} else if (type.equals("connected")) {
			status = "connected";
		}

		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");

		ArrayList<ConnectModel> resultConnectList = connectService.getInviteData(userId, status);

//		For testing only if the list is Empty or getting NullPointerException
//		try {
//			resultConnectList = connectService.getInviteData(userId, status);
//		} catch (NullPointerException e) {
//			ConnectModel catchModel = new ConnectModel();
//			catchModel.setName("name1");
//			catchModel.setMobile("1111111111");
//			catchModel.setStatus(status);
//			catchModel.setDateInvite(Date.valueOf(LocalDate.now()));
//
//			resultConnectList.add(catchModel);
//
//		}
//
//		if (resultConnectList.isEmpty()) {
//			ConnectModel catchModel = new ConnectModel();
//			catchModel.setName("name1");
//			catchModel.setMobile("1111111111");
//			catchModel.setStatus(status);
//			catchModel.setDateInvite(Date.valueOf(LocalDate.now()));
//
//			resultConnectList.add(catchModel);
//		}

		for (ConnectModel resultModel : resultConnectList) {
			System.out.println(resultModel);
		}
		System.out.println(status+" data sent for user "+userId);
		return new ResponseEntity<>(resultConnectList, HttpStatus.OK);

	}

}
