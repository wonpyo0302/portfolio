package kr.co.hotel.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HotelMapper {
	public int count(HotelVO vo);
	public List<HotelVO> list(HotelVO vo);
	
	int insertMain(Map map);
	List<HotelVO> listSeoul(HotelVO vo);
	List<HotelVO> listIncheon(HotelVO vo);
	List<HotelVO> listKyeonggi(HotelVO vo);
	List<HotelVO> searchList(HotelVO vo);
	
	
	public List<HotelVO> pagingList(HotelVO vo);
	
	int roomData(HotelVO vo);
}
