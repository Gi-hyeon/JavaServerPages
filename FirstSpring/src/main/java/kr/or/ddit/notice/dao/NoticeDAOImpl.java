package kr.or.ddit.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Repository
public class NoticeDAOImpl implements INoticeDAO {
	
	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Notice.insertNotice", noticeVO);
	}

	@Override
	public void incrementHit(int boNo) {
		// TODO Auto-generated method stub
		sqlSession.update("Notice.incrementHit", boNo);
	}

	@Override
	public NoticeVO selectNotice(int boNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Notice.selectNotice", boNo);
	}

	@Override
	public int deleteNotice(int boNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("Notice.deleteNotice", boNo);
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		return sqlSession.update("Notice.updateNotice", noticeVO);
	}

	@Override
	public int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Notice.selectNoticeCount", pagingVO);
	}

	@Override
	public List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Notice.selectNoticeList", pagingVO);
	}

	@Override
	public int noticeCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Notice.noticeCount");
	}

}
