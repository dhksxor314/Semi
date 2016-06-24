package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbcp.DBConnectionMgr;
import dao.BookmarkDao;
import dto.Bookmark_Dto;
import dto.DeleteDao_Bookmark;
import dto.Message_Dto;

public class MessageBoardCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		BookmarkDao dao = new BookmarkDao();
		Vector<Bookmark_Dto> dto = new Vector<Bookmark_Dto>();
		Vector<Message_Dto> dto_m = new Vector<Message_Dto>();

		HttpSession session = req.getSession();
		int mem_num =(Integer)session.getAttribute("loginMem_num");
		dto = dao.BookmarkList(mem_num); //북마크에서 강연자조회

		for (int i = 0; i < dto.size(); i++) {

			Bookmark_Dto list = dto.get(i);
			
			Message_Dto dto_msg = new Message_Dto();   

			dto_msg.setTitle(dto.get(i).getTitle());
			dto_msg.setSpeaker_num(dto.get(i).getSpeaker_num());
			dto_msg.setBookmark_num(dto.get(i).getBookmark_num());
			dto_msg.setMem_num(dto.get(i).getMem_num());
			dto_msg.setReporting_date(dto.get(i).getReporting_date());
			
			dto_m.add(dto_msg);

		}	//즐겨찾기에서 조회한 데이터를 메시지 dto에 넣어준다. 

		 for(int c = 0; c < dto_m.size(); c++){			 
			 
			 Message_Dto list = dto_m.get(c);			 
			 			 
			 	list.getMem_num();
			 	list.getTitle();
			 	list.getReporting_date();
			 	list.getName();
				list.setConfirmation("y");
				list.getBookmark_num();
		 }	
		 
		dao.MessageWrite(dto_m);		
		
		
		return "/WEB-INF/MyPage/Message/MyPage_message_board.jsp";
	}
}
