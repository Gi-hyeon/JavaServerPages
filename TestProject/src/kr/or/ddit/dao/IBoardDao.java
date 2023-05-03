package kr.or.ddit.dao;

import java.util.List;

import kr.or.ddit.vo.BoardVO;

public interface IBoardDao {
	// 전체 게시글 조회 메소드
	public List<BoardVO> selectAllBoard();
}
