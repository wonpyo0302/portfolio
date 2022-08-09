package kr.co.hotel.reserve;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hotel.guest.GuestVO;

@Controller

public class ReserveController {
	
	@Autowired
	ReserveService service;

	@GetMapping("/reserve/reserve.do")
	public String reserve() {
		return "/reserve/reserve";
	}
	
	
	@PostMapping("/reserve/reserveinsert.do")
	@ResponseBody
	public void reserveinsert(ReserveVO vo,GuestVO gvo, Model model) {
		service.insert(vo, gvo);
	}
	
	@PostMapping("/reserve/reservecheck.do")
	@ResponseBody
	public int reservecheck(ReserveVO vo) {
		return service.reservecheck(vo);
	}
	
}
