package kr.co.hotel.main;


import java.util.List;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.AllArgsConstructor;

@Controller
@ComponentScan
@AllArgsConstructor
public class HotelController {

	HotelService service;
	
	@GetMapping("/main/main.do")
	public String Main(HotelVO vo, Model model) {
		model.addAttribute("Seoul",service.listSeoul(vo));
		model.addAttribute("Incheon",service.listIncheon(vo));
		model.addAttribute("Kyeonggi",service.listKyeonggi(vo));
		return "/main/main";
	}
	
	@PostMapping("/main/search.do")
	public String searchList(HotelVO vo, Model model) {
		model.addAttribute("list", service.searchList(vo));
		return "/main/search.do";
	}
	
}
