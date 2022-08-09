package kr.co.hotel.coupon;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.hotel.guest.GuestVO;

@Service
public interface CouponService {

	public List<GuestVO> list();
	public GuestVO selectGuestNo(String guest_id);
	public int createCoupon(CouponVO vo);
	
}
