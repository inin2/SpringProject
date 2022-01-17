package com.mini.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mini.service.ReserveService;
import com.mini.vo.MemberVO;
import com.mini.vo.ReserveVO;

// http://localhost:8090/reserve

@Controller
public class ReserveController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	private ReserveService reserveservice;

	/* 예약 페이지 이동 */
	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	public String reservePageGET(int cakeId, Model model) {

		logger.info("예약 페이지입니다.");

		model.addAttribute("cakeInfo", reserveservice.cakeDetailGet(cakeId));

		return "reserve";
	}

	/* 마이 페이지 이동 */
	@RequestMapping(value = "/mypage/{memberId}", method = RequestMethod.GET)
	public String mypageGET(@PathVariable("memberId") String memberId, Model model) {

		logger.info("마이 페이지입니다.");

		model.addAttribute("reserveInfo", reserveservice.reserveCakeGet(memberId));

		return "mypage";
	}

	/* 케이크 예약 */
	@RequestMapping(value = "/reserve.do", method = RequestMethod.POST)
	@ResponseBody
	public String reserveCake(ReserveVO reserve, HttpServletRequest request) throws Exception {

		// 로그인 체크
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		// 로그인되지 않았을 경우
		if (mvo == null) {
			return "false";
		}

		int result = reserveservice.reserveCake(reserve);

		return result + "";
	}

	/* 케이크 예약 취소 */
	@RequestMapping(value = "/reserveCancle.do", method = RequestMethod.GET)
	public String reserveCancle(int reserveId, HttpServletRequest request) {
		
		reserveservice.reserveCancle(reserveId);
		
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		return "redirect:"+ referer; // 이전 페이지
	}

}
