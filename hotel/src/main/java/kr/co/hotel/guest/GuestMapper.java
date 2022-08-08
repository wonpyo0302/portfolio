package kr.co.hotel.guest;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
@Mapper

public interface GuestMapper {
	GuestVO loginCheck(GuestVO vo); // 로그인
	
}
