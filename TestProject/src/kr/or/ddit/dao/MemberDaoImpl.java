package kr.or.ddit.dao;

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
}
