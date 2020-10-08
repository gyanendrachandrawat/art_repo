package com.art_project.repository;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.art_project.model.ConnectModel;

@Transactional
public interface ConnectRepository extends JpaRepository<ConnectModel, Integer> {
	
	List<ConnectModel> findByMobile(String mobile);
	
	@Query(value="select * from connect where mobile = :mobile and userId = :id ", nativeQuery = true)
	ConnectModel getInvite(String mobile, int id);
	
	@Modifying
	@Query(value = "update connect set status = ? where id = ?", nativeQuery = true)
	int updateStatusById(String status, int id);
	
	@Modifying
	@Query(value = "update connect set dateConnect = ? where id = ?", nativeQuery = true)
	void updateDateConnectById(Date dateConnect, int id);

	List<ConnectModel> findByUserIdAndStatus(Integer userId, String status);

//	@Query(value = "select from connect where userId = ? and status = ?", nativeQuery = true)
	ArrayList<ConnectModel> findConnectsByUserIdAndStatus(Integer userId, String status);

//	ConnectModel findByUserIdAndMobile(Integer referralId, String mobile);
	ConnectModel findByUserIdAndMobile(Integer referralId, String mobile);
	
	@Query(value = "SELECT COUNT(mobile) FROM connect WHERE status =:status AND userId =:userId", nativeQuery = true)
	Integer getInviteCountsByStatusAndUserId(String status, Integer userId);
}
