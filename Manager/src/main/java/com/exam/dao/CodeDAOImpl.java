package com.exam.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.exam.dto.CodeVO;

@Repository
public class CodeDAOImpl implements CodeDAO {	
	
	// 마이바티스 
	@Inject
	private SqlSession session;
	 
	// 매퍼
	private static String namespace = "com.exam.mapper.codeMapper";

	 @Override
	public List<CodeVO> codeAll() throws Exception{
		return session.selectList(namespace + ".codeAll");
	}

	@Override
	public void updateCode(CodeVO vo) throws Exception{
		session.update(namespace + ".updateCode", vo);
	}

	@Override
	public CodeVO cdlvlCheck(CodeVO vo) throws Exception {
		return session.selectOne(namespace + ".cdlvlCheck", vo);
	}

	@Override
	public void insertCode(CodeVO vo) throws Exception {
		session.insert(namespace + ".insertCode", vo);
	}

	@Override
	public List<CodeVO> codeCategory(CodeVO vo) throws Exception {
		return session.selectList(namespace + ".codeCategory", vo);
	}

	@Override
	public CodeVO codeNumber(CodeVO vo) throws Exception {
		return session.selectOne(namespace + ".codeNumber", vo);
	}

	@Override
	public List<CodeVO> codeCategory2(CodeVO vo) throws Exception {
		return session.selectList(namespace + ".codeCategory2", vo);
	}
}
