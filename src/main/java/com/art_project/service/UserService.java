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

	private ResultWrapper<UserModel> result = new ResultWrapper<>();

	/*
	 * method to save user details
	 */
	public ResultWrapper<UserModel> saveUser(UserModel userModel) {

		userModel.setPaymentDone("no");
		userModel.setPoints(0);
		userModel.setLevel(1);
		userModel.setLink(generateLink(userModel.getId()));

		updateUserStats(userModel);
		userModel.setPassword(bcryptEncoder.encode(userModel.getPassword()));
		// messageService.sendMessage(userModel);
		try {
			result.setResult(userRepository.save(userModel));
			result.setStatus(Result.SUCCESS);
			result.setMessage("successfully saved the user details");
			return result;
		} catch (Exception e) {
			result.setResult(null);
			result.setStatus(Result.FAIL);
			result.setMessage("failed to save user, exception: " + e);
			return null;
		}
	}

	/*
	 * method to get user details from mobile
	 */
	public UserModel findOne(String mobile) {
		return userRepository.findByMobile(mobile);
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
		return null;
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
}
