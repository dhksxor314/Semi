/*
 *  작성자 : 전현영
 *  설명 : 장소 수정페이지로 이동하는 커맨드
 *   
 */

package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class GoPlaceInsert implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {

		return "/WEB-INF/manage/Place_Insert.jsp";
	}
	
}
