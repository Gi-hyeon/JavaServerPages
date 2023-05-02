package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.dao.IMemberDao;
import kr.or.ddit.dao.MemberDaoImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	private IMemberDao dao;
	private static MemberServiceImpl service;
	
	public MemberServiceImpl() {
		dao = MemberDaoImpl.getDao();
	}
	
	public static MemberServiceImpl getService() {
		if(service == null) {
			service = new MemberServiceImpl();
		}
		
		return service;
	}

	@Override
	public int insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.insertMember(vo);
	}
	
	@Override
	public MemberVO selectMemberByIdPw(String mem_id, String mem_pw) {
		// TODO Auto-generated method stub
		return dao.selectMemberByIdPw(mem_id, mem_pw);
	}

	@Override
	public int idDuplication(String mem_id) {
		// TODO Auto-generated method stub
		return dao.idDuplication(mem_id);
	}

}
