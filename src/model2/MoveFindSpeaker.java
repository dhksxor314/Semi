package model2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import model.Command;

public class MoveFindSpeaker implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp){
		
		return "/WEB-INF/manage/FindSpeaker.jsp";
	}
	
}
