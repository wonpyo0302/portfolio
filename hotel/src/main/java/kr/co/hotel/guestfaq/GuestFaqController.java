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
	
	// 목록
	@GetMapping("/faq/list.do")
	public String index(Model model, GuestFaqVO vo) {
		model.addAttribute("data", service.index(vo));
		return "faq/list";
	}
	
	// 조회
	@GetMapping("/faq/view.do")
	public String view(Model model, GuestFaqVO vo) {
		GuestFaqVO r = service.view(vo.getGfaq_no());
		System.out.println("=================================="+r);
		model.addAttribute("data",service.view(vo.getGfaq_no()));
		return "faq/view";
	}
	
	// 등록폼
	@GetMapping("/faq/write.do")
	public String write() {
		return "faq/write";
	}
	
	// 등록처리
	@PostMapping("/faq/write.do")
	public String insert(Model model, GuestFaqVO vo) {
		model.addAttribute("data", service.insert(vo));
		return "faq/write";
	}

	
}
