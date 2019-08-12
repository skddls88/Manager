package com.exam.Controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.exam.dto.EmpVO;
import com.exam.service.EmpService;

@Controller
@RequestMapping("/emp")
public class EmpController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);
	
	@Inject
	EmpService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView emplist() throws Exception{
		List<EmpVO> emp = service.empAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("emp/empList");
		mav.addObject("emp", emp);
		
		return mav;
	}
}
