package kr.or.ddit.free.dao;

import java.util.List;

import kr.or.ddit.vo.FreeVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IFreeDAO {

	public int insertFree(FreeVO freeVO);

	public void incrementHit(int boNo);

	public FreeVO selectFree(int boNo);

	public int deletefree(int boNo);

	public int updateFree(FreeVO freeVO);

	public int selectFreeCount(PaginationInfoVO<FreeVO> pagingVO);

	public List<FreeVO> selectFreeList(PaginationInfoVO<FreeVO> pagingVO);

	public int freeCount();

}
