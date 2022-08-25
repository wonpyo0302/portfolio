package kr.co.hotel.reserve;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
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
		System.out.println("===================================="+vo.getPay_type());
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
	@Scheduled(cron="0 0 23 * * *")
	public void Coupon_PayDelete() {
		service.CouponDelete();
		/*
		 * 1. 리스트를 가져와서 반복문으로 해당하는 것들을 돌려야함.(ok)
		 * 2. 리스트에서 가져온 vo.get~~으로 메서드 실행
		 * 3. 실행 메서드는 게스트에 포인트 돌려주기
		 * 4. 포인트 테이블에 적립하기
		 * 5. 쿠폰 상태 바꾸기
		 */
		List<ReserveVO> list = service.CancleList();
		for(int i=0; i<list.size();i++) {
			ReserveVO vo = list.get(i);
			System.out.println("==================목록"+list.get(i).getReserv_no());
			System.out.println("==================상태업데이트"+service.UpdateReserveStatus(vo));
			if(vo.getUsed_point() !=0) {
				System.out.println("==================포인트업데이트"+service.UpdateGuestPoint(vo));
				System.out.println("==================포인트테이블 삽입"+service.InsertPointTable(vo));
			}
			if(vo.getCoupon_no() !="") {
				System.out.println("==================쿠폰상태 업데이트"+service.UpdateCouponStatus(vo));
			}	
		}
	
    }
	
	//무통장입금 확인페이지
	@GetMapping("/reserve/paytransfer.do")
	public void paytransfer(ReserveVO vo, HotelVO hvo, Model model) {
		model.addAttribute("reserveinfo", service.SelectReserveInfo(vo));
		model.addAttribute("hostinfo", service.SelectHostNo(hvo));
	}
	
	
	//무통장입금 처리페이지
	@PostMapping("/reserve/paytransfer.do")
	@ResponseBody
	public String paytransferpro(ReserveVO vo, HotelVO hvo, GuestVO gvo, Model model) {
		service.insert(vo, gvo);
		return vo.getImp_uid();
	}
	
	//결제확인
	@PostMapping("/reserve/paycheck.do")
	public String paycheck(ReserveVO vo, Model model) {
		service.UpdatePay_Status(vo);
		return "/hostReserve/index";
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
