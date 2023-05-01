package kr.or.ddit.service;

import kr.or.ddit.dao.BoardDaoImpl;
import kr.or.ddit.dao.IBoardDao;

public class BoardServiceImpl implements IBoardService {
	private IBoardDao dao;
	private static BoardServiceImpl service;
	
	public BoardServiceImpl() {
		dao = BoardDaoImpl.getDao();
	}
	
	public static BoardServiceImpl getService() {
		if(service == null) {
			service = new BoardServiceImpl();
		}
		
		return service;
	}
}
