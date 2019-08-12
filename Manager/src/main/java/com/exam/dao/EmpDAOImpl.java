package com.exam.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.exam.dto.EmpVO;

@Repository
public class EmpDAOImpl implements EmpDAO {	
	
	// 마이바티스 
	@Inject
	private SqlSession session;
	 
	// 매퍼
	private static String namespace = "com.exam.mapper.empMapper";

	 @Override
	public List<EmpVO> empAll() throws Exception{
		return session.selectList(namespace + ".empAll");
	}
}
