package kr.co.hotel.cancel;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.reserve.ReserveVO;

@Mapper
public interface CancelMapper {

	public List<LinkedHashMap> list(GuestVO vo);
	public int cancelPoint(ReserveVO vo);
	public int cancelGuestPoint(GuestVO vo);
	public int cancelReserve(ReserveVO vo);
	public void cancelCoupon(ReserveVO vo);
	
	
	public ReserveVO SelectReserve(ReserveVO vo);
	public int UpdateReserveStatus(ReserveVO vo);
	public int UpdateGuestPoint(ReserveVO vo);
	public int InsertPointTable(ReserveVO vo);
	public int UpdateCouponStatus(ReserveVO vo);
}
