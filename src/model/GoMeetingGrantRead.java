package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class GoMeetingGrantRead implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		int num = Integer.parseInt(req.getParameter("num"));
		
		return "/WEB-INF/manage/Meeting_Grant_Read.jsp?"+num;
	}
	
}
