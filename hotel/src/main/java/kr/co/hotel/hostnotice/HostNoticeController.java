package kr.co.hotel.hostnotice;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hotel.admin.AdminVO;

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
	public String view(Model model, int hnotice_no, HostNoticeVO vo) {
		service.updateViewcount(hnotice_no);
		model.addAttribute("data", service.view(hnotice_no));
		vo.setRownum(service.nowRownum(vo).getRownum());
		
		model.addAttribute("now", service.nowRownum(vo));
		model.addAttribute("prev", service.prevRownum(vo));
		model.addAttribute("next", service.nextRownum(vo));
		
		return "hostnotice/view";
	}
}
