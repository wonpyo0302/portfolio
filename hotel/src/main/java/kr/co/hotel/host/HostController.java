package kr.co.hotel.host;

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
public class HostController {
	@Autowired
	HostService hservice;
	@GetMapping("/host/join.do")
	public String join() {
		return "host/join";
	}
	
	@PostMapping("/host/join.do")
	public String join(HostVO hvo, Model model) {
		if (hservice.insert(hvo) > 0) {
			model.addAttribute("msg", "정상적으로 회원가입되었습니다.");
			return "host/login";
		} else {
			model.addAttribute("msg", "회원가입오류");
			return "common/alert";
		}
	}
	@GetMapping("/host/login.do")
	public String login() {
		return "host/login";
	}
	
	@PostMapping("/host/login.do")
	public String login(HostVO hvo, HttpSession sess, Model model) {
		if (hservice.HostloginCheck(hvo, sess)) {
			return "redirect:/board/hotel/host/index.do";
		} else {
			model.addAttribute("msg", "비밀번호를 확인해 주세요");
			return "common/alert";
		}
	}
	
	
	@GetMapping("/host/emailDupCheck.do")
	public void emailDupCheck(@RequestParam String host_email, HttpServletResponse res) throws IOException {
		int count = hservice.emailDupCheck(host_email);
		boolean r = false;
		if (count == 1) r = true;
		PrintWriter out = res.getWriter();
		out.print(r);
		out.flush();
	}
	@GetMapping("/host/idDupCheck.do")
	public void idDupCheck(@RequestParam String host_id, HttpServletResponse res) throws IOException {
		int count = hservice.idDupCheck(host_id);
		boolean r = false;
		if (count == 1) r = true;
		PrintWriter out = res.getWriter();
		out.print(r);
		out.flush();
	}
	
	@GetMapping("/host/logout.do")
	public String logout(Model model, HttpServletRequest req) {
		HttpSession sess = req.getSession();
		sess.invalidate(); // 세션초기화(세션객체에있는 모든 값들이 삭제)
		//sess.removeAttribute("loginInfo"); // 세션객체의 해당값만 삭제
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/hotel/host/login.do");
		return "common/alert";
	}
	
	@GetMapping("/host/findHostEmail.do")
	public String findHostEmail() {
		return "host/findEmail";
	}
	
	@PostMapping("/host/findHostEmail.do")
	public String findHostEmail(Model model, HostVO param) {
		HostVO hvo = hservice.findHostEmail(param);
		if (hvo != null) {
			model.addAttribute("result", hvo.getHost_email());
		}
		return "common/return";
	}
	
	@GetMapping("/host/findHostPwd.do")
	public String findHostPwd() {
		return "host/findPwd";
	}
	
	@PostMapping("/host/findHostPwd.do")
	public String findHostPwd(Model model, HostVO param) {
		HostVO hvo = hservice.findHostPwd(param);
		if (hvo != null) {
			model.addAttribute("result", hvo.getHost_email());
		}
		return "common/return";
	}
	/*
	 * @GetMapping("hotel/host/index.do") public String boardindex(HostMemberVO
	 * hvo,HttpSession sess, Model model) { return "host/index"; }
	 */
}
