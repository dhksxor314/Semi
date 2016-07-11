/*
 *  작성자 : 전현영
 *  설명 : 비밀번호 찾기로 이동하는 커맨드
 *   
 */

package model2;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import model.Command;

public class MoveFindPw implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {

		return "Find_Password.jsp";
	}
	
}
