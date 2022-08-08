package kr.co.hotel.board;


import java.util.List;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;

@Controller
@ComponentScan
@AllArgsConstructor
public class HotelController {

	HotelService service;
	
	@GetMapping("/board/main.do")
	public String Main(HotelVO vo, Model model) {
		model.addAttribute("Seoul",service.listSeoul(vo));
		model.addAttribute("Incheon",service.listIncheon(vo));
		model.addAttribute("Kyeonggi",service.listKyeonggi(vo));
		return "/board/main";
	}
	
}
