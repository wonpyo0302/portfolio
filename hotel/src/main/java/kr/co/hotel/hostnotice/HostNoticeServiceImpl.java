package kr.co.hotel.hostnotice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hotel.guestboard.GuestBoardVO;

@Service
public class HostNoticeServiceImpl implements HostNoticeService {
	
	@Autowired
	HostNoticeMapper mapper;

	@Override
	public Map index(HostNoticeVO vo) {
		int totalCount = mapper.count(vo.getHnotice_no()) ; //총 게시물수
		int totalPage = totalCount / vo.getPageRow(); //총 페이지수
		
		if (totalCount % vo.getPageRow() > 0 ) totalPage++;
		
		// 페이지별 시작 인덱스 mySQL 에서는 시작이 0부터니까 
		int startIdx = (vo.getPage() - 1 ) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<HostNoticeVO> list = mapper.list(vo);
		
		// 페이징처리
		int endPage = (int)(Math.ceil(vo.getPage()/10.0) * 10);
		int startPage = endPage - 9;
		
		if (endPage > totalPage) endPage = totalPage;
		
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true : false;
		
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startIdx", startIdx);
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		return map;
	}

	@Override
	public boolean insert(HostNoticeVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}


	@Override
	public int updateViewcount(int hnotice_no) {
		return mapper.updateViewcount(hnotice_no);
	}

	@Override
	public boolean update(HostNoticeVO vo) {
		return mapper.update(vo) > 0 ? true : false;
	}

	@Override
	public boolean delete(int hnotice_no) {
		return mapper.delete(hnotice_no) > 0 ? true : false;
	}


	@Override
	public HostNoticeVO view(HostNoticeVO vo) {
		return mapper.view(vo);
	}

	@Override
	public HostNoticeVO edit(int hnotice_no) {
		// TODO Auto-generated method stub
		return null;
	}




	
}
