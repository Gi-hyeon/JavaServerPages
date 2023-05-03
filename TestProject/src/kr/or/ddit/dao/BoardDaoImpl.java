package kr.or.ddit.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisSqlSessionFactory;
import kr.or.ddit.vo.BoardVO;

public class BoardDaoImpl implements IBoardDao {
	private static BoardDaoImpl dao;
	
	public BoardDaoImpl() {};
	
	public static BoardDaoImpl getDao() {
		if(dao == null) {
			dao = new BoardDaoImpl();
		}
		
		return dao;
	}

	@Override
	public List<BoardVO> selectAllBoard() {
		// TODO Auto-generated method stub
		List<BoardVO> list = null;
		SqlSession session = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("board.selectAllBoard");
		} finally {
			if (session != null) {
				session.commit();
				session.close();
			}
		}
		
		return list;
	}
}
