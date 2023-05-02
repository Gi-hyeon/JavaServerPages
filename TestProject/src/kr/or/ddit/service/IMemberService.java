package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.MemberVO;

public interface IMemberService {
	// 회원가입 멤버
	public int insertMember(MemberVO vo);
	
	// 멤버 전체 조회로 로그인하기
	public MemberVO selectMemberByIdPw(String mem_id, String mem_pw);
	
	// 회원가입 아이디 중복 검사
	public int idDuplication(String mem_id);
}
