package kr.co.hotel.favorite;

import java.sql.Timestamp;
import java.util.List;

import kr.co.hotel.HRRegister.ImageVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//or @Data
public class FavoriteVO {
	
	private int favorite_no;
	private int guest_no;
	
	private int hotel_no;
	
	private int host_no;
	private String hotel_name;
	private String addr;
	private String sec_addr;
	private String tel;
	private int isConfirm;
	private String hotel_content;
	private String reject;
	private int state_code;
	private String state_name;
	private int district_code;
	private String district_name;
	private String lat;
	private String lot;
	
	private int avgScore;
	private int totalReview;
	private int totalLike;
	
	private List<ImageVO> imageList;
	private String image_type;
	private int lowPrice;
	private String filename;
	private String filename_org;
	
	
	//페이지 및 검색
	private int page;
	private String stype;
	private String sword;
	
	private int startIdx;
	private int pageRow;
	
	public FavoriteVO() {
//		this.page = 1;
//		this.pageRow = 10;
		this(1, 10);
	}
	
	public FavoriteVO(int page, int pageRow) {
		this.page = page;
		this.pageRow = pageRow;
	}
	

}
