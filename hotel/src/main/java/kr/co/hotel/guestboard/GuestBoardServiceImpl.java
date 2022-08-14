package kr.co.hotel.guestboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GuestBoardServiceImpl implements GuestBoardService {

	@Autowired
	GuestBoardMapper mapper;

	//목록
	@Override
	public Map index(GuestBoardVO vo) {
		
		int totalCount = mapper.count(vo); //총 게시물수
		int totalPage = totalCount / vo.getPageRow(); //총 페이지수
		
		if (totalCount % vo.getPageRow() > 0 ) totalPage++;
		
		/*
		 * 총 게시물 수 12개 총 페이지는 12 / 한 페이지에 표시되는 행(게시물개수) 수 10개 1페이지(10행), 2행 12 % 10 > 0
		 */
		
		// 페이지별 시작 인덱스 mySQL 에서는 시작이 0부터니까 
		int startIdx = (vo.getPage() - 1 ) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<GuestBoardVO> list = mapper.list(vo);
		
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
	
	//등록
	@Override
	public boolean insert(GuestBoardVO vo) {
		return mapper.insert(vo) > 0? true : false;
	}
	
	//상세보기
	@Override
	public GuestBoardVO view(int gboard_no) {
		return mapper.view(gboard_no);
	}
	
	//수정폼
	@Override
	public GuestBoardVO edit(int gboard_no) {
		return mapper.view(gboard_no);
	}
	
	//수정처리
	@Override
	public boolean update(GuestBoardVO vo) {
		return mapper.update(vo) > 0 ? true : false;
	}

	//삭제
	@Override
	public boolean delete(int gboard_no) {
		return mapper.delete(gboard_no) > 0 ? true : false;
	}
	
	//조회수 처리
	@Override
	public int viewCount(int gboard_no) {
		return mapper.updateViewcount(gboard_no);
	}



	
}
