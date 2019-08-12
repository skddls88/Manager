package com.exam.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.exam.dao.CodeDAO;
import com.exam.dto.CodeVO;

@Repository
public class CodeServiceImpl implements CodeService {	
	
	@Inject
	private CodeDAO dao;
	
	@Override
	public List<CodeVO> codeAll() throws Exception {
		return dao.codeAll();
	}

	@Override
	public void updateCode(CodeVO vo) throws Exception {
		dao.updateCode(vo);
	}

	@Override
	public CodeVO cdlvlCheck(CodeVO vo) throws Exception {
		return dao.cdlvlCheck(vo);
	}

	@Override
	public void insertCode(CodeVO vo) throws Exception {
		dao.insertCode(vo);
	}

	@Override
	public List<CodeVO> codeCategory(CodeVO vo) throws Exception {
		return dao.codeCategory(vo);
	}

	@Override
	public CodeVO codeNumber(CodeVO vo) throws Exception {
		return dao.codeNumber(vo);
	}

	@Override
	public List<CodeVO> codeCategory2(CodeVO vo) throws Exception {
		return dao.codeCategory2(vo);
	}


}
