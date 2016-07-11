/*
 *  작성자 : 전현영
 *  설명 : 공지사항 읽기로 이동하는 커맨드
 *   
 */

package model2;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import model.Command;

public class MoveNoticeRead implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		int notice_num = Integer.parseInt(req.getParameter("notice_num"));
		
		return "Notice_Read.jsp?notice_num="+notice_num;
	}
	
}
