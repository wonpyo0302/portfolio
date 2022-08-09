package kr.co.hotel.HRRegister;

import java.util.List;
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

import util.ImgHandling;

@Controller
public class HRRegisterController {

	@Autowired
	HRRegisterService service;
	
	
	//on going
	@GetMapping("/room/index.do")
	public String index(Model model, RoomVO vo, HttpSession sess, HttpServletRequest req) {
		System.out.println(req.getRealPath("/upload"));
		HostMemberVO loginInfo1 = new HostMemberVO();// demo data
		loginInfo1.setHost_no(1);//demo data
		loginInfo1.setHost_name("호스트 ");//demo data
		sess.setAttribute("loginInfo", loginInfo1);
		HostMemberVO Host_loginInfo = (HostMemberVO) sess.getAttribute("loginInfo");
		
		
		Map map = service.index(vo);
		System.out.println("map 확인 : " + map);
		model.addAttribute("point", map);
		 Map m =service.index(vo);
		 System.out.println("리스트 확인 : "+ m.get("list"));
		
		
		model.addAttribute("data", service.index(vo));
		return "room/index";//검색...포함?
	}
	
	@GetMapping("/room/write.do")
	public String write() {
		//로그인세션이 없으면 들어갈 수 없도록 처리
		
		return"/room/write";
	}
	
	@PostMapping("/room/insert.do")
	public String insert(RoomVO vo, Model model, @RequestParam("filename") List<MultipartFile> filename, HttpServletRequest req ) {
		
		HostMemberVO loginInfo1 = new HostMemberVO();// demo data
		HttpSession sess = req.getSession();
		sess.setAttribute("loginInfo", loginInfo1);

		//세션에서 host_no를 가져옴, host_no로 hotel테이블에서 hotel_no를 가져옴
		HostMemberVO Host_loginInfo = (HostMemberVO) sess.getAttribute("loginInfo");
		Host_loginInfo.setHost_no(1);//demo data
		vo.setHost_no(Host_loginInfo.getHost_no());
		RoomVO hotelInfo = service.get_hotelInfo(vo.getHost_no());
		vo.setHotel_no(hotelInfo.getHotel_no());   
		vo.setImage_type("ROOM");
		ImgHandling ih = new ImgHandling();//파일명을 org와 real 구분 후, map에 담아 반환하고 파일을 저장
		
		
		if(service.insert(vo)) {
			RoomVO latest =service.get_roomInfo();//바로 윗줄 insert 실행시 발생되는 room_no를 구해와 image테이블에 room_no를 같이 insert함
			vo.setRoom_no(latest.getRoom_no());
			
			//이미지 insert처리
			if(!filename.get(0).isEmpty()) {//filename이 비어있는지 확인
				for(int i=0; i<filename.size(); i++) {
					Map map = ih.imghandle(filename.get(i), req);
					vo.setFilename_org((String)map.get("filename_org"));
					vo.setFilename_real((String)map.get("filename_real"));
					vo.setImage_order(i);
					boolean r= service.img_insert(vo);
					System.out.println("imgInsert : " + r);
				}
			}
			
			model.addAttribute("msg", "정상적으로 저장되었습니다");
			model.addAttribute("url", "index.do");
			return "common/alert";
		}else {
			model.addAttribute("msg", "저장 실패하였습니다.");
			return "common/alert";
		}
		
	}
	
	
	@GetMapping("/room/view.do")
	public String view(RoomVO vo, Model model, HttpServletRequest req ) {
		RoomVO data = service.view(vo.getRoom_no());
		List<RoomVO> imgList = service.get_imgList(vo.getRoom_no());
		model.addAttribute("data", data);
		model.addAttribute("imgList", imgList);
		
		String path = req.getRealPath("/upload/");
		model.addAttribute("path", path);
		
		
		return "room/view";
		
	}
	
	/*
	@GetMapping("/room/edit.do")
	public String edit(RoomVO vo, Model model) {
		RoomVO data = service.edit(vo.getNo());
		model.addAttribute("data", data);
		return "room/edit";
		

	}
	
	 @PostMapping("/room/update.do")	
	 public String update(RoomVO vo, Model model) {
		 if(service.update(vo)) {
			 model.addAttribute("msg","정상적으로 수정되었습니다");
			 model.addAttribute("url","view.do?no="+vo.getNo());
			 return"common/alert";
		 }else {
			 model.addAttribute("msg","수정 실패");
			 return"common/alert";
		 }
	 }
	 	 */
	 @GetMapping("/room/delete.do")	
	 public String delete(RoomVO vo, Model model) {
		 if(service.delete(vo.getRoom_no())) {
			 model.addAttribute("msg","정상적으로 삭제되었습니다");
			 model.addAttribute("url","index.do");
			 return"common/alert";
		 }else {
			 model.addAttribute("msg","삭제 실패");
			 return"common/alert";
		 }
	 }

	
	
}
