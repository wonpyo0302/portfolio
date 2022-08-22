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
	public String view(Model model, HostNoticeVO vo) {
		service.updateViewcount(vo.getHnotice_no());
		model.addAttribute("data", service.view(vo));

		vo.setRownum(service.nowRownum(vo).rownum);
		model.addAttribute("now", service.nowRownum(vo));
		model.addAttribute("prev", service.prevRownum(vo));
		model.addAttribute("next", service.nextRownum(vo));
		
		return "hostnotice/view";
	}

	// 등록폼(관리자용)
	@GetMapping("/hostnotice/write.do")
	public String write() {
		return "hostnotice/write";
	}

	// 등록처리(관리자용)
	@PostMapping("/hostnotice/write.do")
	public String insert(Model model, HostNoticeVO vo, @RequestParam MultipartFile filename, HttpServletRequest req) {
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
		AdminVO avo = (AdminVO) sess.getAttribute("loginInfo2");
		vo.setAdmin_no(avo.getAdmin_no());

		if (service.insert(vo)) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "view.do?hnotice_no=" + vo.getHnotice_no());
			return "common/alert";
		} else {
			model.addAttribute("msg", "저장 실패했습니다.");
			return "common/alert";
		}
	}

	// 수정폼(관리자용)
	@GetMapping("/hostnotice/edit.do")
	public String edit(Model model, HostNoticeVO vo) {
		model.addAttribute("data", service.edit(vo.admin_no));
		return "hostnotice/edit";
	}

	// 수정처리(관리자용)
	@PostMapping("/hostnotice/edit.do")
	public String update(Model model, HostNoticeVO vo) {
		if (service.update(vo)) {
			model.addAttribute("data", service.update(vo));
			model.addAttribute("msg", "정상적으로 수정되었습니다");
			model.addAttribute("url", "view.do?hnotice_no=" + vo.getHnotice_no());
			return "common/alert";
		} else {
			model.addAttribute("msg", "수정 실패했습니다.");
			return "common/alert";
		}
	}
	
	// 삭제(관리자용)
	@GetMapping("/hostnotice/delete.do")
	public String delete(Model model, HostNoticeVO vo) {
		if (service.delete(vo.getHnotice_no())) {
			model.addAttribute("data", service.delete(vo.getAdmin_no()));
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "list.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "삭제 실패했습니다.");
			return "common/alert";
		}
	}
}
