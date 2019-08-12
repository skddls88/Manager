package com.exam.Controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.dto.UserDetailVO;
import com.exam.dto.UserVO;
import com.exam.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserService service;
	
	//로그인 창으로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() throws Exception{
		return "user/login";
	}
	//회원가입 창으로 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinPage() throws Exception{
		return "user/join";
	}
	// 로그인
	@ResponseBody
	@RequestMapping(value = "/dologin", method = RequestMethod.POST)
	public UserVO login(UserVO vo, HttpServletRequest req) throws Exception {
	 logger.info("post login");
	 
	 HttpSession session = req.getSession();
	 
	 UserVO login = service.login(vo);

	 if(login == null) {
	  session.setAttribute("user", null);
	  return login;
	 } else {
	  session.setAttribute("user", login);
	 }
	   
	 return login;
	}
	// 아이디 체크
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public UserVO idcheck(UserVO vo) throws Exception {

		UserVO idcheck = service.idcheck(vo);
		 
		return idcheck;
	}

	// 회원가입 1/2
	@RequestMapping(value = "/insertuser", method = RequestMethod.POST)
	public String insertuser(UserVO vo, String id, Model model) throws Exception {
		service.insertUser(vo);
		
		model.addAttribute("id", id);
		
		return "/user/detail";
	}
	// 회원가입 2/2
	@RequestMapping(value = "/insertuserdetail", method = RequestMethod.POST)
	public String insertuserdetail(UserDetailVO vo, Model model) throws Exception {
		service.insertUserDetail(vo);
		
		model.addAttribute("result", "저장되었습니다.");
		return "redirect:/";
	}
	
}
