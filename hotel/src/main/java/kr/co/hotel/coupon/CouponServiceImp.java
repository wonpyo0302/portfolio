package kr.co.hotel.coupon;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hotel.guest.GuestVO;

@Service
public class CouponServiceImp implements CouponService {

	@Autowired
	CouponMapper mapper;

	@Override
	public List<GuestVO> list() {
		return mapper.list();
	}

	@Override
	public GuestVO selectGuestNo(String guest_id) {
		return mapper.selectGuestNo(guest_id);
	}
	
	@Override
	public int createCoupon(CouponVO vo) {
		boolean result=true;
		while(result) {
			String temp="";
			for(int i=0; i<2;i++) {
				temp+=(char)(Math.random()*26+65);
			}
			for(int i=0; i<2;i++) {
				temp+=(char)(Math.random()*26+97);
			}
			temp+="-";
			for(int i=0; i<4;i++) {
				temp +=(int)(Math.random()*9);
			}
			vo.setCoupon_no(temp);
			if(mapper.couponNodup(vo) != 1) {
				break;
			}
			
		}
		return mapper.createCoupon(vo);
	}

	
	
}
