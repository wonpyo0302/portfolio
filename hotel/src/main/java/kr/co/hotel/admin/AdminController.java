package kr.co.hotel.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
	@Autowired
	AdminService aservice;
	
	@GetMapping("/admin/login.do")
	 public String adminLogin() {
		return "/admin/main/login";
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
	
	@GetMapping("/admin/main/guestlist.do")
	public String guestlist(AdminVO avo,HttpSession sess, Model model) {
		System.out.println("=====================" + avo.getSword());
		model.addAttribute("guestlist", aservice.guestListPaging(avo));
		return "/admin/main/guestlist";
	}

	@GetMapping("/admin/main/couponcreate.do")
	public String couponcreate(AdminVO avo,HttpSession sess, Model model) {
		return "/admin/main/couponcreate";
	}
	
	@GetMapping("/admin/main/idList.do")
	public String idList(AdminVO avo, Model model ) {
		Map map = new HashMap();
		map.put("idsearch", avo.getSword());
		model.addAttribute("data",aservice.guestList(avo));
		return "/admin/main/idList";
	}
	
//-========================추가는 아래로 해주세요========================	
	@GetMapping("/admin/main/adminMain.do")
	public String adminMain(AdminVO avo, Model model ) {
		model.addAttribute("sales", aservice.salesMonth());
		aservice.memberCount(model);
		return "/admin/main/adminMain";
	}
	
	
	
}