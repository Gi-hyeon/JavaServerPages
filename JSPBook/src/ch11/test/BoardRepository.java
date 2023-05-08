package ch11.test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import oracle.net.aso.n;

public class BoardRepository {
	private static int no = 0;
	private ArrayList<BoardVO> listOfBoard = new ArrayList<BoardVO>();
	private static BoardRepository instance = new BoardRepository();
	
	public static BoardRepository getInstance() {
		return instance;
	}
	
	// 게시판 목록 전체 가져오기
	public ArrayList<BoardVO> selectBoardList(){
		return listOfBoard;
	}
	
	// 게시글 1개 가져오기
	public BoardVO getBoardById(int no) {
		BoardVO boardByNo = null;
		
		for(int i=0; i<listOfBoard.size(); i++) {
			BoardVO board = listOfBoard.get(i);
			if(board.getNo() == no) {
				boardByNo = board;
			}
		}
		
		return boardByNo;
	}
	
	public BoardRepository() {
		// TODO Auto-generated constructor stub
		BoardVO vo1 = new BoardVO();
		vo1.setNo(0);
		vo1.setTitle("test1");
		vo1.setContent("test1");
		vo1.setRegDate("2022/08/11");
		vo1.setHit(0);
		vo1.setWriter("test1");
		
		listOfBoard.add(vo1);
	}
	
	// 게시글 삭제
	public void deleteBoard(int no) {
		for(int i=0; i<listOfBoard.size(); i++) {
			BoardVO board = listOfBoard.get(i);
			if(board.getNo() == no) {
				listOfBoard.remove(board);
			}
		}
	}
	
	// 게시글 수정
	public void updateBoard(BoardVO board) {
		int boardNo = board.getNo();
		for(int i=0; i<listOfBoard.size(); i++) {
			BoardVO vo = listOfBoard.get(i);
			if(vo.getNo() == boardNo) {
				vo.setTitle(board.getTitle());
				vo.setContent(board.getContent());
				vo.setWriter(board.getWriter());
				vo.setRegDate(getCurrenTime());
			}
		}
	}
	
	// 게시글 추가
	public void addBoard(BoardVO board) {
		++no;
		listOfBoard.add(board);
	}
	
	// 게시글 번호 가져오기
	public int getNo() {
		return no;
	}
	
	// 날짜 출력할때 활용
	public String getCurrenTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(cal.getTime());
	}
}
