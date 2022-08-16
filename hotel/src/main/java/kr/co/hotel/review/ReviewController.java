package kr.co.hotel.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.hotel.reserve.ReserveVO;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService service;
	/*
	//목록, 등록, 삭제
	@GetMapping("/comment/list.do")
	public String list(ReviewVO vo, Model model) {
		
		Map map = service.index(vo);
		model.addAttribute("comment", map);
		return "common/comment";
		
	
	}
	*/
	
	
	//마이페이지.예약내역 > 리뷰작성하기
	@GetMapping("/review/write.do")
	public String write (ReviewVO vo, Model model, ReserveVO rev) {
		System.out.println("예약번호확인 : "+vo.getReserv_no());
		System.out.println("호텔번호확인"+vo.getHotel_no());
		rev= service.get_reserve(vo);
		System.out.println("호텔이름확인 : "+rev.getHotel_name());
		model.addAttribute("rev", rev);
		
		return "review/write";
	}
}
