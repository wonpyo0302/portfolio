package kr.co.hotel.coupon;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.guest.GuestVO;

@Mapper
public interface CouponMapper {

	public List<GuestVO> list(Map map);
	public GuestVO selectGuestNo(String guest_id);
	public int couponNodup(CouponVO vo);
	public int createCoupon(CouponVO vo);
	
	//---이하 빛찬-----------------------------------
	public int count (CouponVO vo);
	
	public List<CouponVO> C_list(CouponVO vo);
	
	
}
