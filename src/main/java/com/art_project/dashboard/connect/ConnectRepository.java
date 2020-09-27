package com.art_project.dashboard.connect;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface ConnectRepository extends JpaRepository<ConnectModel, Integer> {
	
	List<ConnectModel> findByMobile(String mobile);
	
	@Modifying
	@Query(value = "update connect set status = ? where id = ?", nativeQuery = true)
	int updateStatusById(String status, int id);
}
