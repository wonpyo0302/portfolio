package kr.co.hotel.reserve;


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
import kr.co.hotel.room.RoomVO;

@Controller

public class ReserveController {
	
	@Autowired
	ReserveService service;
	
	//예약컨트롤러
	@GetMapping("/reserve/reserve.do")
	public String reserve() {
		return "/reserve/reserve";
	}
	
	//테스트
	@GetMapping("/reserve/reserve2.do")
	public String reserve2() {
		return "/reserve/reserve2";
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
	public void reserveinsert(ReserveVO vo,GuestVO gvo, Model model) {
		service.insert(vo, gvo);
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
