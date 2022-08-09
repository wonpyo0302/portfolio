package kr.co.hotel.reserve;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.guest.GuestVO;

@Mapper
public interface ReserveMapper {

	public GuestVO select(GuestVO vo);
	public int insert(ReserveVO vo);
	public void pointinsert(ReserveVO vo);
	public void guestUsedPointUpdate(GuestVO vo);
	public int reservecheck(ReserveVO vo);
	
}
