package com.mini.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.mapper.MemberMapper;
import com.mini.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper membermapper;

	/* 회원가입 */
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		membermapper.memberJoin(member);
	}

	/* 아이디 중복 검사 */
	@Override
	public int idCheck(String memberId) throws Exception {
		return membermapper.idCheck(memberId);
	}

	/* 전화번호 중복 검사 */
	@Override
	public int phCheck(String memberPhone) throws Exception {
		return membermapper.phCheck(memberPhone);
	}

	/* 로그인 */
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		return membermapper.memberLogin(member);
	}

	/* 아이디 찾기 */
	@Override
	public String findId(MemberVO member) throws Exception {
		return membermapper.findId(member);

	}

	/* 비밀번호 찾기 */
	@Override
	public String findPwd(MemberVO member) throws Exception {
		return membermapper.findPwd(member);
	}

}
