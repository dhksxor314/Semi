/*
������ - ����������_ȸ��Ż��
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - �������̵�  
 */

package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LeaveCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		return "/WEB-INF/MyPage/Leave/MyPage_leave.jsp";
	}
}
