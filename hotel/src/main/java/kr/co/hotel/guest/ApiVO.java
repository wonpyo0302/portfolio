package kr.co.hotel.guest;


import org.json.simple.JSONObject;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApiVO {
	
	private boolean result;
	private String bank_code_std;
	private String account_num;
	private String account_holder_info;
	private String account_holder_name;
}
