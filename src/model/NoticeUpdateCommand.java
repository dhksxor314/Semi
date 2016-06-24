package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import dao.NoticeDao;
import dto.NoticeDto;

public class NoticeUpdateCommand implements Command{
	//공지사항 업데이트
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {

		req.setCharacterEncoding("euc-kr");
		
		NoticeDao dao = new NoticeDao();
		NoticeDto dto = new NoticeDto();
		
		int notice_num = Integer.parseInt(req.getParameter("notice_num"));
		
		dto.setContent(req.getParameter("content"));
		dto.setTitle(req.getParameter("title"));
		dto.setNotice_num(notice_num);

		dao.updateNotice(dto);

		return "Notice_Read.jsp?notice_num="+notice_num;
	}
	
}
