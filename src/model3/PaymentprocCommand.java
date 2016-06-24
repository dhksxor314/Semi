package model3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDao;
import mybean.BasicBean;
import pay.payDao;

public class PaymentprocCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		HttpSession session = req.getSession();
		String url=null;
		String cart1 = req.getParameter("cart1");
		int num = Integer.parseInt(req.getParameter("num"));
		String s_m = req.getParameter("s_m");
		int price = Integer.parseInt(req.getParameter("price"));
		int cash = Integer.parseInt(req.getParameter("cash"));
		int loginMem_num = Integer.parseInt(String.valueOf(session.getAttribute("loginMem_num")));
		if (cart1.equals("")) {
			int paymenttype = Integer.parseInt(req.getParameter("paymenttype"));
			payDao dao = new payDao();
			dao.insert(num, s_m, paymenttype, price-cash, loginMem_num, cash);
			dao.meetingupdate(num, loginMem_num, cash);
			url="control?cmd=joinsuccess";
		} else {
			CartDao dao = new CartDao();
			dao.insertcart(s_m, num, loginMem_num);
			url="control?cmd=joinlist";
		}
		return url;
	}
}
