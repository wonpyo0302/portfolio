package kr.co.hotel.host;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HostMapper {
	int insert (HostVO hvo);
	int emailDupCheck(String Host_email);
	int idDupCheck(String Host_id);
	HostVO HostloginCheck(HostVO hvo);
	HostVO findHostEmail(HostVO hvo);
	HostVO findHostPwd(HostVO hvo);
	int updateTempHostPwd(HostVO hvo);
}
