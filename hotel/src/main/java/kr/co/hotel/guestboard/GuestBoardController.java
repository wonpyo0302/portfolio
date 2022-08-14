package kr.co.hotel.guestboard;

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
import util.ImgHandling;

@Controller
public class GuestBoardController extends ImgHandling{

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

		System.out.println("보드브이오 : " + vo.getGboard_no());

		service.viewCount(vo.getGboard_no());
		GuestBoardVO gvo = service.view(vo.getGboard_no());
		model.addAttribute("data", gvo);
		return "board/view";
	}

	// 등록 폼
	@GetMapping("/board/write.do")
	public String write(Model model, GuestBoardVO vo) {
		return "board/write";
	}

	// 등록처리
	@PostMapping("/board/write.do")
	public String insert(Model model, GuestBoardVO vo, @RequestParam MultipartFile filename, HttpServletRequest req) {

		HttpSession sess = req.getSession();
		GuestVO gvo = (GuestVO)sess.getAttribute("loginInfo");
		vo.setGuest_no(gvo.getGuest_no());
		
		if(service.insert(vo)) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "list.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "저장 실패했습니다.");
			return "common/alert";
		}
	}

	// 수정 폼
	@GetMapping("/board/edit.do")
	public String editForm(Model model, GuestBoardVO vo) {
		model.addAttribute("data", service.edit(vo.getGboard_no()));
		return "board/edit";
	}
	
	// 수정처리
	@PostMapping("/board/update.do")
	public String update(GuestBoardVO vo, Model model) {
		System.out.println("=============================" + vo.getGuest_no());
		System.out.println("뭐라는거야 : " + vo.getGboard_type());

		if (service.update(vo)) {
			model.addAttribute("data", service.update(vo));
			model.addAttribute("msg", "정상적으로 수정되었습니다");
			model.addAttribute("url", "view.do?gboard_no=" + vo.getGboard_no());
			return "common/alert";
		} else {
			model.addAttribute("msg", "수정 실패했습니다.");
			return "common/alert";
		}
	}

}
