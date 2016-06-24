package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.DeleteDao_Active;
import dto.DeleteDao_Bookmark;
import dto.DeleteDao_Cart;

public class DeleteBookmarkCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	    req.setCharacterEncoding("euc-kr");
		
		String check  = req.getParameter("check");
		DeleteDao_Bookmark dao = new DeleteDao_Bookmark();
		
		dao.delete_bookmark(Integer.parseInt(check));
		
		return "/WEB-INF/MyPage/Bookmark/MyPage_bookmark.jsp";		
	}
}
