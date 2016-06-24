package dto;

import java.util.Date;

public class Message_Dto {

	private int mem_num;  
	private String name;
	private String title;               
	private String content;              
	private Date reporting_date;         
	private int msg_num;             
	private int Bookmark_num;        
	private String Confirmation;
	private int Speaker_num;
  
public int getMem_num() {
	return mem_num;
}
public void setMem_num(int mem_num) {
	this.mem_num = mem_num;
}
public String getName() {
	return name;
}
public int getSpeaker_num() {
	return Speaker_num;
}
public void setSpeaker_num(int speaker_num) {
	Speaker_num = speaker_num;
}
public void setName(String name) {
	this.name = name;
}

public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Date getReporting_date() {
	return reporting_date;
}
public void setReporting_date(Date reporting_date) {
	this.reporting_date = reporting_date;
}
public int getMsg_num() {
	return msg_num;
}
public void setMsg_num(int msg_num) {
	this.msg_num = msg_num;
}
public int getBookmark_num() {
	return Bookmark_num;
}
public void setBookmark_num(int bookmark_num) {
	Bookmark_num = bookmark_num;
}
public String getConfirmation() {
	return Confirmation;
}
public void setConfirmation(String confirmation) {
	Confirmation = confirmation;
}         
	
	
}
