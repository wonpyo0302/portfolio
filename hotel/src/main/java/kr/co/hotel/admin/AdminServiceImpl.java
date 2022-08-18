package kr.co.hotel.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminMapper amapper;
	@Override
	public boolean adminLogin(AdminVO avo, HttpSession sess) {
		boolean r= false;
		AdminVO loginInfo = amapper.adminLogin(avo);
		if(loginInfo != null) {
			r = true;
			sess.setAttribute("loginInfo_admin", loginInfo);
		}
		return r;
	}

}
