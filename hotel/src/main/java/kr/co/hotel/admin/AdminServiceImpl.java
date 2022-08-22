package kr.co.hotel.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.guestboard.GuestBoardVO;
import kr.co.hotel.host.HostVO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminMapper amapper;

	
	@Override
	public List<AdminVO> salesMonth() {
		return amapper.salesMonth();
	}

	@Override
	public Model memberCount(Model model) {
		model.addAttribute("guestInfo",amapper.guestCount());
		model.addAttribute("hostInfo",amapper.hostCount());
		return model;
	}

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
