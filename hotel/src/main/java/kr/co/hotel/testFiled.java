package kr.co.hotel;

import java.time.DayOfWeek;
import java.time.LocalDate;

public class testFiled {
	
	
	


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		  LocalDate now = LocalDate.now(); System.out.println(now);
		  
		  LocalDate tomorrow = now.plusDays(1); System.out.println(tomorrow);
		  
		  ///////////////////////////////////
		  
		  DayOfWeek day = now.getDayOfWeek(); 
		  System.out.println(day);
		  
		  DayOfWeek tday = tomorrow.getDayOfWeek(); 
		  System.out.println(tday);
		
	
		

	

	}

}
