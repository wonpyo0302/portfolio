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
	public String view(Model model, int gnotice_no, GuestNoticeVO vo) {
		service.updateViewcount(gnotice_no);
		model.addAttribute("data", service.view(gnotice_no));
		vo.setRownum(service.nowRownum(vo).getRownum());
		System.out.println("========================"+vo.getRownum());
		model.addAttribute("now", service.nowRownum(vo)); // 현재글 rownum
		model.addAttribute("prev", service.prevRownum(vo)); // 이전글 rownum
		model.addAttribute("next", service.nextRownum(vo)); // 다음글 rownum
		return "guestnotice/view";
	}
	
	
	

	
	
} 
