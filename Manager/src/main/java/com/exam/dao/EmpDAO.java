package com.exam.dao;

import java.util.List;

import com.exam.dto.EmpVO;

public interface EmpDAO {
	
	public List<EmpVO> empAll() throws Exception;
	
}
