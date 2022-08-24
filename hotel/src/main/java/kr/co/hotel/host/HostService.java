package kr.co.hotel.host;

import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.hotel.admin.AdminVO;

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
	
	//============이하 이원표 작성=============
	Map getHostList(AdminVO vo);
	int getHostCount(AdminVO vo);
	HostVO getView(HostVO vo);
	
	//============이하 빛찬 작성=============
	Map get_numbers (HostVO hvo);
}
