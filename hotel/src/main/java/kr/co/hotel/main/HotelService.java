package kr.co.hotel.main;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;


public interface HotelService {
	
	public Model hotelTopFive(HotelVO vo, Model model);
	
	public List<HotelVO> searchList(HotelVO vo);
	
	public List<HotelVO> getDistrict(HotelVO vo);
	
	public List<HotelVO> stateInfo(HotelVO vo);
	
	public int searchCount(HotelVO vo);
	
	public List<LinkedHashMap>hotelView(int hotel_no);
	
}
