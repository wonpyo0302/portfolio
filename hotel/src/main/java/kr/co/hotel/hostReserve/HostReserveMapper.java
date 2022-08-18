package kr.co.hotel.hostReserve;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.main.HotelVO;
import kr.co.hotel.reserve.ReserveVO;

@Mapper
public interface HostReserveMapper {

	//이하 마이페이지 예약리스트_빛찬 
	public int count(ReserveVO vo);
	
	public List<ReserveVO> list (ReserveVO vo);
	
	public HotelVO get_hotelInfo(int host_no);
	
	public int rejectRev (int reserve_no);
	
	//--이하 마이페이지 포인트 적립_형욱--------------------
	public ReserveVO reservelist(ReserveVO vo);
	public int UpdatePointDeposit(ReserveVO vo);
	public void guestUsedPointUpdate(GuestVO vo);
	public int InsertPointDeposit(ReserveVO vo);
	public GuestVO gvolist(ReserveVO vo);
	public int checkout(ReserveVO vo);

}
