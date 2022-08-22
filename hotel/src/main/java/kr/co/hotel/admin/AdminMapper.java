package kr.co.hotel.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hotel.guest.GuestVO;
import kr.co.hotel.host.HostVO;

@Mapper
public interface AdminMapper {
	AdminVO adminLogin(AdminVO avo);
	
	List<GuestVO> guestListPaging(AdminVO vo);
	List<HostVO> hostListPaging();
	List<GuestVO> list(AdminVO vo);
	int count(AdminVO vo);
	
	List<AdminVO> salesMonth();
	List<AdminVO> guestCount();
	List<AdminVO> hostCount();
	List<HostVO> getHostList();
}
