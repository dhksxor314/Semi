/*
페이지 - 마이페이지_장바구니내역
작성자 - 이주연
수정날짜 - 2016/06/26
설명 - 페이지 이동  
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
