/*
������ - ����������_Ȱ������_������ ����_����
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - ������ȣ�� �޾ƿ� ����  
 */

package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.DeleteDao_Active;

public class DeleteOpenCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	    req.setCharacterEncoding("euc-kr");
		
		String check  = req.getParameter("check");
		DeleteDao_Active dao = new DeleteDao_Active();
		
		dao.delete_open(Integer.parseInt(check));

		return "/WEB-INF/MyPage/Active/MyPage_active_open.jsp";
	}
}
