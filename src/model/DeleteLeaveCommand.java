/*
������ - ����������_ȸ��Ż��
�ۼ��� - ���ֿ�
������¥ - 2016/06/26
���� - ȸ����ȣ�� �޾ƿ� ����  
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
		
		
		//�������̺� �ִ� ȸ����ȣ ��ȸ_���� ������ �ʿ��� �κ�
		String num = (String)req.getParameter("num");	
		//mem = dao_a.ParticipantList(mem_num,Integer.parseInt(num));
		mem = dao_a.ParticipantList(mem_num, Integer.parseInt(num));
		
		//ȸ�� Ż��� ȸ�� ����
		dao.deleteMember(mem_num);		
		
		//�� ȸ����ȣ�� �����ϴ� session
		session.invalidate();
		
		return "main.jsp"; 
						
	}
}
