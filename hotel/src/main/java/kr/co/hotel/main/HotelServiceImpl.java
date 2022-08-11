package kr.co.hotel.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class HotelServiceImpl implements HotelService {
	
	@Autowired
	HotelMapper mapper;

	@Override
	public Map getList(HotelVO vo) {
		int totalCount = mapper.count(vo);
		int totalPage = totalCount / vo.getPageRow();
		if (totalCount % vo.getPageRow() > 0) totalPage++;
		
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<HotelVO> list = mapper.list(vo);
		
		//페이징처리****
		int endPage = (int)(Math.ceil(vo.getPage()/10.0)*vo.getPageRow());
		int startPage = endPage - 9;
		if(endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true : false;
		
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		
		return map;
	}

	@Override
	public List<HotelVO> searchList(HotelVO vo) {
		return mapper.searchList(vo);
	}

	@Override
	public Model hotelTopFive(HotelVO vo, Model model) {
		vo.setState_code(11);
		model.addAttribute("listSeoul",mapper.hotelTopFive(vo));
		vo.setState_code(23);
		model.addAttribute("listIncheon",mapper.hotelTopFive(vo));
		vo.setState_code(31);
		model.addAttribute("listKyeonggi",mapper.hotelTopFive(vo));
		return model;
	}

	@Override
	public List<HotelVO> LocationInfo(HotelVO vo) {
		return mapper.getDistrict(vo);
	}

}
