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
	@GetMapping("/board/list.do")
	public String index(Model model, GuestFaqVO vo) {
		model.addAttribute("data", service.index(vo));
		return "board/list";
	}
	
	// 조회
	@GetMapping("/board/view.do")
	public String view(Model model, GuestFaqVO vo) {
		service.viewCount(vo.getGboard_no());
		model.addAttribute("data", service.view(vo.getGboard_no()));
		return "board/view";
	}

	// 등록
	@GetMapping("/board/write.do")
	public String write(Model model, GuestFaqVO vo) {
		return "board/write";
	}
	
	@PostMapping("/board/write.do")
	public String insert(Model model, GuestFaqVO vo) {
		model.addAttribute("data", service.insert(vo));
		return "board/write";
	}
	
}
