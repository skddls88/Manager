package com.exam.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.exam.dto.UserDetailVO;
import com.exam.dto.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {	
	
	// 마이바티스 
	@Inject
	private SqlSession session;
	 
	// 매퍼
	private static String namespace = "com.exam.mapper.empMapper";

	@Override
	public UserVO login(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".login", vo);
	}

	@Override
	public UserVO idcheck(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".idcheck", vo);
	}

	@Override
	public void insertUser(UserVO vo) throws Exception {
		session.insert(namespace + ".insertUser", vo);
	}

	@Override
	public void insertUserDetail(UserDetailVO vo) throws Exception {
		session.insert(namespace + ".insertUserDetail", vo);
		
	}

	
}
