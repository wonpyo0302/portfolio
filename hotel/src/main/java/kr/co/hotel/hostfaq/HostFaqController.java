package kr.co.hotel.hostfaq;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HostFaqController {
	
	@Autowired
	HostFaqService service;

	// 조회
	@GetMapping("/hostfaq/view.do")
	public String view(Model model, HostFaqVO vo) {
		HostFaqVO r = service.view(vo.getHfaq_no());
		System.out.println("=================================="+r);
		model.addAttribute("data",service.list(vo));
		return "hostfaq/view";
	}
	
	// 등록폼(관리자용)
	@GetMapping("/hostfaq/write.do")
	public String write() {
		return "hostfaq/write";
	}
	
	// 등록처리(관리자용)
	@PostMapping("/hostfaq/write.do")
	public String insert(Model model, HostFaqVO vo) {
		model.addAttribute("data", service.insert(vo));
		return "hostfaq/write";
	}
	
	
}
