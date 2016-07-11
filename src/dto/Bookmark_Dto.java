package dto;

import java.sql.Date;

public class Bookmark_Dto {

	private int speaker_num; 
	private String name; 
	private String field;                                 	
	private int mem_num;   
	private int Bookmark_num;	
	//강연이 있는 경우 강연명을 보여준다.
	private String title;  
	private Date reporting_date;
	
	public int getSpeaker_num() {
		return speaker_num;
	}
	public Date getReporting_date() {
		return reporting_date;
	}
	public void setReporting_date(Date reporting_date) {
		this.reporting_date = reporting_date;
	}
	public void setSpeaker_num(int speaker_num) {
		this.speaker_num = speaker_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getBookmark_num() {
		return Bookmark_num;
	}
	public void setBookmark_num(int bookmark_num) {
		Bookmark_num = bookmark_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	} 	

	
}
