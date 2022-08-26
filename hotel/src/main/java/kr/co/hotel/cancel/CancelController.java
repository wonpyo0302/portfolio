package kr.co.hotel.cancel;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.reserve.ReserveVO;

@Controller

public class CancelController {
	
	@Autowired
	CancelService service;
	
	@GetMapping("cancel/cancel.do")
	public String cancel() {
		return "cancel/cancel";
	}
	
	@GetMapping("cancel/reservelist.do")
	public String cancellist(GuestVO vo, Model model) {
		model.addAttribute("list",service.list(vo));
		return "cancel/reservelist";
	}
	
	@PostMapping("cancel/cancel.do")
	@ResponseBody
	public String cancelpro(ReserveVO vo, GuestVO gvo) throws IOException {
		return service.cancel(vo, gvo);
	}
	
	
	//무통장입금 예약 취소
	@PostMapping("cancel/payaccountcancle.do")
	@ResponseBody
	public int payaccountcancle(ReserveVO vo){
		vo=service.SelectReserve(vo);
		System.out.println("==================상태업데이트"+service.UpdateReserveStatus(vo));
		if(vo.getUsed_point() !=0) {
			System.out.println("==================포인트업데이트"+service.UpdateGuestPoint(vo));
			System.out.println("==================포인트테이블 삽입"+service.InsertPointTable(vo));
		}
		if(vo.getCoupon_no() !="") {
			System.out.println("==================쿠폰상태 업데이트"+service.UpdateCouponStatus(vo));
		}	
		return 0;
	}
}
