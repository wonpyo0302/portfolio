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

import kr.co.hotel.host.HostVO;
import kr.co.hotel.main.HotelVO;
import kr.co.hotel.reserve.ReserveVO;

@Controller

public class HostReserveController {
	
	@Autowired
	HostReserveService service;


	@GetMapping("/hostReserve/index.do")
	public String index(Model model,HotelVO hvo, ReserveVO vo, HttpSession sess, HttpServletRequest req) {
		HostVO loginInfo1 = new HostVO();// demo data
		loginInfo1.setHost_no(1);//demo data
		loginInfo1.setHost_name("호스트_빛찬");//demo data
		sess.setAttribute("loginInfo2", loginInfo1);
		HostVO Host_loginInfo = (HostVO) sess.getAttribute("loginInfo2");
	System.out.println("호스트번호확인 : " +Host_loginInfo.getHost_no());
		HotelVO hotelInfo = service.get_hotelInfo(Host_loginInfo.getHost_no());//세션에 hotel_no가 없어서 host_no로 hotel_no를 구해옴
		vo.setHotel_no(hotelInfo.getHotel_no());//호텔정보의 hotel_no로 vo에 setHotel_no를 해줌
		
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
	

	
	
}
