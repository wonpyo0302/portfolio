package kr.co.hotel.favorite;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.hotel.guest.GuestVO;

@Controller
public class FavoriteController {
	
	@Autowired
	FavoriteService service;
	

	@GetMapping("/fav/index.do")
	public String index(FavoriteVO vo, Model model, HttpServletRequest req) {
		return"favorite/myFavList";
	}
	
	
	@GetMapping("/fav/list.do")
	public String list(FavoriteVO vo, Model model, HttpServletRequest req) {
		HttpSession sess = req.getSession();
		GuestVO guestInfo = (GuestVO)sess.getAttribute("loginInfo");
		System.out.println("세션guest_no확인 : "+ guestInfo.getGuest_no());
		vo.setGuest_no(guestInfo.getGuest_no());
		
		Map map = service.index(vo);
		model.addAttribute("fav", map);
		return "common/fav";
	}
	
	
	@GetMapping("/fav/fav")
	public String insert (FavoriteVO vo, Model model) {
		int r = service.insert(vo);
		model.addAttribute("result", r);
		
		
		return "common/return";//메서드 하나로 처리
	}
	
	
	@GetMapping("/fav/del")
	public String delete (FavoriteVO vo, Model model) {
		model.addAttribute("result", service.delete(vo));
		return "common/return";
	}
	

}
