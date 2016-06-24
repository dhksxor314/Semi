package model3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.BasicBean;

public class SectionCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		BasicBean basic = BasicBean.newInstance();
		
		basic.setPath(req, "upload");
		basic.setMax(50 * 1024 * 1024);
		basic.setEncType("euc-kr");
		basic.setMulti(req);
		
		String title = "", category = "", description = "", img = "";

		if (basic.getMulti().getParameter("title").length() > 0) {
			title = basic.getMulti().getParameter("title");

		} else {
			title = "";
		}
		if (basic.getMulti().getParameter("category") != null) {
			category = basic.getMulti().getParameter("category");
		} else {
			category = "";
		}
		if (basic.getMulti().getParameter("description").length() > 0) {
			description = basic.getMulti().getParameter("description");
		} else {
			description = "";
		}
		if (basic.getUpFileInfo() != null) {
			img = basic.getUpFileInfo();
		} else {
			img = "";
		}
		
		HttpSession session=req.getSession();
		session.setAttribute("title", title);
		session.setAttribute("category", category);
		session.setAttribute("description", description);
		session.setAttribute("img", img);
		
		return "/create/section.jsp";	
	}
}
