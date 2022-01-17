package com.mycompany.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.service.MemberService;
import com.mycompany.vo.MemberVO;

// http://localhost:8090/controller/login

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberservice;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() {
		
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public String loginPOST(MemberVO member) throws Exception {

		MemberVO loginVO = memberservice.memberLogin(member);

		if (loginVO == null) {
			return "false";
		} else {
			return "true";
		}

	}

}
