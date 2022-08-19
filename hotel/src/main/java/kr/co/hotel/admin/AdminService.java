package kr.co.hotel.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.hotel.guest.GuestVO;

public interface AdminService {
	
	boolean adminLogin(AdminVO avo,HttpSession sess);
	
	//------------------사용자 리스트 작성 형욱----------------------
	public Map guestListPaging(AdminVO vo);
	public List<GuestVO> guestList(AdminVO vo);
	
}
