package kr.co.hotel.main;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;


public interface HotelService {
	//목록
	public Map<String, Object> getList(HotelVO vo);
	
	public Model hotelTopFive(HotelVO vo, Model model);
	
	public Model imageInMainPage(HotelVO vo, Model model);
	
	public List<HotelVO> searchList(HotelVO vo);
	
}
