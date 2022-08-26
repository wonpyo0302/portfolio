package kr.co.hotel.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hotel.HRRegister.HRRegisterService;
import kr.co.hotel.HRRegister.ImageVO;
import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.host.HostVO;
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
		ImgHandling ih = new ImgHandling();
		boolean r= false;
		if(service.insert(vo)) {
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
		System.out.println("오류위치"+r);
		
		if(service.avgScroe(vo.getRoom_no(), vo.getHotel_no())) {
			r=true;
		}else {
			r=false;
		}
		System.out.println("avgScore"+r);
		if(service.reviewTotalCount(vo.getRoom_no(),vo.getHotel_no())) {
			r=true;
		}else {
			r=false;
		}
		System.out.println("reviewTotalCount"+r);
		
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
	
	@GetMapping("/review/index.do")
	public String index(ReviewVO vo, Model model, HttpServletRequest req) {
		return"review/reviewList";
	}
	
	//빛찬, 리뷰리스트
	@GetMapping("/review/list.do")
	public String list(ReviewVO vo, Model model, HttpServletRequest req) {
		HttpSession sess = req.getSession();
		GuestVO guestInfo = (GuestVO)sess.getAttribute("loginInfo");
		System.out.println("세션guest_no확인 : "+ guestInfo.getGuest_no());
		vo.setGuest_no(guestInfo.getGuest_no());
		
		Map map = service.index(vo);
		model.addAttribute("rv", map);
		return "common/review";
	}
	
	@PostMapping("/review/del.do")
	public String delete(ReviewVO vo, Model model) {
		boolean r= service.delete(vo.getReview_no());
		return "common/return";
	}
	
	
	@PostMapping("/review/update.do")
	public String update(ReviewVO vo, Model model) {
		System.out.println("업데이트합니다");
		System.out.println("리뷰확인"+vo.getReview_no());
		System.out.println("호텔확인"+vo.getHotel_no());
		System.out.println("객실확인"+vo.getRoom_no());
		System.out.println(vo.getReview_title());
		System.out.println(vo.getReview_content());
		System.out.println("리뷰확인"+vo.getReview_score());
		boolean r = service.review_update(vo);//review 테이블 평점 입력

		//hotel, room 평점 업데이트
		if(service.avgScroe(vo.getRoom_no(), vo.getHotel_no())) {
			r=true;
		}else {
			r=false;
		}
		if(service.reviewTotalCount(vo.getRoom_no(),vo.getHotel_no())) {
			r=true;
		}else {
			r=false;
		}
		
		if(r) {
			
			model.addAttribute("msg","성공적으로 수정하였습니다.");
			model.addAttribute("url","../review/index.do");
		}else {
			model.addAttribute("msg","삭제 실패하였습니다.");
			model.addAttribute("url","../review/index.do");
		}
		
		
		return"common/alert";
	}
	
	//호스트 호텔 리뷰 리스트
	
	@GetMapping("/host_review/index.do")
	public String host_index(ReviewVO vo, Model model, HttpServletRequest req) {
		return"review/hostReviewList";
	}
	
	//빛찬, 리뷰리스트
	@GetMapping("/host_review/list.do")
	public String host_list(ReviewVO vo, Model model, HttpServletRequest req) {
				
		Map map = service.host_index(vo);
		model.addAttribute("rv", map);
		return "common/hostReview";
	}
	
	
	
	
	
	
	
	
	
}
