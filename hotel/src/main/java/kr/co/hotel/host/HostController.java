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
	public String login(HttpSession sess, Model model) {
		if(sess.getAttribute("loginInfo2")!=null) {
			model.addAttribute("msg", "중복로그인입니다. 로그아웃해주세요");
			return "common/alert";
		}
		return "host/login";
	}
	
	@PostMapping("/host/login.do")
	public String login(HostVO hvo, HttpSession sess, Model model) {
		if (hservice.HostloginCheck(hvo, sess)) {
			return "redirect:/host/mypage.do";
		} else {
			model.addAttribute("msg", "로그인정보를 확인해 주세요");
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
	@GetMapping("/host/hpDupCheck.do")
	public void hpDupCheck(@RequestParam String host_hp, HttpServletResponse res) throws IOException {
		int count = hservice.hpDupCheck(host_hp);
		boolean r=false;
		if(count==1)r=true;
		PrintWriter out=res.getWriter();
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
	@GetMapping("/host/mypage.do")
	public String mypage(HttpSession sess, Model model) {
		if(sess.getAttribute("loginInfo2")==null) {
			model.addAttribute("msg","로그인해야 합니다");
			return "common/aleret";
		}else {
			return "/host/myPage";
		}
	}
	@GetMapping("/host/myinfo.do")
	public String myinfo(HttpSession sess, Model model) {
		if(sess.getAttribute("loginInfo2")==null) {
			model.addAttribute("msg","로그인이 필요한 기능입니다.");
			return "common/alert";
		}else {
			return "/host/myinfoLogin";
		}
	}
	@PostMapping("/host/myinfoLogin.do")
	public void myinfoLogin(HostVO hvo, HttpServletResponse res, HttpSession sess) throws IOException {
		HostVO myinfo=(HostVO)sess.getAttribute("loginInfo2");
		myinfo.setHost_pwd(hvo.getHost_pwd());
		boolean r=false;
		if(hservice.myinfoLogin(myinfo)!=null)r=true;
		PrintWriter out = res.getWriter();
		out.print(r);
		out.flush();
	}
	@PostMapping("/host/myinfoModify.do")
	public String myinfoModify() {
		return "/host/myinfoModify";
	}
	@GetMapping("/host/pwdChangePopup")
	public String pwdChangePopup() {
		return "/host/pwdChangePopup";
	}
	@PostMapping("/host/updatePwd.do")
	public void updatePwd(HttpSession sess, HostVO hvo, HttpServletResponse res) throws IOException {
		HostVO myinfo=(HostVO)sess.getAttribute("loginInfo2");
		myinfo.setHost_pwd(hvo.getHost_pwd());
		boolean r=false;
		if(hservice.updatePwd(myinfo) > 0) {
			r=true;
			PrintWriter out = res.getWriter();
			out.print(r);
			out.flush();
		}
	}
	@PostMapping("/host/update.do")
	public String update(HostVO hvo, Model model) {
		if(hservice.totalUpdate(hvo)) {
			model.addAttribute("msg","자동 로그아웃 됩니다. 다시 로그인해주세요");
			model.addAttribute("url","/hotel/host/logout.do");
			return "common/alert";
		} else {
			model.addAttribute("msg", "수정실패");
			return "common/alert";
		}
	}
	@GetMapping("/host/deleteHostInfo.do")
	public String deleteHost(HttpSession sess,Model model) {
		if(sess.getAttribute("loginInfo2") == null) {
			model.addAttribute("msg","로그인이 필요한 기능입니다");
			return "common/alert";
		}else { 
			return"/host/deleteHost";
			//로그인이 되어 있어야 deleteHost.jsp로 넘어갈수 있음
		}
	}
	@PostMapping("/host/deleteHostInfo.do")
	public void deleteHostInfo(HttpSession sess, HostVO hvo, HttpServletResponse res) throws IOException{
		HostVO myinfo = (HostVO)sess.getAttribute("loginInfo2");
		myinfo.setHost_pwd(hvo.getHost_pwd());
		boolean r=false;
		if(hservice.deleteHostInfo(myinfo) != null)
			r=true;
			PrintWriter out = res.getWriter();
			out.print(r);
			out.flush();
	}
}
