package dto;

import java.sql.Date;

public class Payment_Dto {

      
	private Date reporting_date;       
	private int payment_option;       
	private int mem_num;             
	private String s_m;                  
	private int num;
	private String title; 
	private int price; 
	private int part_num;
		
	public int getPart_num() {
		return part_num;
	}
	public void setPart_num(int part_num) {
		this.part_num = part_num;
	}
	public Date getReporting_date() {
		return reporting_date;
	}
	public void setReporting_date(Date reporting_date) {
		this.reporting_date = reporting_date;
	}
	public int getPayment_option() {
		return payment_option;
	}
	public void setPayment_option(int payment_option) {
		this.payment_option = payment_option;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
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
	
	
	
	
}
