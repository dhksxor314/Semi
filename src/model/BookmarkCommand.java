package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Message_Dto;
import dto.Speech_Meeting_Dto;

public class BookmarkCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Speech_Meeting_Dto dto = new Speech_Meeting_Dto();	
		
		if(dto.getTitle() == null){						
			return "/WEB-INF/MyPage/Bookmark/MyPage_bookmark.jsp";				
		}else{	
			return "/WEB-INF/MyPage/Bookmark/MyPage_bookmark2.jsp";	}
	}
}
