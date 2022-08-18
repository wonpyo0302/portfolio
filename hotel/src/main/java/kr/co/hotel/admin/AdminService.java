package kr.co.hotel.admin;

import javax.servlet.http.HttpSession;

public interface AdminService {
	
	boolean adminLogin(AdminVO avo,HttpSession sess);
}
