package com.art_project.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art_project.model.ConnectModel;
import com.art_project.model.result.Result;
import com.art_project.model.result.ResultWrapper;
import com.art_project.repository.ConnectRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor(onConstructor = @__(@Inject))
public class ConnectService {

	@Autowired
	private ConnectRepository connectRepository;
	
	@Autowired
	private UserService userService;

	private ResultWrapper<ConnectModel> result;

	HttpSession session;

	public ResultWrapper<ConnectModel> saveConnect(ConnectModel connectModel) {

		result = new ResultWrapper<ConnectModel>();

		try {
//			connectModel.setUserModel(userService.getUserModel());
			connectModel.setDateInvite(new java.sql.Date(System.currentTimeMillis()));
			result.setResult(connectRepository.save(connectModel));
			result.setStatus(Result.SUCCESS);
			result.setMessage("successfully saved the connect details");
			return result;
		} catch (Exception e) {
			result.setResult(null);
			result.setStatus(Result.FAIL);
			result.setMessage("failed to save connect, exception: " + e);
			return result;
		}
	}

	protected ConnectModel getInvite(String mobile, int id) {
		return connectRepository.getInvite(mobile, id);
	}

	public Map<Integer, Integer> getInviteList(String mobile) {

		List<ConnectModel> invites = connectRepository.findByMobile(mobile);

		if (invites != null) {
			Map<Integer, Integer> inviteMap = null;

			for (ConnectModel c : invites)
				if (c.getStatus().equals("pending")) {
					inviteMap = new LinkedHashMap<Integer, Integer>();
//					inviteMap.put(c.getId(), c.getUserModel().getId());
					inviteMap.put(c.getId(), c.getUserId());
				}
			return inviteMap;
		} else {
			return null;
		}
	}

	public void updateConnectStatus(String status, int id) {
		connectRepository.updateStatusById(status, id);
	}

	public void updateDateConnect(Date dateConnect, int id) {
		connectRepository.updateDateConnectById(dateConnect, id);
	}

	public ArrayList<ConnectModel> getInviteData(Integer userId, String status) {
		ArrayList<ConnectModel> resultInviteList = connectRepository.findConnectsByUserIdAndStatus(userId, status);
		return resultInviteList;
	}
	
//	public ResultWrapper<ConnectModel> updateConnectStatusForInvitedUser(Integer referredBy, String mobile) {
//		try {
//			ConnectModel connectModel = connectRepository.findByUserIdAndMobile(referredBy, mobile);
//			connectModel.setStatus("connected");
//			connectModel.setDateConnect(Date.valueOf(LocalDate.now()));
//			result.setResult(connectRepository.save(connectModel));
//			result.setStatus(Result.SUCCESS);
//			result.setMessage("status and connect date is updated");
//		} catch (Exception e) {
//			result.setResult(null);
//			result.setStatus(Result.FAIL);
//			result.setMessage("exception in updating connect status and date : "+e.toString());
//		}
//		return result;
//	}
	
	public ResultWrapper<ConnectModel> updateConnectStatusForInvitedUser(Integer referredBy, String mobile) {
		try {
			ConnectModel connectModel = null;
			try {
				connectModel = connectRepository.findByUserIdAndMobile(referredBy, mobile);
			} catch (Exception e) {
				System.out.println("EXCEPTION IN : connectModel = connectRepository.findByUserIdAndMobile(referredBy, mobile)");
			}
			connectModel.setStatus("connected");
			connectModel.setDateConnect(Date.valueOf(LocalDate.now()));
//			result.setResult(connectRepository.save(connectModel));
			try {
				result.setResult(connectRepository.save(connectModel));
			} catch (Exception e) {
				System.out.println("EXCEPTION IN : result.setResult(connectRepository.save(connectModel));");
			}
			result.setStatus(Result.SUCCESS);
			result.setMessage("status and connect date is updated");
		} 
		catch (Exception e) {
			result.setResult(null);
			result.setStatus(Result.FAIL);
			result.setMessage("exception in updating connect status and date : "+e.toString());
		}
		return result;
	}

//	public ResultWrapper<ConnectModel> updateInvitedUserStatus(Integer referralId, String mobile) {
//		try {
//			ConnectModel connectModel = connectRepository.findByUserIdAndMobile(referralId, mobile);
//			connectModel.setStatus("connected");
//			result.setResult(connectRepository.save(connectModel));
//			result.setStatus(Result.SUCCESS);
//			result.setMessage("invite found with given referred UserId and mobile");
//		} catch (Exception e) {
//			result.setResult(null);
//			result.setStatus(Result.FAIL);
//			result.setMessage("invite not found with given referred UserId and mobile");
//		}
//		return result;
//	}
	
}
