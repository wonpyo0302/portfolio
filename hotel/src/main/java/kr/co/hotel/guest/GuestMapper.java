package kr.co.hotel.guest;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GuestMapper {
	int insert(GuestVO gvo);
	int emailDupCheck(String guest_email);
	int idDupCheck(String guest_id);
	int hpDupCheck(String guest_hp);
	GuestVO guestloginCheck(GuestVO gvo);
	GuestVO findGuestEmail(GuestVO gvo);
	GuestVO findGuestPwd(GuestVO gvo);
	int updateTempGuestPwd(GuestVO gvo);
	GuestVO myinfoLogin(GuestVO gvo);
	int updatePwd(GuestVO gvo);
	int totalUpdate(GuestVO gvo);
}
