package com.mini.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mini.service.MemberService;
import com.mini.vo.MemberVO;

//http://localhost:8090/member/join
//http://localhost:8090/member/login

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberservice;

	/* 회원가입 페이지 이동 */
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET() {

		logger.info("회원가입 페이지입니다.");

	}

	/* 로그인 페이지 이동 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() {

		logger.info("로그인 페이지입니다.");

	}

	/* 회원가입 */
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception {

		logger.info("joinPost()");

		memberservice.memberJoin(member);

		logger.info("회원가입이 완료되었습니다.");

		return "redirect:/main";

	}

	/* 아이디 중복 검사 */
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception {

		logger.info("memberIdChk()");

		int result = memberservice.idCheck(memberId);

		// result가 0이 아니면 중복 아이디가 존재한다.
		if (result != 0)
			return "false";
		else
			return "true";

	}

	/* 전화번호 중복 검사 */
	@RequestMapping(value = "/memberPhChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberPhChkPOST(String memberPhone) throws Exception {

		logger.info("memberPhChk()");

		int result = memberservice.phCheck(memberPhone);
		logger.info(result + "");

		// result가 0이 아니면 중복 전화번호가 존재한다.
		if (result != 0)
			return "false";
		else
			return "true";

	}

	/* 로그인 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {

		logger.info("loginPOST()");

		HttpSession session = request.getSession();
		MemberVO loginVO = memberservice.memberLogin(member);

		if (loginVO == null) {
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "false";
		} else {
			session.setAttribute("member", loginVO);
			return "true";
		}

	}

	/* 로그아웃 */
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception {

		logger.info("logoutMainGET()");

		HttpSession session = request.getSession();

		session.invalidate();

		logger.info("로그아웃되었습니다.");

		return "redirect:/main";
	}

	/* 아이디 찾기 페이지 */
	@RequestMapping(value = "findId", method = RequestMethod.GET)
	public void findIdGet() throws Exception {

		logger.info("아이디 찾기 페이지입니다.");

	}

	/* 아이디 찾기 */
	@RequestMapping(value = "findIdAfter", method = RequestMethod.POST)
	public String findIdPost(MemberVO member, Model model) throws Exception {

		logger.info("아이디 찾기");

		model.addAttribute("idInfo", memberservice.findId(member));

		return "/member/findIdAfter";
	}

	/* 비밀번호 찾기 페이지 */
	@RequestMapping(value = "findPwd", method = RequestMethod.GET)
	public void findPwdGet() throws Exception {

		logger.info("비밀번호 찾기 페이지입니다.");

	}

	/* 비밀번호 찾기 */
	@RequestMapping(value = "findPwdAfter", method = RequestMethod.POST)
	public String findPwdPost(MemberVO member, Model model) throws Exception {

		logger.info("비밀번호 찾기");

		model.addAttribute("pwdInfo", memberservice.findPwd(member));
		
		logger.info(member.toString());

		return "/member/findPwdAfter";
	}

}
