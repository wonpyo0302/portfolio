package kr.co.hotel.board;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


public interface HotelService {
	//목록
	public Map<String, Object> getList(HotelVO vo);
	public List<HotelVO> listSeoul(HotelVO vo);
	public List<HotelVO> listIncheon(HotelVO vo);
	public List<HotelVO> listKyeonggi(HotelVO vo);
	
}
