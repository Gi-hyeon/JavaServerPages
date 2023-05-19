package kr.or.ddit.main.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.FreeVO;
import kr.or.ddit.vo.NoticeVO;

@Repository
public class MainDAOImpl implements IMainDAO {

	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardVO> selectBoardList() {
		return sqlSession.selectList("Main.selectBoardList");
	}

	@Override
	public List<NoticeVO> selectNoticeList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Main.selectNoticeList");
	}

	@Override
	public List<FreeVO> selectFreeList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Main.selectFreeList");
	}

	@Override
	public int boardCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Main.boardCount");
	}

	@Override
	public int noticeCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Main.noticeCount");
	}

	@Override
	public int freeCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Main.freeCount");
	}

}
