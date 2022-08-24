package kr.co.hotel.guestfaq;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.hotel.admin.AdminVO;
import kr.co.hotel.guestboard.GuestBoardVO;

@Controller
public class Admin_GuestFaqController {

	@Autowired
	GuestFaqService service;

	// 조회
	@GetMapping("/admin/main/guestboard/faq/view.do")
	public String view(Model model, GuestFaqVO vo, AdminVO avo) {
		GuestFaqVO r = service.view(vo.getGfaq_no());
		System.out.println("==================================" + r);
		model.addAttribute("data", service.list(vo));
		return "admin/main/guestboard/faq/view";
	}

	// 등록폼(관리자용)
	@GetMapping("/admin/main/guestboard/faq/write.do")
	public String write() {
		return "admin/main/guestboard/faq/write";
	}

	// 등록처리(관리자용)
	@PostMapping("/admin/main/guestboard/faq/write.do")
	public String insert(Model model, GuestFaqVO vo, AdminVO avo,  HttpSession sess) {
		
		
		//admin 로그인 테스트
		GuestFaqVO AdminLoginInfo = new GuestFaqVO();
		AdminLoginInfo.setAdmin_no(2); // demo
		AdminLoginInfo.setAdmin_id("admin_찌수"); //demo
		sess.setAttribute("loginInfo_admin", AdminLoginInfo);
		
		if (service.insert(vo)) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "view.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "등록 실패했습니다.");
			return "common/alert";
		}
	
	}

	// 수정폼(관리자용)
	@GetMapping("/admin/main/guestboard/faq/edit.do")
	public String edit(Model model, GuestFaqVO vo) {
		model.addAttribute("data", service.edit(vo.getGfaq_no()));
		return "admin/main/guestboard/faq/edit";
	}

	// 수정처리(관리자용)
	@PostMapping("/admin/main/guestboard/faq/edit.do")
	public String update(Model model, GuestFaqVO vo) {
		if (service.update(vo)) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "수정 실패했습니다.");
			return "common/alert";
		}
	}
	
	// 삭제(관리자용)
	@GetMapping("/admin/main/guestboard/faq/delete.do")
	public String delete(Model model, GuestFaqVO vo, AdminVO avo) {
		if (service.delete(vo.getGfaq_no())) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "view.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "삭제 실패했습니다.");
			return "common/alert";
		}
	}
}
