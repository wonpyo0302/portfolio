package kr.co.hotel.coupon;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.hotel.guest.GuestVO;

@Service
public interface CouponService {

	public List<GuestVO> list(Map map);
	public GuestVO selectGuestNo(String guest_id);
	public int createCoupon(CouponVO vo);
	
}
