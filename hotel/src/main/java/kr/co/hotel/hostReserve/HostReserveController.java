package kr.co.hotel.hostReserve;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.host.HostVO;
import kr.co.hotel.main.HotelVO;
import kr.co.hotel.reserve.ReserveVO;

@Controller

public class HostReserveController {
	
	@Autowired
	HostReserveService service;

	@GetMapping("/hostReserve/test.do")
	public void test() {
		
	}
	
	@GetMapping("/hostReserve/index.do")
	public String index(Model model, ReserveVO vo, @RequestParam int host_no) {
		vo.setHotel_no(service.get_hotelInfo(host_no).getHotel_no());
		System.out.println("============================="+vo.getHotel_no());
		model.addAttribute("data", service.index(vo));
		return "hostReserve/index";
	}
	
	@PostMapping("/hostReserve/rejectRev")
	public @ResponseBody boolean rejectRev(ReserveVO vo) {
		System.out.println("예약번호확인 : "+vo.getReserv_no());
		boolean r = false;
		r =service.rejectRev(vo.getReserv_no());
		return r;
	}
	
	//=================이하 형욱==================
	@PostMapping("/hostReserve/checkin")
	@ResponseBody
	public int checkin(ReserveVO vo, GuestVO gvo) {
		return service.PointDeposit(vo, gvo);
	}
	
	@PostMapping("/hostReserve/checkout")
	@ResponseBody
	public int checkout(ReserveVO vo) {
		return service.checkout(vo);
	}
	
}
