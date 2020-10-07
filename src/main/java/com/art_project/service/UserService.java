package com.art_project.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.art_project.model.ConnectModel;
import com.art_project.model.UserModel;
import com.art_project.model.result.Result;
import com.art_project.model.result.ResultWrapper;
import com.art_project.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor(onConstructor = @__(@Inject))
public class UserService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder bcryptEncoder;

	@Autowired
	private MessageService messageService;

	@Autowired
	private ConnectService connectService;

	private UserModel userModel = new UserModel();

	private ResultWrapper<UserModel> result;

	/*
	 * method to save user details
	 */
	public ResultWrapper<UserModel> saveUser(UserModel userModel) {

		result = new ResultWrapper<>();
		
//		userRepository.save(userModel);
		
		UserModel userModelNew = userModel;
		System.out.println("\n"+ userRepository.findByMobile(userModelNew.getMobile()));
		if (userRepository.findByMobile(userModelNew.getMobile()) != null) {

			result.setResult(null);
			result.setStatus(Result.FAIL);
			result.setMessage("the user already exists.");
			System.out.println(result.getMessage());
			return result;

		} else {

			userModel.setPaymentDone("no");
			userModel.setPoints(0);
			userModel.setLevel(1);
			userModel.setLink(generateLink(userModel.getId()));

			// updateUserStats(userModel);
			userModel.setPassword(bcryptEncoder.encode(userModel.getPassword()));
			// messageService.sendMessage(userModel);
			try {
				result.setResult(userRepository.save(userModel));
				result.setStatus(Result.SUCCESS);
				result.setMessage("successfully saved the user details");
				System.out.println(result.getMessage());
				return result;
			} catch (Exception e) {
				result.setResult(null);
				result.setStatus(Result.EXCEPTION);
				result.setMessage("failed to save user, exception: " + e);
				System.out.println(result.getMessage());
				return result;
			}
			
		}
	}

	/*
	 * method to get user details from mobile
	 */
	public UserModel findOne(String mobile) {
		return userRepository.findByMobile(mobile);
	}
	
	/*
	 * method to check if a user is registered
	 */
	public String checkIfRegistered(String mobile) {
		if (userRepository.findByMobile(mobile) != null)
			return "yes";
		return "no";
	}

	/*
	 * method to get user details from unique username ( mobile in this case )
	 */
	public UserDetails loadUserByUsername(String mobile) {
		UserModel user = userRepository.findByMobile(mobile);
		if (user == null) {
			throw new UsernameNotFoundException("Invalid Mobile Number or Password.");
		}
		return new org.springframework.security.core.userdetails.User(user.getMobile(), user.getPassword(),
				getAuthority());
	}

	private List<SimpleGrantedAuthority> getAuthority() {
		return Arrays.asList(new SimpleGrantedAuthority("ROLE_ADMIN"));
	}

	/*
	 * method to update the payment status of the user
	 */
	public void updatePayementById(String payementDone, int id) {
		userRepository.updatePaymentById(payementDone, id);
	}

	/*
	 * method to update the user stats: points and level.
	 */
	private void updateUserStats(UserModel userModel) {
		// get list of each user that has sent the invitation that has signed up.
		Map<Integer, Integer> inviteMap = connectService.getInviteList(userModel.getMobile());

		if (inviteMap != null) {

			for (int i : inviteMap.keySet()) {

				// increase point of each user
				userRepository.updatePointsByUserId(inviteMap.get(i));

				// set status as connected for the user invited
				connectService.updateConnectStatus("connected", i);

				// set date of connect as current date
				connectService.updateDateConnect(new java.sql.Date(System.currentTimeMillis()), i);

				// check if user exceeds point by multiple of 50, then increase the level
				if (userRepository.findById(inviteMap.get(i)).get().getPoints() % 50 == 0)
					userRepository.updateLevelByUserId(inviteMap.get(i));
			}
		}
	}

	/*
	 * method to generate a unique link for each user.
	 */
	private String generateLink(int id) {
		return "link12345";
	}

	/*
	 * method to set all user details to POJO.
	 */
	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}

	/*
	 * method to get all user details from POJO.
	 */
	public UserModel getUserModel() {
		return userModel;
	}
	
	public UserModel getUserModelById(int id) {
		return userRepository.getOne(id);
	}
	
	public String updateUserPointLevelAndConnectStatus(UserModel userModel) {
		
		Integer referredBy = userModel.getReferredBy();
		String mobile = userModel.getMobile();
		
		System.out.println("UserService updating status, date and point, level - referredBy : "+referredBy+", mobile : "+mobile);
		
		// Updating invited user's connectStatus and connectDate.
		String connectModelUpdateResult = connectService.updateConnectStatusForInvitedUser(referredBy, mobile);
		
		// updating inviting user's point and level.
		String userModelUpdateResult = this.updateUserPointLevel(referredBy);
		
		if (connectModelUpdateResult.equalsIgnoreCase("success")) {
			System.out.println("SUCCESS : connectStatus, connectDate updated successfully");
		} else {
			System.out.println("FAIL : connectStatus, connectDate update failed : "+connectModelUpdateResult);
		}
		if (userModelUpdateResult.equalsIgnoreCase("success")) {
			System.out.println("SUCCESS : user point, level updated successfully");
		} else {
			System.out.println("FAIL : user point, level update failed : "+userModelUpdateResult);
		}
		
		if (connectModelUpdateResult.equalsIgnoreCase("success") && userModelUpdateResult.equalsIgnoreCase("success")) {
			System.out.println("FINAL RESULT - connectStatus, connetcDate, point, level updated SUCCESSFULLY");
			return "success";
		} else {
			System.out.println("connectModelUpdateResult : "+connectModelUpdateResult);
			System.out.println("userModelUpdateResult : "+userModelUpdateResult);
			return "fail";
		}
		
	}

	private String updateUserPointLevel(Integer referredBy) {
		try {
			userRepository.updatePointsByUserId(referredBy);
			if (userRepository.getOne(referredBy).getPoints() % 50 ==0) {
				userRepository.updateLevelByUserId(referredBy);
			}
			return "success";
		} catch (Exception e) {
			return "fail "+e.toString();
		}
	}

//	public ResultWrapper<UserModel> updatePointOrLevelOfUser(Integer referralId) {
//		UserModel userModel = userRepository.findById(referralId).orElse(null);
//		if (userModel == null) {
//			result.setResult(null);
//			result.setStatus(Result.FAIL);
//			result.setMessage("user with referred userId not found");
//		} else {
//			Integer points = userModel.getPoints();
//			if (points/50 == 0) {
//				Integer level = userModel.getLevel();
//				level = level + 1;
//				points = points + 1;
//				userModel.setLevel(level);
//				userModel.setPoints(points);
//			} else {
//				points = points + 1;
//				userModel.setPoints(points);
//			}
//			result.setResult(userRepository.save(userModel));
//			result.setStatus(Result.SUCCESS);
//			result.setMessage("user updated successfully on referral registration");
//		}
//		return result;
//	}
	
	
}
