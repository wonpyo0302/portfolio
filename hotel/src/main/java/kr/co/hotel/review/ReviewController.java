package kr.co.hotel.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hotel.HRRegister.HRRegisterService;
import kr.co.hotel.HRRegister.ImageVO;
import kr.co.hotel.reserve.ReserveVO;
import util.ImgHandling;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService service;
	@Autowired
	HRRegisterService HRservice;
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
	
	
	
	@PostMapping("/review/insert.do")
	public String insert(ReviewVO vo, ImageVO ivo, Model model, @RequestParam MultipartFile filename, HttpServletRequest req) {
		System.out.println("reviewcontent확인 : "+vo.getReview_content());
		System.out.println("reviewscore확인 : "+vo.getReview_score());
		System.out.println("reserv_no확인 : "+vo.getReserv_no());
		ImgHandling ih = new ImgHandling();
		
		boolean r= false;
		if(service.insert(vo)) {
			System.out.println("review_no확인 : "+ vo.getReview_no());
			System.out.println("filename확인 : "+filename.getSize());
			if(filename.getSize()!=0) {
				ivo.setNo(vo.getReview_no());
				ivo.setImage_type("REVIEW");
				Map map = ih.imghandle(filename, req);
			
				ivo.setFilename_org((String)map.get("filename_org"));
				ivo.setFilename_real((String)map.get("filename_real"));
				if(HRservice.img_insert(ivo)) {
					r=true;
				}
			}
			r=true;
		}
		
		// 리뷰, 예약테이블의 review_status업데이트 여부, 이미지 등록 여부가 모두 완료되면 
		if(r) {
			model.addAttribute("msg", "리뷰가 정상등록되었습니다.");
			model.addAttribute("url", "../reserve/index.do");
			return "common/alert";
		}else {
			model.addAttribute("msg", "리뷰 등록 실패");
			return "common/alert";
		}
		
		
	}
}
