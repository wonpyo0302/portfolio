package kr.co.hotel.reserve;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
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
	
	@GetMapping("/reserve/login.do")
	public void reservepro(HttpSession session) {
		GuestVO vo = new GuestVO();
		vo.setGuest_name("test@test.com");
		vo.setGuest_pwd("1");
		session.setAttribute("logininfo", service.select(vo));
	}
	
	@PostMapping("/reserve/revinsert.do")
	@ResponseBody
	public void reserveinsert(ReserveVO vo,GuestVO gvo, Model model) {
		service.insert(vo, gvo);
	}
	
	@PostMapping("/reserve/reservecheck.do")
	@ResponseBody
	public int reservecheck(ReserveVO vo) {
		System.out.println("=================="+vo.getRoom_no());
		System.out.println("=================="+vo.getHotel_no());
		System.out.println("=================="+vo.getStartdate());
		System.out.println("=================="+vo.getEnddate());
		return service.reservecheck(vo);
	}
	
}
