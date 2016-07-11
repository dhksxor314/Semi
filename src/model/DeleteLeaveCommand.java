/*
페이지 - 마이페이지_회원탈퇴
작성자 - 이주연
수정날짜 - 2016/06/26
설명 - 회원번호를 받아와 삭제  
 */

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
		
		
		//참가테이블에 있는 회원번호 조회_현재 수정이 필요한 부분
		String num = (String)req.getParameter("num");	
		//mem = dao_a.ParticipantList(mem_num,Integer.parseInt(num));
		mem = dao_a.ParticipantList(mem_num, Integer.parseInt(num));
		
		//회원 탈퇴시 회원 삭제
		dao.deleteMember(mem_num);		
		
		//그 회원번호를 삭제하는 session
		session.invalidate();
		
		return "main.jsp"; 
						
	}
}
