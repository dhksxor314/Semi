/*
 *  작성자 : 전현영
 *  설명 : 회원들이 요청한 만남을 승인하는 작업을 하는 Command
 *   
 */

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
		//m은 만남을 의미
		dao.grantMeeting(num, "m");
		
		return "/WEB-INF/manage/Meeting_Grant.jsp";
	}

}
