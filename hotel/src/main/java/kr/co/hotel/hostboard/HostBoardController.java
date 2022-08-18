package kr.co.hotel.hostboard;

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
import kr.co.hotel.host.HostVO;
import util.ImgHandling;

@Controller
public class HostBoardController extends ImgHandling{

	@Autowired
	HostBoardService service;

	// 목록
	@GetMapping("/hostboard/list.do")
	public String index(Model model, HostBoardVO vo) {
		model.addAttribute("data", service.index(vo));
		return "hostboard/list";
	}

	// 조회
	@GetMapping("/hostboard/view.do")
	public String view(Model model, HostBoardVO vo) {
		//System.out.println(vo.get);
		service.viewCount(vo.getHboard_no());
		HostBoardVO gvo = service.view(vo.getHboard_no());
		model.addAttribute("data", gvo);
		return "hostboard/view";
	}

	// 등록 폼
	@GetMapping("/hostboard/write.do")
	public String write(Model model) {
		return "hostboard/write";
	}

	// 등록처리
	@PostMapping("/hostboard/insert.do")
	public String insert(Model model, HostBoardVO vo, @RequestParam MultipartFile filename, HttpServletRequest req) {
		if(!filename.isEmpty()) {
			String org = filename.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = new Date().getTime()+ext;
			
			String path = req.getRealPath("/upload/");
			try {
				filename.transferTo(new File(path+real));
			} catch (Exception e) {}
				vo.setFilename_org(org);
				vo.setFilename_real(real);
		}
		
		HttpSession sess = req.getSession();
		HostVO hvo = (HostVO)sess.getAttribute("loginInfo");
		vo.setHost_no(hvo.getHost_no());
		
		System.out.println("========================="+vo.getHboard_type());
		System.out.println("========================="+vo.getHboard_writer());
		
		if(service.insert(vo)) {
			model.addAttribute("msg", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "view.do?hboard_no="+vo.getHboard_no());
			return "common/alert";
		} else {
			model.addAttribute("msg", "저장 실패했습니다.");
			return "common/alert";
		}
	}

	// 수정 폼
	@GetMapping("/hostboard/edit.do")
	public String editForm(Model model, HostBoardVO vo) {
		model.addAttribute("data", service.edit(vo.getHboard_no()));
		System.out.println("======================================"+model.getAttribute("data"));
		return "hostboard/edit";
	}
	
	// 수정처리
	@PostMapping("/hostboard/edit.do")
	public String update(HostBoardVO vo, Model model) {
		System.out.println("=============================vo 확인" + vo.getHboard_no());
		System.out.println("뭐라는거야 : " + vo.getHboard_type());

		if (service.update(vo)) {
			model.addAttribute("data", service.update(vo));
			model.addAttribute("msg", "정상적으로 수정되었습니다");
			model.addAttribute("url", "view.do?hboard_no=" + vo.getHboard_no());
			return "common/alert";
		} else {
			model.addAttribute("msg", "수정 실패했습니다.");
			return "common/alert";
		}
	}
	
	// 삭제처리
	@GetMapping("/hostboard/delete.do")
	public String delete(HostBoardVO vo, Model model) {
		if(service.delete(vo.getHboard_no())) {
			
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "list.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "삭제 실패했습니다.");
			return "common/alert";
		}
		
	}
	
	
	
}
