package kr.or.ddit.free.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.free.service.IFreeService;
import kr.or.ddit.vo.FreeVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Controller
@RequestMapping("/free")
public class FreeController {
	
	@Inject
	private IFreeService freeService;
	
	@RequestMapping(value = "/list.do")
	public String freeList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		PaginationInfoVO<FreeVO> pagingVO = new PaginationInfoVO<FreeVO>();
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = freeService.selectFreeCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<FreeVO> dataList = freeService.selectFreeList(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		
		int fCount = freeService.freeCount();
		model.addAttribute("fCount", fCount);
		
		return "free/list";
	}
	
	@RequestMapping(value = "/form.do", method = RequestMethod.GET)
	public String freeForm() {
		return "free/form";
	}
	
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String freeInsert(FreeVO freeVO, Model model) {
		String goPage = "";
		
		Map<String, String> errors = new HashMap<String, String>();
		
		if(StringUtils.isBlank(freeVO.getBoTitle())) {
			errors.put("boTitle", "제목을 입력하세요!");
		}
		if(StringUtils.isBlank(freeVO.getBoContent())) {
			errors.put("boContent", "내용을 입력하세요!");
		}
		
		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("free", freeVO);
			goPage = "free/form";
		} else {
			freeVO.setBoWriter("a002");
			ServiceResult result = freeService.insertFree(freeVO);
			if (result.equals(ServiceResult.OK)) {
				goPage = "redirect:/free/detail.do?boNo=" + freeVO.getBoNo();
			} else {
				errors.put("msg", "서버 에러!!!!!!!!!!!!!!!!!!");
				model.addAttribute("errors", errors);
				goPage = "free/form";
			}
		}
		
		return goPage;
	}
	
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String freeDetail(int boNo, Model model) {
		FreeVO freeVO = freeService.selectFree(boNo);
		model.addAttribute("free", freeVO);
		return "free/view";
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String freeDelete(int boNo, Model model) {
		String goPage = "";
		ServiceResult result = freeService.deletefree(boNo);
		
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/free/list.do";
		} else {
			goPage = "redirect:/free/detail.do?boNo=" + boNo;
		}
		
		return goPage;
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String freeUpdate(FreeVO freeVO, Model model) {
		String goPage = "";
		
		System.out.println("boNO ----------------------> " + freeVO.getBoNo());
		System.out.println("boTitle ----------------------> " + freeVO.getBoTitle());
		System.out.println("boContent ----------------------> " + freeVO.getBoContent());
 		ServiceResult result = freeService.updateFree(freeVO);
		if (result.equals(ServiceResult.OK)) {
			goPage = "redirect:/free/detail.do?boNo=" + freeVO.getBoNo();
		} else {
			model.addAttribute("free", freeVO);
			model.addAttribute("status", "u");
			goPage = "free/list";
		}
		return goPage;
	}
}

































