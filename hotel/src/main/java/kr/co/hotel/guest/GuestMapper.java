package kr.co.hotel.guest;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.admin.AdminVO;

@Mapper
public interface GuestMapper {
	int insert(GuestVO gvo);
	int emailDupCheck(String guest_email);
	int idDupCheck(String guest_id);
	int hpDupCheck(String guest_hp);
	GuestVO guestloginCheck(GuestVO gvo);
	GuestVO findGuestId(GuestVO gvo);
	GuestVO findGuestPwd(GuestVO gvo);
	int updateTempGuestPwd(GuestVO gvo);
	GuestVO myinfoLogin(GuestVO gvo);
	int updatePwd(GuestVO gvo);
	int totalUpdate(GuestVO gvo);
	GuestVO deleteGuestInfo(GuestVO gvo);
	int fakeDelete(GuestVO gvo);
	
	//=========admin guestlist 추가===================
	List<GuestVO> listPaging(AdminVO vo);
	int count(AdminVO vo);
	GuestVO guestlist(GuestVO vo);
}
