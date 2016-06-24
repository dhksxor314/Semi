package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class GoSpeakerGrantRead implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		int speaker_num = Integer.parseInt(req.getParameter("speaker_num"));
		
		return "/WEB-INF/manage/Speaker_Grant_Read.jsp?speaker_num="+speaker_num;
	}
	
}
