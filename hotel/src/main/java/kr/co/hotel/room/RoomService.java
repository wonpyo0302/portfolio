package kr.co.hotel.room;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;


public interface RoomService {
	
	public Model hotelTopFive(RoomVO vo, Model model);
	
	public List<RoomVO> searchList(RoomVO vo);
	
	public List<RoomVO> getDistrict(RoomVO vo);
	
	public List<RoomVO> stateInfo(RoomVO vo);
	
	public int searchCount(RoomVO vo);
	
	public List<RoomVO> hotelView(int hotel_no);
	
}
