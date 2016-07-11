/*
 *  작성자 : 전현영
 *  설명 : 공지사항 등록 페이지로 이동하는 커맨드
 *   
 */

package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class GoNoticeInsertCommand implements Command {
	//공지사항 등록 페이지로이동
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		return "Notice_Insert.jsp";
	}

}
