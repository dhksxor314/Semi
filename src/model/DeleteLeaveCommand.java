package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.ActiveDao;
import dto.MemberDto;

public class DeleteLeaveCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		ActiveDao dao_a = new ActiveDao();
		Vector<MemberDto> mem = new Vector<MemberDto>();	
		
		HttpSession session = req.getSession();		
		int mem_num =(Integer)session.getAttribute("loginMem_num");
		
		//참가테이블에 있는 회원번호 조회		
		mem = dao_a.ParticipantList(mem_num);
			
		//회원 탈퇴시 회원 삭제하는거 
		dao.deleteMember(mem_num);		
		
		//그 회원번호를 삭제하는 session
		session.invalidate();
		
		//삭제는 되는데 main.jsp로 돌아왔는데 로그인 되어있는걸로 돌아옴
		
		return "main.jsp"; 
						
	}
}
