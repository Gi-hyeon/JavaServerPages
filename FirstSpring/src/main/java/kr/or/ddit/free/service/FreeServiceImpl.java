package kr.or.ddit.free.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.free.dao.IFreeDAO;
import kr.or.ddit.vo.FreeVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Service
public class FreeServiceImpl implements IFreeService {
	
	@Inject
	private IFreeDAO freeDao;
	
	@Override
	public ServiceResult insertFree(FreeVO freeVO) {
		// TODO Auto-generated method stub
		ServiceResult result = null;
		
		int status = freeDao.insertFree(freeVO);
		if(status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public FreeVO selectFree(int boNo) {
		// TODO Auto-generated method stub
		freeDao.incrementHit(boNo);
		return freeDao.selectFree(boNo);
	}

	@Override
	public ServiceResult deletefree(int boNo) {
		// TODO Auto-generated method stub
		ServiceResult result = null;
		int status = freeDao.deletefree(boNo);
		
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult updateFree(FreeVO freeVO) {
		// TODO Auto-generated method stub
		ServiceResult result = null;

		int status = freeDao.updateFree(freeVO);
		if(status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public int selectFreeCount(PaginationInfoVO<FreeVO> pagingVO) {
		// TODO Auto-generated method stub
		return freeDao.selectFreeCount(pagingVO);
	}

	@Override
	public List<FreeVO> selectFreeList(PaginationInfoVO<FreeVO> pagingVO) {
		// TODO Auto-generated method stub
		return freeDao.selectFreeList(pagingVO);
	}

	@Override
	public int freeCount() {
		// TODO Auto-generated method stub
		return freeDao.freeCount();
	}

}
