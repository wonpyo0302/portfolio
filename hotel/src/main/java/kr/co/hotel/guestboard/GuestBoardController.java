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
import util.ImgHandling;

@Controller
public class GuestBoardController extends ImgHandling {

	@Autowired
	GuestBoardService service;

	// 목록
	@GetMapping("/guestboard/list.do")
	public String index(Model model, GuestBoardVO vo) {
		model.addAttribute("data", service.index(vo));
		return "guestboard/list";
	}

	// 조회
	@GetMapping("/guestboard/view.do")
	public String view(Model model, GuestBoardVO vo, @RequestParam String name2) {

		// 작성자만 게시글 확인 가능, 조회수 증가 가능
		model.addAttribute("data", service.view(vo.getGboard_no()));
		String name = service.view(vo.getGboard_no()).getGuest_name();
		if (!name.equals(name2)) {
			model.addAttribute("msg", "작성자만 확인 가능");
			model.addAttribute("url", "list.do");
		} else {
			service.viewCount(vo.getGboard_no());
			return "guestboard/view";
		}
		return "common/alert";
	}

	// 등록 폼
	@GetMapping("/guestboard/write.do")
	public String write(Model model) {
		return "guestboard/write";
	}

	// 등록처리
	@PostMapping("/guestboard/write.do")
	public String insert(Model model, GuestBoardVO vo, @RequestParam MultipartFile filename, HttpServletRequest req) {
		// 첨부파일 처리
		if (!filename.isEmpty()) {
			String org = filename.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = new Date().getTime() + ext;

			// 첨부파일 저장처리
			String path = req.getRealPath("/upload/");
			try {
				filename.transferTo(new File(path + real));
			} catch (Exception e) {
			}
			vo.setFilename_org(org);
			vo.setFilename_real(real);
		}

		HttpSession sess = req.getSession();
		GuestVO gvo = (GuestVO) sess.getAttribute("loginInfo");
		vo.setGuest_no(gvo.getGuest_no());

		if (service.insert(vo)) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "list.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "저장 실패했습니다.");
			return "common/alert";
		}
	}

	// 수정 폼
	@GetMapping("/guestboard/edit.do")
	public String editForm(Model model, GuestBoardVO vo) {
		model.addAttribute("data", service.edit(vo.getGboard_no()));
		// System.out.println("======================================" +
		// model.getAttribute("data"));
		return "guestboard/edit";
	}

	// 수정처리
	@PostMapping("/guestboard/edit.do")
	public String update(GuestBoardVO vo, Model model, @RequestParam MultipartFile filename, HttpServletRequest req) {

		
		// 첨부파일 처리
		if (!filename.isEmpty()) {
			String org = filename.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = new Date().getTime() + ext;

			// 첨부파일 저장처리
			String path = req.getRealPath("/upload/");
			try {
				filename.transferTo(new File(path + real));
			} catch (Exception e) {
			}
			vo.setFilename_org(org);
			vo.setFilename_real(real);
		}

		if (service.update(vo)) {
			model.addAttribute("data", service.update(vo));
			model.addAttribute("msg", "정상적으로 수정되었습니다");
			model.addAttribute("url", "list.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "수정 실패했습니다.");
			return "common/alert";
		}
	}

	// 삭제처리
	@GetMapping("/guestboard/delete.do")
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

//---------------이하 빛찬-------------------------------------------------------
	// 목록
	@GetMapping("/mypage/guestboard/list.do")
	public String index_mypage(Model model, GuestBoardVO vo, HttpSession sess) {
		GuestVO guest_info = (GuestVO) sess.getAttribute("loginInfo");
		vo.setGuest_no(guest_info.getGuest_no());

		model.addAttribute("data", service.index_in_mypage(vo));
		return "guestboard/list_in_mypage";
	}

}
