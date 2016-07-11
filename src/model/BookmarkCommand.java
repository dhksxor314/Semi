/*
페이지 - 마이페이지_즐겨찾기내역
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

import dto.Message_Dto;
import dto.Speech_Meeting_Dto;

public class BookmarkCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
						
			return "/WEB-INF/MyPage/Bookmark/MyPage_bookmark.jsp";				
	}
}
