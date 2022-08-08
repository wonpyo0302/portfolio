package kr.co.hotel.guest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GuestController {
	
	@Autowired
	GuestService service;
	
	// 목록
	@RequestMapping("/logincheck.do")
	public String login(HttpSession sess) {
		GuestVO vo =new GuestVO();
		vo.setGuest_email("test@test.com");
		vo.setGuest_pwd("1");
		sess.setAttribute("data", service.loginCheck(vo));
		if (sess.getAttribute("data") != null) {
			return "redirect:/board/list.do";
		} else {
		
		alert("로그인실패!");
		return "board/result";
		}
	}

	private String alert(String string) {
		return "로그인 실패";
		
	}
	
	
}
