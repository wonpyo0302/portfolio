package kr.co.hotel.guest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.hotel.admin.AdminVO;

public interface GuestService {

	int insert(GuestVO gvo);
	int emailDupCheck(String guest_email);
	int idDupCheck(String guest_id);
	int hpDupCheck(String guest_hp);
	boolean guestloginCheck(GuestVO gvo, HttpSession sess);
	GuestVO findGuestId(GuestVO gvo);
	GuestVO findGuestPwd(GuestVO gvo);
	GuestVO myinfoLogin(GuestVO gvo);
	int updatePwd(GuestVO gvo);
	boolean totalUpdate(GuestVO gvo);
	GuestVO deleteGuestInfo(GuestVO gvo);

	//=========admin guestlist 추가===================
	public Map guestListPaging(AdminVO vo);

}

