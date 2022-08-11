package kr.co.hotel.main;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HotelMapper {
	public int count(HotelVO vo);
	public List<HotelVO> list(HotelVO vo);
	
	//api 호텔데이터 인서트
	int insertMain(Map map);
	
	//지역별 5개추천
	List<HotelVO> hotelTopFive(HotelVO vo);
	
	//목록검색
	List<HotelVO> searchList(HotelVO vo); 
	
	//페이징처리
	public List<HotelVO> pagingList(HotelVO vo);
	
	//시군구코드 및 이름 가져오기
	List<HotelVO> getDistrict(HotelVO vo);
	List<HotelVO> getState(HotelVO vo);
	
}
