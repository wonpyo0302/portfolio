package kr.co.hotel.guestnotice;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class GuestNoticeController {

	@Autowired
	GuestNoticeService service;

	
	// 목록
	@GetMapping("/guestnotice/list.do")
	
	public String index(Model model, GuestNoticeVO vo) {
		model.addAttribute("data", service.index(vo));
		return "guestnotice/list";
		
	}
	
	// 조회
	@GetMapping("/guestnotice/view.do")
	public String view(Model model, GuestNoticeVO vo) {
		service.updateViewcount(vo.getGnotice_no());
		model.addAttribute("data", service.view(vo));
	
		return "guestnotice/view";
	}
	
	// 등록폼(관리자용)
	@GetMapping("/guestnotice/write.do")
	public String write() {
		return "guestnotice/write";
	}
	
	// 등록처리(관리자용)
	@PostMapping("/guestnotice/write.do")
	public String insert(Model model, GuestNoticeVO vo) {
		return null;
	}
	
	
	
} 
