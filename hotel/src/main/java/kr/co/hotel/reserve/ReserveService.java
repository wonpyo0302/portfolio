package kr.co.hotel.reserve;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.hotel.guest.GuestVO;

@Service
public interface ReserveService {

	public GuestVO select(GuestVO vo);
	public void insert(ReserveVO vo,GuestVO gvo);
	public int reservecheck(ReserveVO vo);
	public List<GuestVO> couponlist(GuestVO vo);
	public int CouponDelete();
	public void PointDeposit(ReserveVO vo, GuestVO gvo);
	
	
	//--이하 마이페이지 예약내역리스트_빛찬--------------------
	public Map index(ReserveVO vo);
	
}
