package kr.co.hotel.hostReserve;

import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.main.HotelVO;
import kr.co.hotel.reserve.ReserveVO;

@Service
public interface HostReserveService {

	
	//--이하 마이페이지 예약내역리스트_빛찬--------------------
	public Map index(ReserveVO vo);
	
	
	public HotelVO get_hotelInfo(int host_no);
	
	public boolean rejectRev (int reserve_no);
	
	public int room_count (int host_no);
	
	//--이하 마이페이지 포인트 적립_형욱--------------------

	public int PointDeposit(ReserveVO vo, GuestVO gvo);
	public int checkout(ReserveVO vo);
}
