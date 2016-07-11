/*
페이지 - 마이페이지_쪽지함_메시지_삭제
작성자 - 이주연
수정날짜 - 2016/06/20
설명 - 메시지번호를 받아와 삭제  
 */

package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbcp.DBConnectionMgr;
import dao.BookmarkDao;
import dto.DeleteDao_Bookmark;

public class DeleteMessageBoardCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
	    req.setCharacterEncoding("euc-kr");
	    
	  	String[] msg_num  = req.getParameterValues("msg_num");
		DeleteDao_Bookmark dao = new DeleteDao_Bookmark();	
		
		for(int i=0; i < msg_num.length; i++){
			dao.delete_message(Integer.parseInt(msg_num[i]));					
		}
				
		return "/WEB-INF/MyPage/Message/MyPage_message_board.jsp";
	}
}
