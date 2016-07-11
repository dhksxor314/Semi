/*
 *  작성자 : 전현영
 *  설명 : 강사 승인 요청 리스트 페이지로 이동하는 커맨드
 *   
 */

package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class GoSpeakerGrant implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		return "/WEB-INF/manage/Speaker_Grant.jsp";
	}
	
}
