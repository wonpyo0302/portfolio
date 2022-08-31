package kr.co.hotel.point;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import kr.co.hotel.reserve.ReserveVO;
import kr.co.hotel.guest.GuestVO;

@Controller
public class PointController {
	
	@Autowired
	PointService service;
	
	//목록, 등록, 삭제
	
	@GetMapping("/point/list.do")
	public String list(PointVO vo, Model model, HttpSession sess) {
		try {
			
		GuestVO loginInfo= (GuestVO)sess.getAttribute("loginInfo");
		vo.setGuest_no(loginInfo.getGuest_no());
		int totalpoint= service.total(loginInfo.getGuest_no());				
		
		Map map = service.index(vo);
		
		model.addAttribute("totalpoint", totalpoint);
		model.addAttribute("point", map);
		
		
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("pointController에서 예외발생!");
		}
		return "point/index";
	}
	
	@GetMapping("/point/total.do")
	public String listtt(PointVO vo, Model model, HttpSession sess) {
		
		GuestVO loginInfo = (GuestVO)sess.getAttribute("loginInfo");
		int totalpoint= service.total(loginInfo.getGuest_no());
		
		return "point/index";
	}
	

	
	
	
	

}