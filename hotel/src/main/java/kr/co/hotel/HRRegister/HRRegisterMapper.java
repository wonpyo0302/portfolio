package kr.co.hotel.HRRegister;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper  
public interface HRRegisterMapper {
	
	public int insert(RoomVO vo);
	
	public int count(RoomVO vo);
	
	public List<RoomVO> list(RoomVO vo);
	
	public RoomVO view(int room_no);

	public int update (RoomVO vo);
	
	public int delete (int no);
	
	public int img_insert(RoomVO vo);
	
	public RoomVO get_hotelInfo(int host_no);
	
	
	
	
}
