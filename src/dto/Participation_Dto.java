package dto;

import java.sql.Date;

public class Participation_Dto {
        

	private int part_num;             	
	private String s_m;                 
	private int num;                
	private int max_person;  
	private String starttime; 
	private String endtime;  
	private String title;             
	private int price;                                              
	private int now_person;                          
	private int max; 
	private String image;                                                  
	private String place_name; 
	private Date reporting_date;               
	private int place_num;
	private String name;
	private int mem_num;
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getPayment_option() {
		return payment_option;
	}
	public void setPayment_option(int payment_option) {
		this.payment_option = payment_option;
	}
	private int payment_option;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getSpeaker_name() {
		return speaker_name;
	}
	public void setSpeaker_name(String speaker_name) {
		this.speaker_name = speaker_name;
	}
	private String speaker_name;
	private int speaker_num;           
		

	public String getS_m() {
		return s_m;
	}
	public void setS_m(String s_m) {
		this.s_m = s_m;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}

	public int getMax_person() {
		return max_person;
	}
	public void setMax_person(int max_person) {
		this.max_person = max_person;
	}
	public int getNow_person() {
		return now_person;
	}
	public void setNow_person(int now_person) {
		this.now_person = now_person;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getReporting_date() {
		return reporting_date;
	}
	public void setReporting_date(Date reporting_date) {
		this.reporting_date = reporting_date;
	}

	public int getPlace_num() {
		return place_num;
	}
	public void setPlace_num(int place_num) {
		this.place_num = place_num;
	}	
	public int getSpeaker_num() {
		return speaker_num;
	}
	public void setSpeaker_num(int speaker_num) {
		this.speaker_num = speaker_num;
	}
		
	public int getPart_num() {
		return part_num;
	}
	public void setPart_num(int part_num) {
		this.part_num = part_num;
	}
}
