/*
 *  �ۼ��� : ������
 *  ���� : �������� ���
 *   
 */

package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import dao.NoticeDao;
import dto.NoticeDto;

public class NoticeInsertCommand implements Command{
	//�������� ���
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		req.setCharacterEncoding("euc-kr");
		
		NoticeDao dao = new NoticeDao();
		NoticeDto dto = new NoticeDto();
		
		HttpSession session = req.getSession();
		
		dto.setNotice_num((Integer)session.getAttribute("managerNum"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		
		dao.insertNotice(dto);

		return "Notice.jsp";
	}
	
}
