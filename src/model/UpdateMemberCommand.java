package model;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;
import dto.UpdateDao;
import mybean.BasicBean;

public class UpdateMemberCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		BasicBean basic = BasicBean.newInstance();
		UpdateDao dao = new UpdateDao();
		MemberDto dto = new MemberDto();	
		
		basic.setPath(req, "upload");
		basic.setMax(50*1024*1024);
		basic.setEncType("euc-kr");
		basic.setMulti(req);
		
		
		HttpSession session = req.getSession();
		int mem_num =(Integer)session.getAttribute("loginMem_num");

		dto.setMem_num(mem_num);
		
		dto.setPhone(basic.getMulti().getParameter("phone"));
		dto.setPassword(basic.getMulti().getParameter("password"));
		dto.setEmail(basic.getMulti().getParameter("email"));		
		dto.setInvite_agree(basic.getMulti().getParameter("invite_agree"));
		System.out.println(dto.getInvite_agree());
		dto.setImage(basic.getUpFileInfo());	
			
		dao.UpdateMemberList(dto);
		
		session.setAttribute("loginImage", dto.getImage());		
	
        return "/WEB-INF/MyPage/Update/MyPage_update.jsp";
         
	}
}
