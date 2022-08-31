package kr.co.hotel.hostfaq;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.hotel.admin.AdminVO;
import kr.co.hotel.guestfaq.GuestFaqVO;

@Controller
public class Admin_HostFaqController {

	@Autowired
	HostFaqService service;

	// 조회
	@GetMapping("/admin/main/hostboard/faq/view.do")
	public String view(Model model, HostFaqVO vo) {
		HostFaqVO r = service.view(vo.getHfaq_no());
		System.out.println("==================================" + r);
		model.addAttribute("data", service.list(vo));
		return "admin/main/hostboard/faq/view";
	}

	// 등록폼(관리자용)
	@GetMapping("/admin/main/hostboard/faq/write.do")
	public String write() {
		return "admin/main/hostboard/faq/write";
	}

	// 등록처리(관리자용)
	@PostMapping("/admin/main/hostboard/faq/write.do")
	public String insert(Model model, HostFaqVO vo, HttpSession sess) {

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
	@GetMapping("/admin/main/hostboard/faq/edit.do")
	public String edit(Model model, HostFaqVO vo) {
		model.addAttribute("data", service.edit(vo.getHfaq_no()));
		return "admin/main/hostboard/faq/edit";
	}

	// 수정처리(관리자용)
	@PostMapping("/admin/main/hostboard/faq/edit.do")
	public String update(Model model, HostFaqVO vo) {
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
	@GetMapping("/admin/main/hostboard/faq/delete.do")
	public String delete(Model model, HostFaqVO vo, AdminVO avo) {
		if (service.delete(vo.getHfaq_no())) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "view.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "삭제 실패했습니다.");
			return "common/alert";
		}
	}

}
