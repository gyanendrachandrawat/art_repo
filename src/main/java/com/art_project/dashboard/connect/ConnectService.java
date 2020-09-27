package com.art_project.dashboard.connect;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art_project.result.Result;
import com.art_project.result.ResultWrapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor(onConstructor = @__(@Inject))
public class ConnectService {

	@Autowired
	private ConnectRepository connectRepository;

	private ResultWrapper<ConnectModel> result = new ResultWrapper<ConnectModel>();

	public ResultWrapper<ConnectModel> saveConnect(ConnectModel connectModel) {
		try {
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

	public Map<Integer, Integer> getInviteList(String mobile) {

		List<ConnectModel> invites = connectRepository.findByMobile(mobile);

		if (invites != null) {
			Map<Integer, Integer> inviteMap = null;

			for (ConnectModel c : invites)
				if (c.getStatus().equals("pending")) {
					inviteMap = new LinkedHashMap<Integer, Integer>();
					inviteMap.put(c.getId(), c.getUserModel().getId());
				}
			return inviteMap;
		} else {
			return null;
		}
	}

	public void updateConnectStatus(String status, int id) {
		connectRepository.updateStatusById(status, id);
	}
}
