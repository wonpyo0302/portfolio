package kr.co.hotel.host;

import javax.servlet.http.HttpSession;

public interface HostService {

	int insert(HostVO hvo);
	int emailDupCheck(String host_email);
	int idDupCheck(String host_id);
	int hpDupCheck(String host_hp);
	boolean HostloginCheck(HostVO hvo, HttpSession sess);
	HostVO findHostId(HostVO hvo);
	HostVO findHostPwd(HostVO hvo);
	HostVO myinfoLogin(HostVO hvo);
	int updatePwd(HostVO hvo);
	boolean totalUpdate(HostVO hvo);
	HostVO deleteHostInfo(HostVO hvo);
}
