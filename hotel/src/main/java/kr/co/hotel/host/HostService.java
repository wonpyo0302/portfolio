package kr.co.hotel.host;

import javax.servlet.http.HttpSession;

public interface HostService {

	int insert(HostVO hvo);
	int emailDupCheck(String host_email);
	int idDupCheck(String host_id);
	boolean HostloginCheck(HostVO hvo, HttpSession sess);
	HostVO findHostEmail(HostVO hvo);
	HostVO findHostPwd(HostVO hvo);
}
