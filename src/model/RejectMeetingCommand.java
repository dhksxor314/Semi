/*
 *  작성자 : 전현영
 *  설명 : 만남을 거부할 시 사용하는 커맨드
 *   
 */

package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import dao.MeetingDao;

public class RejectMeetingCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		MeetingDao dao = new MeetingDao();
		
		int num = Integer.parseInt(req.getParameter("num"));
		dao.rejectMeeting(num, "m");
		
		return "Meeting_Grant.jsp";
	}
	
}
