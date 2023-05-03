package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.BoardVO;

public interface IBoardService {
	// 전체 게시글 조회 메소드
	public List<BoardVO> selectAllBoard();
}
