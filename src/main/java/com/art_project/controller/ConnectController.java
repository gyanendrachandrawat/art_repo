package com.art_project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.art_project.model.ConnectModel;
import com.art_project.model.result.ResultWrapper;
import com.art_project.service.ConnectService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("dashboard")
@RequiredArgsConstructor(onConstructor = @__(@Inject))
public class ConnectController {
	
	@Autowired
	private ConnectService connectService;
	
	private ResultWrapper<ConnectModel> result = new ResultWrapper<ConnectModel>();
	
	@RequestMapping(value = "/connect", method = RequestMethod.POST)
	public String saveInvite(HttpServletRequest request, Model model,
			@ModelAttribute("connectModel") ConnectModel connectModel) {

		connectModel.setStatus("test");
				
		result = connectService.saveConnect(connectModel);
		
		HttpSession session = request.getSession();

		System.out.println("connect user id: "+ session.getAttribute("userId"));
		
		// request.setAttribute("registerStatus", "REGISTERED SUCCESSFULLY.");
		model.addAttribute(connectModel);

		return "dashboard";
	}
	
	@RequestMapping(value = "/connect", method = RequestMethod.GET)
	public String getInvite(HttpServletRequest request, Model model,
			@ModelAttribute("connectModel") ConnectModel connectModel) {
		return "connect";
	}

}
