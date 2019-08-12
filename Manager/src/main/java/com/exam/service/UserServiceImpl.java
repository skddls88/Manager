package com.exam.service;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.exam.dao.UserDAO;
import com.exam.dto.UserDetailVO;
import com.exam.dto.UserVO;

@Repository
public class UserServiceImpl implements UserService {	
	
	@Inject
	private UserDAO dao;
	
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public UserVO idcheck(UserVO vo) throws Exception {
		return dao.idcheck(vo);
	}
	@Override
	public void insertUser(UserVO vo) throws Exception {
		dao.insertUser(vo);
	}

	@Override
	public void insertUserDetail(UserDetailVO vo) throws Exception {
		dao.insertUserDetail(vo);
	}


}
