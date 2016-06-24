package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDto;
import dto.UpdateDao;

public class UpdateCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
 						
		return "/WEB-INF/MyPage/Update/MyPage_update.jsp";	

	}
}
