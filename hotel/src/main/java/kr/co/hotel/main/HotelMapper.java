package kr.co.hotel.main;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.HRRegister.ImageVO;
import kr.co.hotel.room.RoomVO;

@Mapper
public interface HotelMapper {
	
	//api 호텔데이터 인서트
	int insertMain(Map map);
	
	//지역별 5개추천
	List<HotelVO> hotelTopFive(HotelVO vo);
	
	//목록검색
	List<HotelVO> searchList(HotelVO vo); 
	//목록개수
	int searchCount(HotelVO vo);
	
	//시군구코드 및 이름 가져오기
	List<HotelVO> getDistrict(HotelVO vo);
	List<HotelVO> getState(HotelVO vo);
	
	//호텔상세보기
	List<RoomVO> roomList(int hotel_no);
	HotelVO hotelView(int hotel_no);
	//ImageVO  insertImage(ImageVO vo);
	
	//호텔,객실 이미지 가져오기
	List<HotelVO> getHotelImage(int hotel_no);
	List<ImageVO> getRoomImage(int room_no);
	
	HotelVO getHostHotel(int host_no);
	List<RoomVO> getHostRoom(int host_no);
	List<ImageVO> getHostHotelImage(int host_no);
	List<ImageVO> getHostRoomImage(int host_no);
	
	void setConfirm(HotelVO vo);
}
