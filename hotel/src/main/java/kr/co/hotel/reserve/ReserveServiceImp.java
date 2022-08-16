package kr.co.hotel.reserve;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hotel.HRRegister.RoomVO;
import kr.co.hotel.guest.GuestVO;

@Service
public class ReserveServiceImp implements ReserveService {

	@Autowired
	ReserveMapper mapper;
	
	@Override
	public GuestVO select(GuestVO vo) {
		return mapper.select(vo);
	}

	@Override
	public void insert(ReserveVO vo,GuestVO gvo) {
		mapper.insert(vo);
		mapper.guestUsedPointUpdate(gvo);
		mapper.pointinsert(vo);
	}

	@Override
	public int reservecheck(ReserveVO vo) {
		return mapper.reservecheck(vo);
	}
	
	
	//--이하 마이페이지 예약내역리스트_빛찬--------------------
	@Override
	public Map index(ReserveVO vo) {
		
		int totalCount = mapper.count(vo);//총개시물 수
		//총 페이지 수
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		
		//시작 인덱스
		int startIdx = (vo.getPage()-1)*vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<ReserveVO> list = mapper.list(vo);
		
		//페이징 처리
		int endPage = (int)(Math.ceil(vo.getPage()/10.0)*10);
		int startPage = endPage - 9;
		if(endPage > totalPage) endPage= totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true : false;
		
		Map map= new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("list", list);
		map.put("page", vo.getPage());
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
		return map;
	}



	

}
