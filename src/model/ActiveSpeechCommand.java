/*
페이지 - 마이페이지_활동내역_참가한 강연
작성자 - 이주연
수정날짜 - 2016/06/26
설명 - 페이지 이동  
 */

package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Participation_Dto;
import mybean.BasicBean;

public class ActiveSpeechCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
				
		return "/WEB-INF/MyPage/Active/MyPage_active_speech.jsp";
	}
}
