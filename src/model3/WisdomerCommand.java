package model3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.BasicBean;

public class WisdomerCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		session.setAttribute("tickets", req.getParameter("tickets"));
		session.setAttribute("minTickets", req.getParameter("minTickets"));
		session.setAttribute("price", req.getParameter("price"));
		session.setAttribute("date", req.getParameter("date"));
		session.setAttribute("startTime", req.getParameter("startTime"));
		session.setAttribute("endTime", req.getParameter("endTime"));
		session.setAttribute("placeno", req.getParameter("placeno"));
		session.setAttribute("placeAddress", req.getParameter("placeAddress"));
		
		return "/create/wisdomer.jsp";	
	}
}
