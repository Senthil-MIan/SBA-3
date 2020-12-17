package com.wf.training.pms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.wf.training.pms.entity.BackOfficeUser;

@Repository
public interface BackOfficeUserRepository extends JpaRepository<BackOfficeUser, String>{

	BackOfficeUser findByuserName(String userName);
}
