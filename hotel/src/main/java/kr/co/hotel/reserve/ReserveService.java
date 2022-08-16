package kr.co.hotel.reserve;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.co.hotel.coupon.CouponVO;
import kr.co.hotel.guest.GuestVO;

@Service
public interface ReserveService {

	public GuestVO select(GuestVO vo);
	public void insert(ReserveVO vo,GuestVO gvo);
	public int reservecheck(ReserveVO vo);
	public List<GuestVO> couponlist(GuestVO vo);
	public int CouponDelete();
	public void PointDeposit(ReserveVO vo, GuestVO gvo);
	
}
