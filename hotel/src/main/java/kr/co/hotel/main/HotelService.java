package kr.co.hotel.main;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import kr.co.hotel.room.RoomVO;


public interface HotelService {
	
	public Model hotelTopFive(HotelVO vo, Model model);
	
	public List<HotelVO> searchList(HotelVO vo);
	
	public List<HotelVO> getDistrict(HotelVO vo);
	
	public List<HotelVO> stateInfo(HotelVO vo);
	
	public int searchCount(HotelVO vo);
	
	public List<RoomVO> roomList(int hotel_no);
	
	public HotelVO hotelView(int hotel_no);
	
	List<HotelVO> getHotelImage(int hotel_no);
	List<RoomVO> getRoomImage(RoomVO rvo);
	
	
}
