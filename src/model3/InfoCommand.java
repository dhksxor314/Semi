package model3;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import join.listDao;
import join.listDto;
import mybean.BasicBean;

public class InfoCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		HttpSession session=req.getSession();
		
		String today = null;

		Date date = new Date();
		// 포맷변경 ( 년월일 시분초)
		SimpleDateFormat sdformat = new SimpleDateFormat("HH:mm");

		// Java 시간 더하기

		Calendar cal = Calendar.getInstance();

		cal.setTime(date);

		cal.add(Calendar.HOUR, 2);

		today = sdformat.format(cal.getTime());

		SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");
		String strdate = simpledate.format(date);
		req.setAttribute("num", req.getParameter("num"));
		
		req.setAttribute("strdate", strdate);
		req.setAttribute("today", today);
		
		return "/join/info.jsp";	
	}
}
