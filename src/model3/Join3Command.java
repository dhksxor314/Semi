package model3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import create.createDao;
import dao.CartDao;
import mybean.BasicBean;

public class Join3Command implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session=req.getSession();

		int num = Integer.parseInt(req.getParameter("num"));
		int cash=0;
		if(req.getParameter("inputCash")==""){
			cash=0;
		}else{
			cash=Integer.parseInt(req.getParameter("inputCash"));
		}
		req.setAttribute("paymentType", req.getParameter("paymentType"));
		req.setAttribute("num", num);
		req.setAttribute("cash", cash);
		System.out.println("3");
		return "/join/join3.jsp";
	}
}
