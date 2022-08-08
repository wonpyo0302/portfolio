package kr.co.hotel.guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class GuestController {
	@Autowired
	GuestService gservice;
	@GetMapping("/guest/join.do")
	public String join() {
		return "guest/join";
	}
	
	@PostMapping("/guest/join.do")
	public String join(GuestVO gvo, Model model) {
		if (gservice.insert(gvo) > 0) {
			model.addAttribute("msg", "정상적으로 회원가입되었습니다.");
			model.addAttribute("url", "login.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "회원가입오류");
			return "common/alert";
		}
	}
	@GetMapping("/guest/login.do")
	public String login() {
		return "guest/login";
	}
	
	@PostMapping("/guest/login.do")
	public String login(GuestVO gvo, HttpSession sess, Model model) {
		if (gservice.guestloginCheck(gvo, sess)) {
			return "redirect:/board/guest/index.do";
		} else {
			model.addAttribute("msg", "비밀번호를 확인해 주세요");
			return "common/alert";
		}
	}
	
	
	@GetMapping("/guest/emailDupCheck.do")
	public void emailDupCheck(@RequestParam String guest_email, HttpServletResponse res) throws IOException {
		int count = gservice.emailDupCheck(guest_email);
		boolean r = false;
		if (count == 1) r = true;
		PrintWriter out = res.getWriter();
		out.print(r);
		out.flush();
	}
	@GetMapping("/guest/idDupCheck.do")
	public void idDupCheck(@RequestParam String guest_id, HttpServletResponse res) throws IOException {
		int count = gservice.idDupCheck(guest_id);
		boolean r = false;
		if (count == 1) r = true;
		PrintWriter out = res.getWriter();
		out.print(r);
		out.flush();
	}
	
	@GetMapping("/guest/logout.do")
	public String logout(Model model, HttpServletRequest req) {
		HttpSession sess = req.getSession();
		sess.invalidate(); // 세션초기화(세션객체에있는 모든 값들이 삭제)
		//sess.removeAttribute("loginInfo"); // 세션객체의 해당값만 삭제
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/hotel/board/index.do");
		return "common/alert";
	}
	
	@GetMapping("/guest/findGuestEmail.do")
	public String findGuestEmail() {
		return "guest/findEmail";
	}
	
	@PostMapping("/guest/findGuestEmail.do")
	public String findGuestEmail(Model model, GuestVO param) {
		GuestVO gvo = gservice.findGuestEmail(param);
		if (gvo != null) {
			model.addAttribute("result", gvo.getGuest_email());
		}
		return "common/return";
	}
	
	@GetMapping("/guest/findGuestPwd.do")
	public String findGuestPwd() {
		return "guest/findPwd";
	}
	
	@PostMapping("/guest/findGuestPwd.do")
	public String findGuestPwd(Model model, GuestVO param) {
		GuestVO gvo = gservice.findGuestPwd(param);
		if (gvo != null) {
			model.addAttribute("result", gvo.getGuest_email());
		}
		return "common/return";
	}
	/*
	 * @GetMapping("board/guest/index.do") public String boardindex(GuestVO
	 * gvo,HttpSession sess, Model model) { return "guest/index"; }
	 */
}
