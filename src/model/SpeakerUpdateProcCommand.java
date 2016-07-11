package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;
import dto.SpeakerDto;
import dao.UpdateDao;
import mybean.BasicBean;

public class SpeakerUpdateProcCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		BasicBean basic = BasicBean.newInstance();
		UpdateDao dao = new UpdateDao();
		SpeakerDto dto = new SpeakerDto();	
		
		basic.setPath(req, "upload");
		basic.setMax(50*1024*1024);
		basic.setEncType("euc-kr");
		basic.setMulti(req);
				
		HttpSession session = req.getSession();
		int mem_num = (Integer) session.getAttribute("loginMem_num");		
		dto.setSpeaker_num(mem_num);
		
		dto.setPhone(basic.getMulti().getParameter("phone"));
		dto.setPassword(basic.getMulti().getParameter("password"));
		dto.setEmail(basic.getMulti().getParameter("email"));
		dto.setImage(basic.getUpFileInfo());
		
		dao.SpeakerUpdate(dto);
				
		session.setAttribute("loginImage", dto.getImage());	
		
		return "/WEB-INF/Speaker_MyPage/Update/MyPage_update.jsp";	
	}
}
