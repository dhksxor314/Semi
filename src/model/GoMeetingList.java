/*
 *  작성자 : 전현영
 *  설명 : 만남 리스트로 이동하는 Command
 *   
 */

package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class GoMeetingList implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		return "/WEB-INF/manage/Meeting_List.jsp";
	}

}
