package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import dao.MeetingDao;

public class GrantMeetingCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		int num = Integer.parseInt(req.getParameter("num"));
		MeetingDao dao = new MeetingDao();
		dao.grantMeeting(num, "m");
		
		return "/WEB-INF/manage/Meeting_Grant.jsp";
	}

}
