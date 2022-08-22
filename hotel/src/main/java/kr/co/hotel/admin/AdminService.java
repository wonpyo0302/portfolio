package kr.co.hotel.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.host.HostVO;

public interface AdminService {
	
	boolean adminLogin(AdminVO avo,HttpSession sess);
	
	//------------------사용자 리스트 작성 형욱----------------------
	public Map guestListPaging(AdminVO vo);
	public List<GuestVO> guestList(AdminVO vo);
	
	//------------------대시보드 작성 원표--------------------------
	List<AdminVO> salesMonth();
	Model memberCount(Model model);
	//--------------호스트관리 및 승인여부 작성 이원표------------------
	List<HostVO> getHostList();
	
}
