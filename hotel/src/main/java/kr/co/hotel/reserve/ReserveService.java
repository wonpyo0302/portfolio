package kr.co.hotel.reserve;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.host.HostVO;
import kr.co.hotel.main.HotelVO;
import kr.co.hotel.room.RoomVO;

@Service
public interface ReserveService {

	public GuestVO select(GuestVO vo);
	public int insert(ReserveVO vo,GuestVO gvo);
	public int reservecheck(ReserveVO vo);
	public List<GuestVO> couponlist(GuestVO vo);
	public int CouponDelete();
	public int PointDeposit(ReserveVO vo, GuestVO gvo);
	public HostVO SelectHostNo(HotelVO vo);
	public HotelVO SelectHotelInfo(HotelVO vo);
	public RoomVO SelectRoomInfo(ReserveVO vo);
	public ReserveVO SelectReserveInfo(ReserveVO vo);
	
	
	//--이하 마이페이지 예약내역리스트_빛찬--------------------
	public Map index(ReserveVO vo);
	
}
