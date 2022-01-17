package com.mini.service;

import com.mini.vo.MemberVO;

public interface MemberService {

	/* 회원가입 */
	public void memberJoin(MemberVO member) throws Exception;
	
	/* 아이디 중복 검사 */
	public int idCheck(String memberId) throws Exception;
	
	/* 전화번호 중복 검사 */
	public int phCheck(String memberPhone) throws Exception;
	
	/* 로그인 */
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	/* 아이디 찾기 */
	public String findId(MemberVO member) throws Exception;
	
	/* 비밀번호 찾기 */
	public String findPwd(MemberVO member) throws Exception;

}
