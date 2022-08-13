package kr.co.hotel.reserve;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.guest.GuestVO;

@Mapper
public interface ReserveMapper {

	public GuestVO select(GuestVO vo);
	public int insert(ReserveVO vo);
	public void pointinsert(ReserveVO vo);
	public void guestUsedPointUpdate(GuestVO vo);
	public int reservecheck(ReserveVO vo);
	
	//이하 마이페이지 예약리스트_빛찬 
	public int count(ReserveVO vo);
	public List<ReserveVO> list (ReserveVO vo);
	
}
