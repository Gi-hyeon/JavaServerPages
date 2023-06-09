package kr.or.ddit.free.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.FreeVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Repository
public class FreeDAOImpl implements IFreeDAO {

	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertFree(FreeVO freeVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Free.insertFree", freeVO);
	}

	@Override
	public void incrementHit(int boNo) {
		// TODO Auto-generated method stub
		sqlSession.update("Free.incrementHit", boNo);
		
	}

	@Override
	public FreeVO selectFree(int boNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Free.selectFree", boNo);
	}

	@Override
	public int deletefree(int boNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("Free.deletefree", boNo);
	}

	@Override
	public int updateFree(FreeVO freeVO) {
		// TODO Auto-generated method stub
		return sqlSession.update("Free.updateFree", freeVO);
	}

	@Override
	public int selectFreeCount(PaginationInfoVO<FreeVO> pagingVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Free.selectFreeCount", pagingVO);
	}

	@Override
	public List<FreeVO> selectFreeList(PaginationInfoVO<FreeVO> pagingVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Free.selectFreeList", pagingVO);
	}

	@Override
	public int freeCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Free.freeCount");
	}

}
