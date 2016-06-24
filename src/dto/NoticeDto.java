package dto;

public class NoticeDto {
	int notice_num;
	String title;
	String content;
	String reporting_date;
	int manage_num;
	int count;
	
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
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
	public String getReporting_date() {
		return reporting_date;
	}
	public void setReporting_date(String reporting_date) {
		this.reporting_date = reporting_date;
	}
	public int getManage_num() {
		return manage_num;
	}
	public void setManage_num(int manage_num) {
		this.manage_num = manage_num;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
