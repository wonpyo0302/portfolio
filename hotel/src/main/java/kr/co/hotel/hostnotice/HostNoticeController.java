package kr.co.hotel.hostnotice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.hotel.host.HostVO;

@Controller
public class HostNoticeController {

	@Autowired
	HostNoticeService service;
	
	// 목록
	@GetMapping("/hostnotice/list.do")
	public String index(Model model, HostNoticeVO vo) {
		model.addAttribute("data", service.index(vo));
		return "hostnotice/list";
	}
	
	// 조회
	@GetMapping("/hostnotice/view.do")
	public String view(Model model, HostNoticeVO vo) {
		service.updateViewcount(vo.getHnotice_no());
		model.addAttribute("data", service.view(vo));
	
		return "hostnotice/view";
	}

	
} 
