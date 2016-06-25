/*
 *  작성자 : 전현영
 *  설명 : 회원가입 페이지로 이동하는 커맨드
 *   
 */

package model2;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import model.Command;

public class MoveSignUp implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		return "Sign_Up.jsp";
	}
	
}
