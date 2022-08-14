package kr.co.hotel.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.hotel.HRRegister.HRRegisterMapper;
import kr.co.hotel.HRRegister.ImageVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/resources/config/servlet-context.xml")
@Slf4j
@AllArgsConstructor
public class BoardMapperTests {

	HRRegisterMapper mapper;
	
	@Test
	public void imageInsert() {
		ImageVO vo = new ImageVO();
		for(int i=0; i<300; i++) {
			vo.setFilename_org("h1");
			vo.setHotel_no(i);
			mapper.img_insert(vo);
			System.out.println(vo);
		}
}
}
