package kr.co.hotel.room;


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
public class RoomController {

	RoomService service;
	
	@GetMapping("/main/hotelView2.do")
	public String roomView(RoomVO vo, Model model) {
		model.addAttribute("data",service.getImage(vo, model));
		return "/main/hotelView";
	}

}
