package kr.or.ddit.notice.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Controller
@RequestMapping("/notice")
public class noticeController {
	
	@Inject
	private INoticeService noticeService;
	
	@RequestMapping(value = "/list.do")
	public String noticeList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		PaginationInfoVO<NoticeVO> pagingVO = new PaginationInfoVO<NoticeVO>();
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = noticeService.selectNoticeCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<NoticeVO> dataList = noticeService.selectNoticeList(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		
		int nCount = noticeService.noticeCount();
		model.addAttribute("nCount", nCount);
		
		return "notice/list";
	}
	
	@RequestMapping(value = "/form.do" )
	public String noticeForm() {
		
		return "notice/form";
	}
	
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String noticeInsert(NoticeVO noticeVO, Model model) {
		String goPage = "";
		
		Map<String, String> errors = new HashMap<String, String>();
		System.out.println("111111111111111111111 -> "+ noticeVO.getBoTitle());
		System.out.println("222222222222222222222 -> "+ noticeVO.getBoContent());
		
		if(StringUtils.isBlank(noticeVO.getBoTitle())) {
			errors.put("boTitle", "제목을 입력하세요!");
		}
		if(StringUtils.isBlank(noticeVO.getBoContent())) {
			errors.put("boContent", "내용을 입력하세요!");
		}
		
		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("notice", noticeVO);
			goPage = "notice/form";
		} else {
			noticeVO.setBoWriter("a002");
			ServiceResult result = noticeService.insertNotice(noticeVO);
			if (result.equals(ServiceResult.OK)) {
				goPage = "redirect:/notice/detail.do?boNo=" + noticeVO.getBoNo();
			} else {
				errors.put("msg", "서버 에러!!!!!!!!!!!!!!!!!!");
				model.addAttribute("errors", errors);
				goPage = "notice/form";
			}
		}
		
		return goPage;
	}
	
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String noticeDetail(int boNo, Model model) {
		NoticeVO noticeVO = noticeService.selectNotice(boNo);
		model.addAttribute("notice", noticeVO);
		return "notice/view";
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String noticeDelete(int boNo, Model model) {
		String goPage = "";
		ServiceResult result = noticeService.deleteNotice(boNo);
		
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/notice/list.do";
		} else {
			goPage = "redirect:/notice/detail.do?boNo=" + boNo;
		}
		
		return goPage;
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String noticeUpdate(NoticeVO noticeVO, Model model) {
		String goPage = "";
		
		System.out.println("boNO ----------------------> " + noticeVO.getBoNo());
		System.out.println("boTitle ----------------------> " + noticeVO.getBoTitle());
		System.out.println("boContent ----------------------> " + noticeVO.getBoContent());
 		ServiceResult result = noticeService.updateNotice(noticeVO);
		if (result.equals(ServiceResult.OK)) {
			goPage = "redirect:/notice/detail.do?boNo=" + noticeVO.getBoNo();
		} else {
			model.addAttribute("notice", noticeVO);
			model.addAttribute("status", "u");
			goPage = "notice/list";
		}
		return goPage;
	}
}














