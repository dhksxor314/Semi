package model3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.BasicBean;

public class RequestreviewCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		session.setAttribute("taxType", req.getParameter("taxType"));
		session.setAttribute("settlementBankName", req.getParameter("settlementBankName"));
		session.setAttribute("settlementBankAccount", req.getParameter("settlementBankAccount"));
		session.setAttribute("settlementName", req.getParameter("settlementName"));
		session.setAttribute("job", req.getParameter("job"));
		session.setAttribute("intro", req.getParameter("intro"));
		session.setAttribute("message", req.getParameter("message"));
		session.setAttribute("phone", req.getParameter("phone"));
		
		return "/create/request-review.jsp";	
	}
}
