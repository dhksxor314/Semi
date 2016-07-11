/*
페이지 - 마이페이지_장바구니내역_삭제
작성자 - 이주연
수정날짜 - 2016/06/26
설명 - 장바구니번호를 받아와서 삭제한다.  
 */

package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.DeleteDao_Cart;

public class DeleteCartCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("euc-kr");
		String[] check = req.getParameterValues("check");
		
		if(check != null){
			DeleteDao_Cart dao = new DeleteDao_Cart();
			
			for(int i=0; i < check.length; i++){
				dao.delete_cart(Integer.parseInt(check[i]));				
			}
		}
		return "/WEB-INF/MyPage/Cart/MyPage_cart.jsp";
	}	
}
