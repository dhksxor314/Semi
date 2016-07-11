package model2;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import model.Command;

public class OpenPoint implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		int mem_num = Integer.parseInt(req.getParameter("mem_num"));
		return "/WEB-INF/manage/Member_Point.jsp?mem_num="+mem_num;
	}
	
}
