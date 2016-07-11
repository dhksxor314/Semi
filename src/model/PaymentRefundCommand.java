/*
페이지 - 마이페이지_정보수정
작성자 - 이주연
수정날짜 - 2016/06/20
설명 - 페이지이동  
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
