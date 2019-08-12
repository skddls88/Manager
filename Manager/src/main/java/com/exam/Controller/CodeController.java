package com.exam.Controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.exam.dto.CodeVO;
import com.exam.service.CodeService;

@Controller
@RequestMapping("/code")
public class CodeController {
	
	private static final Logger logger = LoggerFactory.getLogger(CodeController.class);
	
	@Inject
	CodeService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView codelist() throws Exception{
		List<CodeVO> code = service.codeAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("code/codeList");
		mav.addObject("code", code);
		
		return mav;
	}
	
	//제품 업데이트
	@ResponseBody
	@RequestMapping(value = "/saveCode", method = RequestMethod.POST)
	public void updateCode(CodeVO vo) throws Exception {
		service.updateCode(vo);
	}

	// 상위 코드 체크
	@ResponseBody
	@RequestMapping(value = "/cdlvlCheck", method = RequestMethod.POST)
	public CodeVO idcheck(CodeVO vo) throws Exception {

		CodeVO cdlvlCheck = service.cdlvlCheck(vo);
		 
		return cdlvlCheck;
	}
	
	//제품 추가
	@ResponseBody
	@RequestMapping(value = "/insertCode", method = RequestMethod.POST)
	public void insertCode(CodeVO vo) throws Exception {
		service.insertCode(vo);
	}

	//제품 관리 페이지로 이동
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detailPage(CodeVO vo) throws Exception{
		
		List<CodeVO> codeCategory = service.codeCategory(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("code/codeDetail");
		mav.addObject("codeCategory", codeCategory);
		return mav;
	}

	// 코드번호 가져오기
	@ResponseBody
	@RequestMapping(value = "/codeNumber", method = RequestMethod.POST)
	public CodeVO codeNumber(CodeVO vo) throws Exception {

		CodeVO codeNumber = service.codeNumber(vo);
		
		return codeNumber;
	}
	
	
}
