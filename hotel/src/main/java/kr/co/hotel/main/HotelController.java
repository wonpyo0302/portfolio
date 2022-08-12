package kr.co.hotel.main;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;

@Controller
@ComponentScan
@AllArgsConstructor
public class HotelController {

	HotelService service;
	
	@GetMapping("/main/main.do")
	public String Main(HotelVO vo, Model model) {
		model.addAttribute("data",service.hotelTopFive(vo, model));
		model.addAttribute("list", service.stateInfo(vo));
		return "/main/main";
	}
	
	@GetMapping("/main/search.do")
	public String searchList(HotelVO vo, Model model, @RequestParam("selectbox_state") int state_code) {
		System.out.println("##############################");
		System.out.println("성동구 : "+vo.getSelectbox_district());
		model.addAttribute("state", service.stateInfo(vo));
		model.addAttribute("hotelList",service.searchList(vo));
		vo.setState_code(state_code);
		List list = service.getDistrict(vo);
		model.addAttribute("district",list);
		return "/main/search";
	}
	
	@PostMapping("/main/district.do")
	@ResponseBody
	public List selectBox(HotelVO vo, Model model) {
		List list = service.getDistrict(vo);
		System.out.println(list);
		return list;
	}
	
	
	
}
