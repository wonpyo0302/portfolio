package kr.co.hotel.reserve;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hotel.HRRegister.RoomVO;
import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.host.HostVO;
import kr.co.hotel.main.HotelVO;

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
	
	
	//-----이하 빛찬-----------------------------------------------
	
	@GetMapping("/reserve/index.do")
	public String index(Model model,HotelVO hvo, ReserveVO vo, HttpSession sess, HttpServletRequest req) {
		GuestVO loginInfo1 = new GuestVO();// demo data
		loginInfo1.setGuest_no(3);//demo data
		loginInfo1.setGuest_name("게스트_빛찬");//demo data
		sess.setAttribute("loginInfo", loginInfo1);
		GuestVO Host_loginInfo = (GuestVO) sess.getAttribute("loginInfo");
		
		vo.setGuest_no(Host_loginInfo.getGuest_no());
		
		model.addAttribute("data", service.index(vo));
		
		
		return "reserve/index";
	}
}
