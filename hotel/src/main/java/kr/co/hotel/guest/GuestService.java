package kr.co.hotel.guest;

import javax.servlet.http.HttpSession;

public interface GuestService {

	int insert(GuestVO gvo);
	int emailDupCheck(String guest_email);
	int idDupCheck(String guest_id);
	boolean guestloginCheck(GuestVO gvo, HttpSession sess);
	GuestVO findGuestEmail(GuestVO gvo);
	GuestVO findGuestPwd(GuestVO gvo);
}
