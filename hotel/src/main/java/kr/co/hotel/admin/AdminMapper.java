package kr.co.hotel.admin;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
	AdminVO adminLogin(AdminVO avo);
}
