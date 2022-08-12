package kr.co.hotel.host;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HostMapper {
	int insert (HostVO hvo);
	int emailDupCheck(String host_email);
	int idDupCheck(String host_id);
	int hpDupCheck(String host_hp);
	HostVO hostloginCheck(HostVO hvo);
	HostVO findHostEmail(HostVO hvo);
	HostVO findHostPwd(HostVO hvo);
	int updateTempHostPwd(HostVO hvo);
	HostVO myinfoLogin(HostVO hvo);
}
