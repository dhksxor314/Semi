/*
페이지 - 마이페이지_활동내역_개설한 모임
작성자 - 이주연
수정날짜 - 2016/06/20
설명 - 페이지이동
 */

package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OpenCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		return "/WEB-INF/MyPage/Active/MyPage_active_open.jsp";	
	}
}
