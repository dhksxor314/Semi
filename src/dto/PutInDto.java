package dto;

import java.sql.Date;

public class PutInDto {
        
	private int mem_num; 
	private String s_m;                 
	private int num;
	private int putIn_num; 	
	private String title;             
	private int price;                             
	private String image;
	private int point;
	private Date reporting_date;
	private int payment_option;
	
	public int getPayment_option() {
		return payment_option;
	}
	public void setPayment_option(int payment_option) {
		this.payment_option = payment_option;
	}
	public Date getReporting_date() {
		return reporting_date;
	}
	public void setReporting_date(Date reporting_date) {
		this.reporting_date = reporting_date;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getPutIn_num() {
		return putIn_num;
	}
	public void setPutIn_num(int putIn_num) {
		this.putIn_num = putIn_num;
	}
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}     
	
	
}	
