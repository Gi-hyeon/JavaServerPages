package kr.or.ddit.dao;

public class BoardDaoImpl implements IBoardDao {
	private static BoardDaoImpl dao;
	
	public BoardDaoImpl() {};
	
	public static BoardDaoImpl getDao() {
		if(dao == null) {
			dao = new BoardDaoImpl();
		}
		
		return dao;
	}
}
