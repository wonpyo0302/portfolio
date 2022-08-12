package kr.co.hotel.guestboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.guestfaq.GuestFaqVO;

@Controller
public class GuestBoardController {
	
	@Autowired
	GuestBoardService service;
	
	// 목록
	@GetMapping("/board/list.do")
	public String index(Model model, GuestBoardVO vo) {
		model.addAttribute("data", service.index(vo));
		return "board/list";
	}
	
	// 조회
	@GetMapping("/board/view.do")
	public String view(Model model, GuestBoardVO vo) {
		service.viewCount(vo.getGboard_no());
		model.addAttribute("data", service.view(vo.getGboard_no()));
		return "board/view";
	}

	// 등록폼
	@GetMapping("/board/write.do")
	public String write(Model model, GuestBoardVO vo) {
		return "board/write";
	}
	// 등록처리
	@PostMapping("/board/write.do")
	public String insert(Model model, GuestBoardVO vo) {
		model.addAttribute("data", service.insert(vo));
		return "board/write";
	}
	
}
