package kr.co.hotel.main;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;


public interface HotelService {
	
	public Model hotelTopFive(HotelVO vo, Model model);
	
	public List<HotelVO> searchList(HotelVO vo);
	
	public List<HotelVO> getDistrict(HotelVO vo);
	
	public List<HotelVO> stateInfo(HotelVO vo);
	
}
