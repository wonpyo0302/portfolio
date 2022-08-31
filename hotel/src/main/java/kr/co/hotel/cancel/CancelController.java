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
	
	
	//카드 예약 취소
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
		service.UpdateReserveStatus(vo);
		if(vo.getUsed_point() !=0) {
			service.UpdateGuestPoint(vo);
			service.InsertPointTable(vo);
		}
		if(vo.getCoupon_no() !="") {
			service.UpdateCouponStatus(vo);
		}	
		return 0;
	}
}
