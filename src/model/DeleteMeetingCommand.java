package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.DeleteDao_Active;
import dto.DeleteDao_Cart;

public class DeleteMeetingCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	    req.setCharacterEncoding("euc-kr");
		
		String check  = req.getParameter("check");
		DeleteDao_Active dao = new DeleteDao_Active();
		
		dao.delete_meeting(Integer.parseInt(check));
		
		return "/WEB-INF/MyPage/Active/MyPage_active_meeting.jsp";		
	}
}
