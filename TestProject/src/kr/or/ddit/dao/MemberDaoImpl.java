package kr.or.ddit.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisSqlSessionFactory;
import kr.or.ddit.vo.MemberVO;

public class MemberDaoImpl implements IMemberDao {
	private static MemberDaoImpl dao;
	
	public MemberDaoImpl() {};
	
	public static MemberDaoImpl getDao() {
		if(dao == null) {
			dao = new MemberDaoImpl();
		}
		
		return dao;
	}

	@Override
	public int insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("board.insertMember", vo);
		} finally {
			if (session != null) {
				session.commit();
				session.close();
			}
		}
		return cnt;
	}
	
	@Override
	public MemberVO selectMemberByIdPw(String mem_id, String mem_pw) {
		// TODO Auto-generated method stub
		MemberVO vo = null;
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
	        Map<String, String> params = new HashMap<>();
	        params.put("mem_id", mem_id);
	        params.put("mem_pw", mem_pw);
	        vo = session.selectOne("board.selectMemberByIdPw", params);
		} finally {
			if (session != null) {
				session.commit();
				session.close();
			}
		}
		
		return vo;
	}

	@Override
	public int idDuplication(String mem_id) {
		// TODO Auto-generated method stub
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.selectOne("board.idDuplication", mem_id);
		} finally {
			if (session != null) {
				session.commit();
				session.close();
			}
		}
		
		return cnt;
	}
}
