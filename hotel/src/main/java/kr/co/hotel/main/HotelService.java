package kr.co.hotel.main;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import kr.co.hotel.HRRegister.ImageVO;
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
	List<ImageVO> getRoomImage(int room_no);
	
	void setConfirm(HotelVO vo);
	
	Map hostView(int host_no);
}
