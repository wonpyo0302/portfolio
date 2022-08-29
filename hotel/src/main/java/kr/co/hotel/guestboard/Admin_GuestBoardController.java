package kr.co.hotel.guestboard;

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

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.guestnotice.GuestNoticeVO;
import util.ImgHandling;

@Controller
public class Admin_GuestBoardController extends ImgHandling {

	@Autowired
	GuestBoardService service;

	// 목록
	@GetMapping("/admin/main/guestboard/qna/list.do")
	public String index(Model model, GuestBoardVO vo) {
		model.addAttribute("data", service.index(vo));
		return "admin/main/guestboard/qna/list";
	}

	// 조회
	@GetMapping("/admin/main/guestboard/qna/view.do")
	public String view(Model model, GuestBoardVO vo) {
		// System.out.println(vo.get);
		service.viewCount(vo.getGboard_no());
		System.out.println("==========================" + vo.getGboard_no());
		GuestBoardVO gvo = service.view(vo.getGboard_no());
		model.addAttribute("data", gvo);
		System.out.println("==============================" + gvo.getGuest_name());
		return "admin/main/guestboard/qna/view";
	}

	// 답글달기 폼
	@GetMapping("/admin/main/guestboard/qna/answer.do")
	public String editForm(Model model, GuestBoardVO vo) {
		model.addAttribute("data", service.edit(vo.getGboard_no()));
		System.out.println("======================================" + model.getAttribute("data"));
		return "admin/main/guestboard/qna/answer";
	}

	// 답글달기 처리
	@PostMapping("/admin/main/guestboard/qna/answer.do")
	public String update(GuestBoardVO vo, Model model, HttpSession sess) {

		if (service.replyupdate(vo)) {
			model.addAttribute("data", service.replyupdate(vo));
			model.addAttribute("msg", "정상적으로 수정되었습니다");
			model.addAttribute("url", "list.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "수정 실패했습니다.");
			return "common/alert";
		}
	}

	// 삭제처리
	@GetMapping("/admin/main/guestboard/qna/delete.do")
	public String delete(GuestBoardVO vo, Model model) {
		if (service.delete(vo.getGboard_no())) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "list.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "삭제 실패했습니다.");
			return "common/alert";
		}

	}

}
