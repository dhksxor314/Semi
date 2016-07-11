package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Command;

public class MoveFindPlace implements Command{
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp){
		
		return "/WEB-INF/manage/FindPlace.jsp";
	}
}
