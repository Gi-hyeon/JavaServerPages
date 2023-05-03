package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.dao.BoardDaoImpl;
import kr.or.ddit.dao.IBoardDao;
import kr.or.ddit.vo.BoardVO;

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

	@Override
	public List<BoardVO> selectAllBoard() {
		// TODO Auto-generated method stub
		return dao.selectAllBoard();
	}
}
