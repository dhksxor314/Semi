package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;
import dto.SpeakerDto;
import dto.UpdateDao;
import mybean.BasicBean;

public class SpeakerCompleteCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				
		
		return "/WEB-INF/Speaker_MyPage/Active/MyPage_active_complete.jsp";	
	}
}
