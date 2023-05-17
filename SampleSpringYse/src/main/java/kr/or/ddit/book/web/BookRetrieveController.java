package kr.or.ddit.book.web;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.book.service.BookService;

@Controller
@RequestMapping("/book")
public class BookRetrieveController {
	
	@Inject
	private BookService bookService;
	
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String, Object> map) {
		// 데이터베이스에서 조회한 결과를 detailMap 변수에 담는다.
		Map<String, Object> detailMap = bookService.selectBook(map);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("book", detailMap);
		
		String bookId = map.get("bookId").toString();
		mav.addObject("bookId", bookId);
		
		mav.setViewName("book/detail");
		
		return mav;
	}
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam Map<String, Object> map) {
		/*
		 * name이 곧 map의 key가 되서 들어간다...
		 * name값으로 db에 보냈는데 book_id가 아니라 BOOK_ID로 넘어오는 경우가 있다? 
		 *  ㄴ 컬럼으로 데이터를 조회하기 때문에 변경되서 다시 바인딩된다.
		 */
		List<Map<String, Object>> list = bookService.selectBookList(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		
		// 검색 기능 추가
		// 목록 페이지에서는 keyowrd가 HTTP 파라미터가 있을 수도 있고, 없을 수도 있다.
		if(map.containsKey("keyword")){
			mav.addObject("keyword", map.get("keyword"));
		}
		
		
		mav.setViewName("book/list");
		
		return mav;
	}
}