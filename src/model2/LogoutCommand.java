/*
 *  작성자 : 전현영
 *  설명 : 로그아웃 커맨드
 *  	  메인페이지로 돌아갔을 때 url이 처음에 main.jsp로 들어왔을 때랑 다르므로 사용하지 않고 있다.
 *   
 */

package model2;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import model.Command;

public class LogoutCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		return "main.jsp";
	}

}
