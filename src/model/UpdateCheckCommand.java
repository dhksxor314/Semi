/*
������ - ����������_��������
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - �������̵�  
 */

package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDto;
import dao.UpdateDao;

public class UpdateCheckCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
 						
		return "/WEB-INF/MyPage/Update/MyPage_update_check.jsp";	

	}
}
