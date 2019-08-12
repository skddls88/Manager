package com.exam.service;

import com.exam.dto.UserDetailVO;
import com.exam.dto.UserVO;

public interface UserService {
	public UserVO login(UserVO vo) throws Exception;
	public UserVO idcheck(UserVO vo) throws Exception;
	public void insertUser(UserVO vo) throws Exception;
	public void insertUserDetail(UserDetailVO vo) throws Exception;
}
