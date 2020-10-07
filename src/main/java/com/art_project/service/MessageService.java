package com.art_project.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.art_project.model.UserModel;
import com.art_project.model.result.Result;
import com.art_project.model.result.ResultWrapper;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Service
public class MessageService {

	@Value("${twilio.account_sid}")
	private String twilio_sid;

	@Value("${twilio.auth_token}")
	private String twilio_auth_token;

	@Value("${twilio.trial_number}")
	private String twilio_trial_number;
	
	ResultWrapper<Message> result;

//	public Message sendMessage(UserModel signupModel) {
//		try {
//			Twilio.init(twilio_sid, twilio_auth_token);
//
//			Message message = Message.creator(new PhoneNumber(signupModel.getMobile()),
//					new PhoneNumber(twilio_trial_number), "Congratulations.. You are succesfully signed up.").create();
//			System.out.println("message sent");
//			return message;
//		} catch (Exception e) {
//			return null;
//		}
//	}

	public ResultWrapper<Message> sendMessage(String mobile, String messageText) {
		
		result = new ResultWrapper<>();
		
		try {
			Twilio.init(twilio_sid, twilio_auth_token);
			Message message = Message.creator(new PhoneNumber(mobile), new PhoneNumber(twilio_trial_number), messageText).create();
			System.out.println("message sent");
			result.setResult(message);
			result.setStatus(Result.SUCCESS);
			result.setMessage("success");
		} catch (Exception e) {
			result.setResult(null);
			result.setStatus(Result.FAIL);
			result.setMessage("fail"+e.toString());
		}
		
		return result;
		
	}

}
