package kr.or.ddit.dao;

import kr.or.ddit.vo.MemberVO;

public interface IMemberDao {
	// 회원가입 멤버
	public int insertMember(MemberVO vo);
}
