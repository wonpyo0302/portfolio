package kr.co.hotel.guestnotice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class GuestNoticeController {

	@Autowired
	GuestNoticeService service;
	
	// 목록
	@GetMapping("/notice/list.do")
	public String index(Model model, GuestNoticeVO vo) {
		model.addAttribute("data", service.index(vo));
		return "notice/list";
	}
	
	// 조회
	@GetMapping("/notice/view.do")
	public String view(Model model, GuestNoticeVO vo) {
		service.updateViewcount(vo.getGnotice_no());
		 //vo= service.view(vo);
		//System.out.println("정신차려 ??:"+ r.gnotice_title);
		model.addAttribute("data", service.view(vo));
		return "notice/view";
	}

	// 등록
	@GetMapping("/notice/write.do")
	public String write() {
		return "notice/write";
	}
	
	@PostMapping("/notice/write.do")
	public String insert(Model model, GuestNoticeVO vo) {
		model.addAttribute("data", service.insert(vo));
		return "notice/write";
	}

	
} 
