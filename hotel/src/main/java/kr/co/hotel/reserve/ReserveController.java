package kr.co.hotel.reserve;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.main.HotelVO;

@Controller

public class ReserveController {
	
	@Autowired
	ReserveService service;
	
	//예약하기
	@PostMapping("/reserve/reserve.do")
	public String reserve(ReserveVO vo, HotelVO hvo, Model model) {
		model.addAttribute("hotelinfo",service.SelectHotelInfo(hvo) );
		model.addAttribute("roominfo", service.SelectRoomInfo(vo));
		return "/reserve/reserve";
	}
	
	//보유 쿠폰 리스트
	@GetMapping("/reserve/couponlist.do")
	public String couponlist(GuestVO vo, Model model) {
		model.addAttribute("data", service.couponlist(vo));
		return "/reserve/couponlist";
	}
	
	//예약하기
	@PostMapping("/reserve/reserveinsert.do")
	@ResponseBody
	public int reserveinsert(ReserveVO vo,GuestVO gvo, Model model) {
		System.out.println("===================================="+vo.getTotal_price());
		return service.insert(vo, gvo); //0,1조회값
	}
	
	//예약 중복체크
	@PostMapping("/reserve/reservecheck.do")
	@ResponseBody
	public int reservecheck(ReserveVO vo) {
		return service.reservecheck(vo);
	}
	

	//포인트 적립 메소드
	@PostMapping("/reserve/pointdeposit.do")
	public void pointdeposit(ReserveVO vo, GuestVO gvo) {
		service.PointDeposit(vo, gvo);
	}
	
	//쿠폰 삭제 스케줄러(만료시)
	//@Scheduled(cron="0/10 * * * * *")
	public void CouponDelete() {
		if(service.CouponDelete()>0) {
			System.out.println("==================: 삭제컬럼업데이트");
		}
		
    }
	
	@GetMapping("/reserve/paytransfer.do")
	public String paytransfer(HotelVO vo, Model model) {
		model.addAttribute("host",service.SelectHostNo(vo));
		return "reserve/paytransfer";
	}
	
	
	
	//-----이하 빛찬-----------------------------------------------
	//-----게스트-----------------------------------------------
	@GetMapping("/reserve/index.do")
	public String index(Model model,HotelVO hvo, ReserveVO vo, HttpSession sess, HttpServletRequest req) {
		//GuestVO loginInfo1 = new GuestVO();// demo data
		//loginInfo1.setGuest_no(3);//demo data
		//loginInfo1.setGuest_name("게스트_빛찬");//demo data
		//sess.setAttribute("loginInfo", loginInfo1);//demo data
		
		GuestVO Host_loginInfo = (GuestVO) sess.getAttribute("loginInfo");
		
		vo.setGuest_no(Host_loginInfo.getGuest_no());
		
		model.addAttribute("data", service.index(vo));
		
		
		return "reserve/index";
	}
	

}
