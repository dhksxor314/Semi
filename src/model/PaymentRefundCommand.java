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


public class PaymentRefundCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
 						
		return "/WEB-INF/MyPage/Payment/MyPage_refund.jsp";	

	}
}
