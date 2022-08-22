package kr.co.hotel.admin;

import java.util.List;

import org.springframework.ui.Model;


public interface AdminService {

	
	//------------------대시보드 작성 원표--------------------------
	List<AdminVO> salesMonth();
	Model memberCount(Model model);
	
}
