package kr.co.hotel.host;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.admin.AdminVO;
import kr.co.hotel.main.HotelVO;

@Mapper
public interface HostMapper {
	int insert (HostVO hvo);
	int emailDupCheck(String host_email);
	int idDupCheck(String host_id);
	int hpDupCheck(String host_hp);
	HostVO hostloginCheck(HostVO hvo);
	HostVO findHostId(HostVO hvo);
	HostVO findHostPwd(HostVO hvo);
	int updateTempHostPwd(HostVO hvo);
	HostVO myinfoLogin(HostVO hvo);
	int updatePwd(HostVO hvo);
	int totalUpdate(HostVO hvo);
	HostVO deleteHostInfo(HostVO hvo);
	int fakeDelete (HostVO hvo);
	
	//==========이하 이원표 작성============
	List<HostVO> getHostList(AdminVO vo);
	int getHostCount(AdminVO vo);
	HostVO getView(HostVO vo);
	
	//==========이하 빛찬 작성============
	
	int reserve_count (int hotel_no);
	int daily_sales (int hotel_no);
	HotelVO review_count(int host_no);
}
