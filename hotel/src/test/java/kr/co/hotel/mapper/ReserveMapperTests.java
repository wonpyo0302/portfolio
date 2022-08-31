package kr.co.hotel.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.hotel.reserve.ReserveMapper;
import kr.co.hotel.reserve.ReserveVO;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/resources/config/servlet-context.xml")
@Slf4j
public class ReserveMapperTests {

	@Autowired
	private ReserveMapper mapper;

	//@Test
	public void testObj() {
		
	}
	
	@Test
	public void count() {
		ReserveVO vo = new ReserveVO();	
		vo.setGuest_no(3);
		mapper.list(vo);
			}
}
