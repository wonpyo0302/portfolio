package kr.co.hotel.room;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.HRRegister.ImageVO;

@Mapper
public interface RoomMapper {
	
	//api 호텔데이터 인서트
	int insertMain(Map map);
	
	//지역별 5개추천
	List<RoomVO> hotelTopFive(RoomVO vo);
	
	//목록검색
	List<RoomVO> searchList(RoomVO vo); 
	//목록개수
	int searchCount(RoomVO vo);
	
	//시군구코드 및 이름 가져오기
	List<RoomVO> getDistrict(RoomVO vo);
	List<RoomVO> getState(RoomVO vo);
	
	//호텔상세보기
	List<RoomVO> hotelView(int hotel_no);
	
	//ImageVO  insertImage(ImageVO vo);
	
	
	
}
