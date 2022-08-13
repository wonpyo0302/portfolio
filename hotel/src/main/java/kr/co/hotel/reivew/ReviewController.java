package kr.co.hotel.reivew;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService service;
	
	//목록, 등록, 삭제
	@GetMapping("/comment/list.do")
	public String list(ReviewVO vo, Model model) {
		
		Map map = service.index(vo);
		model.addAttribute("comment", map);
		return "common/comment";
		
	
	}
	
	@GetMapping("/comment/insert.do")
	public String insert (ReviewVO vo, Model model) { //스프링이 커멘드 객체를 받기도 하지만 알아서 넘겨주기도한다
		int r = service.insert(vo);
		model.addAttribute("result", r);
		return "common/return";//메서드 하나로 처리
	}
	
	
	@GetMapping("/comment/delete.do")
	public String delete (ReviewVO vo, Model model) {
		model.addAttribute("result", service.delete(vo));
		return "common/return";
	}
	

}
