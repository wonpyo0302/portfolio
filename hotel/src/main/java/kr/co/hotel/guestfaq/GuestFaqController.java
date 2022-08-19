package kr.co.hotel.guestfaq;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class GuestFaqController {

	@Autowired
	GuestFaqService service;

	// 조회
	@GetMapping("/guestfaq/view.do")
	public String view(Model model, GuestFaqVO vo) {
		GuestFaqVO r = service.view(vo.getGfaq_no());
		System.out.println("==================================" + r);
		model.addAttribute("data", service.list(vo));
		return "guestfaq/view";
	}

	// 등록폼(관리자용)
	@GetMapping("/guestfaq/write.do")
	public String write() {
		return "guestfaq/write";
	}

	// 등록처리(관리자용)
	@PostMapping("/guestfaq/write.do")
	public String insert(Model model, GuestFaqVO vo) {
		model.addAttribute("data", service.insert(vo));
		return "guestfaq/write";
	}

	// 수정폼(관리자용)
	@GetMapping("/guestfaq/edit.do")
	public String edit() {
		return "guestfaq/edit";
	}

	// 수정처리(관리자용)
	@PostMapping("/guestfaq/edit.do")
	public String update(Model model, GuestFaqVO vo) {
		if (service.update(vo)) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?gfaq_no=" + vo.getGfaq_no());
			return "common/alert";
		} else {
			model.addAttribute("msg", "수정 실패했습니다.");
			return "common/alert";
		}
	}
	
	// 삭제(관리자용)
	@GetMapping("guestfaq/delete.do")
	public String delete(Model model, GuestFaqVO vo) {
		if (service.delete(vo.getGfaq_no())) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "list.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "삭제 실패했습니다.");
			return "common/alert";
		}
	}
}
