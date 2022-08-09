package kr.co.hotel.guestnotice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.hotel.guest.GuestVO;

@Controller
public class AdminNoticeController {

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
		model.addAttribute("data", service.view(vo));
		System.out.println("확인"+vo.getGnotice_content());
		return "notice/view";
	}

	// 등록
	@GetMapping("/notice/write.do")
	public String write() {
		return "notice/write";
	}
	
	@PostMapping("/notice/write.do")
	public String insert(Model model, GuestNoticeVO vo, HttpServletRequest req, AdminVO avo) {
		
		HttpSession sess = req.getSession();
		AdminVO avo2 = (AdminVO)sess.getAttribute("loginInfo");
		sess.setAttribute("adminloginInfo", 1);
		vo.setAdmin_no(avo2.getAdmin_no());
		if (service.insert(vo)) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "list.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "등록 실패했습니다.");
			return "common/alert";
		}
		model.addAttribute("data", service.insert(vo));
		return "notice/write";
	}
	
	// 수정 폼
	@GetMapping("/notice/edit.do")
	public String edit(Model model, GuestNoticeVO vo) {
		model.addAttribute("data", service.view(vo));
		return "notice/edit";
	}
	
	// 수정 처리
	@PostMapping("/notice/update.do")
	public String update(Model model, GuestNoticeVO vo) {
		if (service.update(vo)) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?gnotice_no="+vo.getGnotice_no());
			return "common/alert";
		} else {
			model.addAttribute("msg", "수정 실패했습니다. 다시 확인바랍니다.");
			return "common/alert";
		}
	}
	
	@GetMapping("/notice/delete.do")
	public String delete(Model model, GuestNoticeVO vo) {
		if (service.delete(vo.getGnotice_no())) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "list.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "삭제 실패했습니다.");
			return "common/alert";
		}
	}

	
} 
