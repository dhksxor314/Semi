package model3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.BasicBean;

public class PaymentCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session=req.getSession();
		int num = Integer.parseInt(req.getParameter("num"));
		int price = Integer.parseInt(req.getParameter("price"));
		int cash=Integer.parseInt(req.getParameter("cash"));
		req.setAttribute("price", price);
		req.setAttribute("num", num);
		req.setAttribute("cash", cash);
		return "/join/payment.jsp";
	}
}
