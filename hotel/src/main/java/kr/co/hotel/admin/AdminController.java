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


	
	@GetMapping("/admin/login.do")
	 public String adminLogin(HttpSession sess, Model model) {
		if(sess.getAttribute("loginInfo_admin")!=null) { 
			model.addAttribute("msg", "중복로그인입니다. 로그아웃해주세요");
			return "common/alert";
		}
		return "admin/main/login";
	}
	@PostMapping("/admin/login.do")
	public String adminLogin(AdminVO avo,HttpSession sess, Model model) {
		if(aservice.adminLogin(avo, sess)) {
			return "redirect:/admin/main/adminMain.do";
		}else {
			model.addAttribute("msg", "로그인정보를 다시 확인해주세요");
			return "common/alert";
		}
	}
	@GetMapping("/admin/logout.do")
	public String logout(Model model, HttpServletRequest req) {
		HttpSession sess = req.getSession();
		sess.invalidate(); // 세션초기화(세션객체에있는 모든 값들이 삭제)
		//sess.removeAttribute("loginInfo"); // 세션객체의 해당값만 삭제
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/hotel/admin/login.do");
		return "common/alert";
	}
	
	
//-========================추가는 아래로 해주세요========================	
	@GetMapping("/admin/main/adminMain.do")
	public String adminMain(HttpSession sess,AdminVO avo, Model model ) {
		if(sess.getAttribute("loginInfo_admin") == null) {
			model.addAttribute("msg","로그인이 필요한 기능입니다");
			return "common/alert";
		}else {
			model.addAttribute("sales", aservice.salesMonth());
			aservice.memberCount(model);
			return"/admin/main/adminMain";
		}
	}


	
}