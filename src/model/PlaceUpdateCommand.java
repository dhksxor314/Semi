/*
 *  작성자 : 전현영
 *  설명 : 장소 수정시 사용하는 커맨드
 *   
 */

package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import dao.PlaceDao;
import dto.PlaceDto;

public class PlaceUpdateCommand implements Command{
	//장소 수정
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		String place_num = req.getParameter("place_num");
		
		PlaceDao dao = new PlaceDao();
		
		PlaceDto dto = dao.getPlace(Integer.parseInt(place_num));
		dto.setPlace_name(req.getParameter("name"));
		dto.setPhone(req.getParameter("tel"));
		dto.setAddress(req.getParameter("addr"));
		dto.setCapacity(Integer.parseInt(req.getParameter("capacity")));
		dao.updatePlace(dto);		
		
		return "Place_List.jsp";
	}
	
}
