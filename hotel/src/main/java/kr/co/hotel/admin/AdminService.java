package kr.co.hotel.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;


public interface AdminService {

	boolean adminLogin(AdminVO avo,HttpSession sess);
	
	//------------------대시보드 작성 원표--------------------------
	List<AdminVO> salesMonth();
	Model memberCount(Model model);
	
}
