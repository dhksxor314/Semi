/*
������ - ����������_���ã�⳻��
�ۼ��� - ���ֿ�
������¥ - 2016/06/26
���� - ������ �̵�  
 */

package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Message_Dto;
import dto.Speech_Meeting_Dto;

public class BookmarkCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
						
			return "/WEB-INF/MyPage/Bookmark/MyPage_bookmark.jsp";				
	}
}
