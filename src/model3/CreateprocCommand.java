package model3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import create.createDao;
import create.createDto;
import mybean.BasicBean;

public class CreateprocCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		HttpSession session=req.getSession();
		
		createDto cdto=new createDto();
		cdto.setTitle((String)session.getAttribute("title"));
		cdto.setReporting_date((String)session.getAttribute("date"));
		cdto.setDescription((String)session.getAttribute("description"));
		cdto.setEndtime((String)session.getAttribute("endTime"));
		cdto.setMax_person(Integer.parseInt((String)session.getAttribute("tickets")));
		cdto.setMin_person(Integer.parseInt((String)session.getAttribute("minTickets")));
		cdto.setStarttime((String)session.getAttribute("startTime"));
		cdto.setRegion((String)session.getAttribute("category"));
		cdto.setImage((String)session.getAttribute("img"));
		cdto.setNow_person(0);
		cdto.setPrice(Integer.parseInt((String)session.getAttribute("price")));
		cdto.setProgression("y");
		cdto.setApproval("n");
		cdto.setPlace_num(Integer.parseInt((String)session.getAttribute("placeno")));
		cdto.setIntro((String)session.getAttribute("intro"));
		cdto.setJob((String)session.getAttribute("job"));
		cdto.setMessage((String)session.getAttribute("message"));
		cdto.setBankaccount(Integer.parseInt((String)session.getAttribute("settlementBankAccount")));
		cdto.setBank((String)session.getAttribute("settlementBankName"));
		cdto.setAccountholder((String)session.getAttribute("settlementName"));

		String loginMem_num=String.valueOf(session.getAttribute("loginMem_num"));
		cdto.setMem_num(Integer.parseInt(loginMem_num));
		createDao cdao=new createDao();
		cdao.insertmetting(cdto);
		session.removeAttribute("title");
		session.removeAttribute("date");
		session.removeAttribute("description");
		session.removeAttribute("endTime");
		session.removeAttribute("minTickets");
		session.removeAttribute("startTime");
		session.removeAttribute("category");
		session.removeAttribute("img");
		session.removeAttribute("price");
		session.removeAttribute("placeno");
		session.removeAttribute("intro");
		session.removeAttribute("job");
		session.removeAttribute("message");
		session.removeAttribute("settlementBankAccount");
		session.removeAttribute("settlementBankName");
		session.removeAttribute("settlementName");

		
		return "/create/list.jsp";	
	}
}
