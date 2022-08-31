package kr.co.hotel.point;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.main.HotelVO;
import kr.co.hotel.reserve.ReserveVO;


@Mapper
public interface PointMapper {
	
	int count(PointVO vo);
	HotelVO hotellist(ReserveVO vo);
	
	List<PointVO> list(PointVO vo);
	Integer total (int guest_no);
	
	int delete (int no);
	

}