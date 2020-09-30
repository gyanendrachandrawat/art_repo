package com.art_project.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.art_project.model.UserModel;

@Transactional
public interface UserRepository extends JpaRepository<UserModel, Integer> {

	UserModel findByMobile(String mobile);

	Optional<UserModel> findById(Integer id);

	@Modifying
	@Query(value = "update user set paymentDone = ? where id = ?", nativeQuery = true)
	void updatePaymentById(String paymentDone, int id);
	
	@Modifying
	@Query(value = "update user set paymentDone = ? where mobile = ?", nativeQuery = true)
	void updatePaymentByMobile(String paymentDone, int id);

	@Modifying
	@Query(value = "update user set points = points + 1 where id = ?", nativeQuery = true)
	void updatePointsByUserId(int id);

	@Modifying
	@Query(value = "update user set level = level + 1 where id = ?", nativeQuery = true)
	void updateLevelByUserId(int id);
}
