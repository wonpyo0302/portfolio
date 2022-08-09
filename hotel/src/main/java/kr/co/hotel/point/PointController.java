package kr.co.hotel.point;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.hotel.HRRegister.GuestMemberVO;

@Controller
public class PointController {
	
	@Autowired
	PointService service;
	
	//목록, 등록, 삭제
	
	
	@GetMapping("/point/list.do")
	public String list(PointVO vo, Model model, HttpSession sess) {
		try {
			
		//GuestMemberVO loginInfo = (GuestMemberVO)sess.getAttribute("loginInfo"); 		//세션에서 guest_no를 불러옵니다.
		GuestMemberVO loginInfo1 = new GuestMemberVO();//demo GuestMemberVO()
		loginInfo1.setGuest_no(3); //demo guest_no 
		loginInfo1.setGuest_name("홍길동");
		sess.setAttribute("loginInfo", loginInfo1);
		
		GuestMemberVO loginInfo= (GuestMemberVO)sess.getAttribute("loginInfo");
		
		int totalpoint= service.total(loginInfo.getGuest_no());					//totalpoint를 구해 PointVO에 set합니다. PointVO는 jsp에 자동으로 전달됩니다.				
		vo.setTotalpoint(totalpoint);
		
		Map map = service.index(vo);
		model.addAttribute("point", map);
		
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("pointController에서 예외발생!");
		}
		return "point/index";
	}
	
	@GetMapping("/point/total.do")
	public String listtt(PointVO vo, Model model, HttpSession sess) {
		
		GuestMemberVO loginInfo = (GuestMemberVO)sess.getAttribute("loginInfo");
		int totalpoint= service.total(loginInfo.getGuest_no());
		
		return "point/index";
	}
	

	
	
	
	

}
