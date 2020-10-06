package com.art_project.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor(onConstructor = @__(@Inject))
public class ValidateService {

	@Autowired
	private UserService userService;

	@Autowired
	private ConnectService connectService;

	/*
	 * check if user already invited or registered.
	 */
	public String checkInvite(String mobile, int id) {

		try {
			if (userService.findOne(mobile) != null)
				return "registered";
			else if (connectService.getInvite(mobile, id) != null)
				return "sent";
			else
				return "no";
		} catch (Exception ex) {
			return "exception";
		}
	}
	
	/*
	 * check if a user already registered
	 */
	public String checkIfRegistered(String mobile) {
		if (userService.findOne(mobile) != null)
			return "yes";
		return "no";
	}
}
