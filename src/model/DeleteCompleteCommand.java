/*
페이지 - 마이페이지_활동내역_완료된 만남_삭제
작성자 - 이주연
수정날짜 - 2016/06/26
설명 - 완료된 만남인 경우 30일 이후 자동적으로 삭제되도록 한다.
 */

package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.DeleteDao_Active;
import dto.DeleteDao_Cart;

public class DeleteCompleteCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		 	req.setCharacterEncoding("euc-kr");
		 	
		 	String num = req.getParameter("num");
		 	String s_m = req.getParameter("s_m");
		 	
			DeleteDao_Active dao = new DeleteDao_Active();
			
			dao.delete_complete(Integer.parseInt(num), s_m);
		
		return "/WEB-INF/MyPage/Active/MyPage_active_complete.jsp";	
	}
}
