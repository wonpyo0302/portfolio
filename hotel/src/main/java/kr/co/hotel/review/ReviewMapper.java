package kr.co.hotel.review;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.reserve.ReserveVO;

@Mapper
public interface ReviewMapper {
	
	public ReserveVO get_reserve (ReviewVO vo);
	

}
