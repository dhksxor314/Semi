/*
������ - ����������_��ٱ��ϳ���
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

import dto.DeleteDao_Active;

public class CartCommand implements model3.Command, Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			
		return "/WEB-INF/MyPage/Cart/MyPage_cart.jsp";	
	}
}
