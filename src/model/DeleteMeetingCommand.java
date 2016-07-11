/*
페이지 - 마이페이지_활동내역_참가한 모임_삭제
작성자 - 이주연
수정날짜 - 2016/06/26
설명 - 참가번호를 받아와 삭제  
 */

package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.DeleteDao_Active;
import dto.DeleteDao_Cart;

public class DeleteMeetingCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	    req.setCharacterEncoding("euc-kr");
		String url = null;
	    
	   int price  = Integer.parseInt(req.getParameter("price"));
	    
	   if(price == 0){
	    	String check  = req.getParameter("check");			
			DeleteDao_Active dao = new DeleteDao_Active();		
			dao.delete_meeting(Integer.parseInt(check));
			url ="/WEB-INF/MyPage/Active/MyPage_active_meeting.jsp";
			return url;
	    }else{
	    	url = "/WEB-INF/MyPage/Payment/MyPage_payment.jsp";
	    	return url;
	    }	
	}
}
