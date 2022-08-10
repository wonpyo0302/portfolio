package kr.co.hotel.guestfaq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		model.addAttribute(vo.getGfaq_no());
		model.addAttribute("data", service.view(vo));
		return "faq/view";
	}


	
}