package com.exam.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.exam.dao.EmpDAO;
import com.exam.dto.EmpVO;

@Repository
public class EmpServiceImpl implements EmpService {	
	
	@Inject
	private EmpDAO dao;
	
	@Override
	public List<EmpVO> empAll() throws Exception {
		return dao.empAll();
	}


}
