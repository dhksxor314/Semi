/*
������ - ����������_��ٱ��ϳ���
�ۼ��� - ���ֿ�
������¥ - 2016/06/26
���� - ������ �̵�  
 */

package model3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CartCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			
		return "/WEB-INF/MyPage/Cart/MyPage_cart.jsp";	
	}
}
