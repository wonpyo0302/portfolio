package kr.co.hotel.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.hotel.guest.GuestService;

@Controller
public class AdminController {
	@Autowired
	AdminService aservice;

//-========================추가는 아래로 해주세요========================	
	@GetMapping("/admin/main/adminMain.do")
	public String adminMain(AdminVO avo, Model model ) {
		model.addAttribute("sales", aservice.salesMonth());
		aservice.memberCount(model);
		return "/admin/main/adminMain";
	}

//===========================이원표 부분 끝============================
	
	
}