package com.mycompany.service;

import com.mycompany.vo.MemberVO;

public interface MemberService {
	
	/* 로그인 */
	public MemberVO memberLogin(MemberVO member) throws Exception;

}
