package kr.co.hotel.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.point.PointVO;


@Controller

public class CouponController {
	
	@Autowired
	CouponService service;

	@GetMapping("coupon/create.do")
	public String create(Model model, HttpSession session) {
		Map map = new HashMap();
		model.addAttribute("data",service.list(map));
		return "/coupon/create";
	}
	
	@GetMapping("coupon/idList.do")
	public String idList(Model model, @RequestParam(required = false) String idsearch) {
		Map map = new HashMap();
		map.put("idsearch", idsearch);
		model.addAttribute("data",service.list(map));
		return "/coupon/idList";
	}
	
	@PostMapping("coupon/create.do")
	public void createpro(GuestVO gvo, CouponVO cvo, 
			@RequestParam List<String> guest_id, 
			@RequestParam List<Integer>coupon_price,
			@RequestParam List<Integer>amount) {
		
			for(String id : guest_id) {
				for(int price : coupon_price) {
					if (price == 1000) {
						for(int i=0; i<amount.get(0); i++) {
							cvo.setGuest_no((service.selectGuestNo(id)).getGuest_no());
							cvo.setCoupon_price(price);
							service.createCoupon(cvo);
						}
					}
					if(price == 5000) {
						for(int i=0; i<amount.get(1); i++) {
							cvo.setGuest_no((service.selectGuestNo(id)).getGuest_no());
							cvo.setCoupon_price(price);
							service.createCoupon(cvo);
						}
					}
					if(price == 10000) {
						for(int i=0; i<amount.get(2); i++) {
							cvo.setGuest_no((service.selectGuestNo(id)).getGuest_no());
							cvo.setCoupon_price(price);
							service.createCoupon(cvo);
						}
					}
				}
			}
	}
	
	//--------이하 빛찬--------------------------------------------------
	
	@GetMapping("/coupon/index.do")
	public String list(CouponVO vo, Model model, HttpSession sess) {
		try {
			
		//GuestMemberVO loginInfo = (GuestMemberVO)sess.getAttribute("loginInfo"); 		//세션에서 guest_no를 불러옵니다.
		//GuestVO loginInfo1 = new GuestVO();//demo GuestMemberVO()
		//loginInfo1.setGuest_no(25); //demo guest_no 
		//loginInfo1.setGuest_name("호스트_빛찬");
		//sess.setAttribute("loginInfo", loginInfo1);
		
		GuestVO loginInfo= (GuestVO)sess.getAttribute("loginInfo");
		vo.setGuest_no(loginInfo.getGuest_no());
		Map map = service.index(vo);
		model.addAttribute("coupon", map);
		
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("pointController에서 예외발생!");
		}
		return "coupon/index";
	}
	
	
	
	
	
	
	
	
	
	
}
