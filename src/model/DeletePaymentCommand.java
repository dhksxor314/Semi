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
		
		String [] part_num = req.getParameterValues("part_num");
		
		if(part_num != null){

			
			for(int i=0; i < part_num.length; i++){
				
			    dto.setPayment_option(-1);
				dto.setPart_num(Integer.parseInt(part_num[i]));
				dao.UpdatePaymentList(dto);
			}
		}	
		System.out.println(part_num);
 
  	   
	return "/WEB-INF/MyPage/Payment/MyPage_payment.jsp";
	}
}
