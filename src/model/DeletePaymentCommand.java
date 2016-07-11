/*
페이지 - 마이페이지_결제내역
작성자 - 이주연
수정날짜 - 2016/06/26
설명 - 참여번호를 받아와 삭제  
 */

package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PaymentDao;
import dto.DeleteDao_Cart;
import dto.Payment_Dto;

public class DeletePaymentCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("euc-kr");

		PaymentDao dao = new PaymentDao();
		Payment_Dto dto = new Payment_Dto();

		String part_num = req.getParameter("part_num");
		
		if (part_num != null) {

			dto.setPayment_option(-1);
			dto.setPart_num(Integer.parseInt(part_num));
			dao.UpdatePaymentList(dto);
		}

		return "/WEB-INF/MyPage/Payment/MyPage_payment.jsp";
	}
}
