/*
 *  작성자 : 전현영
 *  설명 : 공지사항으로 이동하는 커맨드
 *   
 */

package model2;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import model.Command;

public class MoveNotice implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		return "Notice.jsp";
	}
	
}
