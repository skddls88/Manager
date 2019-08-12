package com.exam.dao;

import java.util.List;

import com.exam.dto.CodeVO;

public interface CodeDAO {
	
	public List<CodeVO> codeAll() throws Exception;
	public void updateCode(CodeVO vo) throws Exception;
	public CodeVO cdlvlCheck(CodeVO vo) throws Exception;
	public void insertCode(CodeVO vo) throws Exception;
	public List<CodeVO> codeCategory(CodeVO vo) throws Exception;
	public CodeVO codeNumber(CodeVO vo) throws Exception;
	public List<CodeVO> codeCategory2(CodeVO vo) throws Exception;
	
}
