package kr.co.hotel.cancel;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.reserve.ReserveVO;

@Controller

public class CancelController {
	
	@Autowired
	CancelService service;
	
	@GetMapping("cancel/cancel.do")
	public String cancel() {
		return "cancel/cancel";
	}
	
	@GetMapping("cancel/reservelist.do")
	public String cancellist(GuestVO vo, Model model) {
		model.addAttribute("list",service.list(vo));
		return "cancel/reservelist";
	}
	
	@PostMapping("cancel/cancel.do")
	@ResponseBody
	public String cancelpro(ReserveVO vo, GuestVO gvo) throws IOException {
		return service.cancel(vo, gvo);
	}
	
}
